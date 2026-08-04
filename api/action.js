"use strict";
const build = require("../lib/build.js");

// In-memory per-instance rate limiting. Vercel serverless functions are stateless across
// cold starts and can run on multiple concurrent instances, so this is a deterrent, not a hard
// distributed guarantee. Good enough for a low-traffic personal tool; if this ever needs to be
// airtight, move the counters to Vercel KV / Upstash Redis instead of process memory.
const WINDOW_MS = 60000, MAX_REQ = 30;
const BLOCK_MS = 5 * 60000;
const MAX_TRACKED_IPS = 5000;
const byIp = new Map();

function getIp(req) {
  const xf = req.headers["x-forwarded-for"];
  if (xf) return String(xf).split(",")[0].trim();
  return (req.socket && req.socket.remoteAddress) || "unknown";
}
function record(ip) {
  if (byIp.size > MAX_TRACKED_IPS) byIp.clear(); // crude safety valve against unbounded growth
  let rec = byIp.get(ip);
  if (!rec) { rec = { count: 0, windowStart: Date.now(), blockUntil: 0 }; byIp.set(ip, rec); }
  return rec;
}
function rateLimited(ip) {
  const now = Date.now();
  const rec = record(ip);
  if (rec.blockUntil && now < rec.blockUntil) return Math.ceil((rec.blockUntil - now) / 1000);
  if (now - rec.windowStart > WINDOW_MS) { rec.count = 0; rec.windowStart = now; }
  rec.count++;
  if (rec.count > MAX_REQ) { rec.blockUntil = now + BLOCK_MS; return Math.ceil(BLOCK_MS / 1000); }
  return 0;
}

const MAX_BODY_CHARS = 300000;
const MAX_FIELD_CHARS = 20000;
function validatePayload(body) {
  if (JSON.stringify(body || {}).length > MAX_BODY_CHARS) return "Request too large";
  const cfg = body && body.cfg;
  if (cfg) {
    if (String(cfg.customServerCode || "").length > MAX_FIELD_CHARS) return "Custom server code too long";
    if (String(cfg.customClientCode || "").length > MAX_FIELD_CHARS) return "Custom client code too long";
  }
  return null;
}

module.exports = async function handler(req, res) {
  if (req.method !== "POST") {
    res.status(405).json({ error: "POST only" });
    return;
  }

  const ip = getIp(req);
  const retryAfter = rateLimited(ip);
  if (retryAfter) {
    res.setHeader("Retry-After", String(retryAfter));
    res.status(429).json({ error: "Too many requests, try again later" });
    return;
  }

  const body = req.body || {};

  const badPayload = validatePayload(body);
  if (badPayload) {
    res.status(413).json({ error: badPayload });
    return;
  }

  try {
    if (body.type === "modules") {
      res.status(200).json({ modules: build.MODULES, version: build.VERSION });
      return;
    }
    if (body.type === "setup") {
      const items = build.buildSetup(body.cfg || {});
      res.status(200).json({ items });
      return;
    }
    if (body.type === "sizeReport") {
      const cfg = body.cfg || {};
      const curMods = cfg.mods || {};
      const baseCfg = Object.assign({}, cfg, { mods: {} });
      build.MODULES.forEach(function (m) { if (m.flag) baseCfg.mods[m.key] = false; });
      const baseServer = build.buildServer(baseCfg).length;
      const baseClient = build.buildClient(baseCfg).length;
      const fullServer = build.buildServer(cfg).length;
      const fullClient = build.buildClient(cfg).length;
      const modules = build.MODULES.filter(function (m) { return m.flag; }).map(function (m) {
        const isOn = curMods[m.key] !== false;
        const toggledMods = Object.assign({}, curMods); toggledMods[m.key] = !isOn;
        const toggledCfg = Object.assign({}, cfg, { mods: toggledMods });
        const toggledServer = build.buildServer(toggledCfg).length;
        const toggledClient = build.buildClient(toggledCfg).length;
        const serverDelta = isOn ? (fullServer - toggledServer) : (toggledServer - fullServer);
        const clientDelta = isOn ? (fullClient - toggledClient) : (toggledClient - fullClient);
        return { key: m.key, label: m.label, on: isOn, server: serverDelta, client: clientDelta };
      });
      res.status(200).json({ base: { server: baseServer, client: baseClient }, full: { server: fullServer, client: fullClient }, modules: modules });
      return;
    }
    if (body.type === "generate") {
      const cfg = body.cfg || {};
      const server = build.buildServer(cfg);
      const client = build.buildClient(cfg);
      const warnings = (build.checkForwardRefs(cfg.customServerCode) || []).map(function (m) { return "SERVER: " + m; })
        .concat((build.checkForwardRefs(cfg.customClientCode) || []).map(function (m) { return "CLIENT: " + m; }));
      res.status(200).json({ server: server, client: client, warnings: warnings, version: build.VERSION });
      return;
    }
    res.status(400).json({ error: "unknown type" });
  } catch (e) {
    res.status(500).json({ error: "build failed" });
  }
};
