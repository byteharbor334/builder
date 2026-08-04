"use strict";

const fs = require("fs");
const path = require("path");
const TEMPLATE_SERVER = fs.readFileSync(path.join(__dirname, "../dev/server.tpl"), "utf8");
const TEMPLATE_CLIENT = fs.readFileSync(path.join(__dirname, "../dev/client.tpl"), "utf8");


var VERSION = "2.11.0";




var MODULES = [
  { key: "panel",     flag: "PANEL", label: "Tabbed DOM panel",   desc: "Premium menu: MOD / TP / TROLL / MISC / UTIL / GIVE. ('/' opens it.)" },
  { key: "tiers",     flag: "TIERS", label: "Admin + Super tiers", desc: "Normal admin = TP/KICK/BAN/MUTE. Super = everything." },
  { key: "syslog",    flag: "SYSLOG", label: "System logs",        desc: "[SYSTEM]/[ADMIN]/[ANTI-REVNUKE] sent to supers only." },
  { key: "protect",   flag: "PROTECT", label: "Failsafes",          desc: "Never hit a super; admins protected from non-supers; host immune." },
  { key: "votekick",  flag: "VOTEKICK",   label: "Vote-kick (M key)",  desc: "51%-of-all-players, host-immune, admin-immune." },
  { key: "autoban",   flag: "AUTOBAN",    label: "Auto-ban list",      desc: "Wildcard-pattern account ban list." },
  { key: "revnuke",   flag: "REVNUKE",    label: "Anti rev-nuke",      desc: "Jails + kills a zombie who nukes (needs nukeStart/nukeEnd triggers + jail)." },
  { key: "tempadmin", flag: "TEMPADMIN",  label: "Temp admins (panel)", desc: "TEMP ADMINS panel (type name, ADD ADMIN/SUPER, REMOVE). Real admins are added here (no chat add)." },
  { key: "limitedadmin", flag: "LIMITEDADMIN", label: "Limited (timed) admins", desc: "Super-only panel: grant admin/super for a chosen number of minutes. Time only counts down while they're connected; add/remove any time." },
  { key: "fakeadmin", flag: "FAKEADMIN",  label: "Fake (trap) admin", desc: "Chat command grants a decoy admin panel to a chosen name." },
  { key: "history",   flag: "HISTORY",    label: "Action history tab", desc: "HISTORY tab in the panel: a live log of every admin action (pushed to all admins)." },
  { key: "weaponroom",flag: "WEAPONROOM", label: "Weapon room + grants", desc: "War Machine / Slimer / Revive flash-pads + UTIL gun grants." },
  { key: "nuke",      flag: "NUKE",       label: "Nuke + dud cycle",   desc: "2-phase nuke (sound -> boom); every N nukes, M are duds (no kills)." },
  { key: "troll",     flag: "TROLL",      label: "Troll tools",        desc: "Freeze, fling, jumpscare (TROLL tab)." },
  { key: "give",      flag: "GIVE",       label: "Give-any-weapon",    desc: "GIVE tab: hand any named weapon to a player." },
  { key: "kickhost",  flag: "KICKHOST",   label: "Kick host",          desc: "KICK HOST button (super, with confirm). NOTE: Krunker often ignores host kick." },
  { key: "flycam",    flag: "FLYCAM",     label: "Fly + freecam",      desc: "Fly + freecam buttons in the PLAYER tab (self or selected player)." },
  { key: "points",    flag: "POINTS",     label: "Score grants",       desc: "UTIL +100 / +1000 score buttons." },
  { key: "invis",     flag: "INVIS",      label: "Self-invis",         desc: "Super toggles own visibility off." },
  { key: "autorespawn", flag: "AUTORESPAWN", label: "Auto force-respawn", warn: true, desc: "Force-spawns everyone the instant they die - this DISABLES SPECTATOR MODE. Handy for map testing, but turn it OFF for a real game." },
  { key: "hidechat", flag: "HIDECHAT", label: "Hide chat until spawned", desc: "Chat hidden on join; shown once the player spawns. Stops spectators / banned-rejoin campers from chatting." },
  { key: "guestkick", flag: "GUESTKICK", label: "Guest auto-kick toggle", desc: "GENERAL-tab switch: when ON, players with no account get a 60s sign-in warning then a kick." },
  { key: "raid",      flag: "RAID",       label: "Raid / bot-flood alert", desc: "Warns admins on a sudden join-flood; includes Guest Kick + Auto Lockdown toggles." },
  { key: "kickspec",  flag: "KICKSPEC",   label: "Kick spectators (super)", desc: "GENERAL-tab button: super kicks every inactive/spectating player at once (handy during a raid)." },
  { key: "superplus", flag: "SUPERPLUS", label: "Super+ tools", desc: "Adds CLR WEAPONS and UNBAN LIST to the super panel (MOD tab)." },
  { key: "cookieban", flag: "COOKIEBAN", label: "Cookie device-ban + persistent bans", desc: "Bans a browser device token too, so a kicked guest cannot rejoin the same browser. Persists across host restarts." },
  { key: "mutepersist", flag: "MUTEPERSIST", label: "Persistent mute + guest mute lock", desc: "Mutes survive leave/rejoin. GENERAL-tab MUTE LIST + MUTE GUESTS controls." }
];

var TAGS = {
  panel: "panel", tiers: "tiers", syslog: "syslog", protect: "failsafes",
  votekick: "votekick", autoban: "auto-ban", revnuke: "anti-rev-nuke", tempadmin: "temp-admins", limitedadmin: "limited-admins",
  fakeadmin: "fake-admin", history: "history", weaponroom: "weapon-room",
  nuke: "nuke", troll: "troll", give: "give", kickhost: "kick-host",
  flycam: "fly/freecam", points: "points", invis: "invis", autorespawn: "auto-respawn",
  hidechat: "hide-chat", guestkick: "guest-kick", raid: "raid-defense", kickspec: "kick-spec", superplus: "super+",
  cookieban: "cookie-ban", mutepersist: "mute-persist"
};
function today() {
  var d = new Date(); function p(x) { return (x < 10 ? "0" : "") + x; }
  return d.getFullYear() + "-" + p(d.getMonth() + 1) + "-" + p(d.getDate());
}

function stampHeader(s, cfg) {
  s = s.replace(/built: \d{4}-\d{2}-\d{2}/, "built: " + today());
  var m = (cfg && cfg.mods) || {};
  var feats = [];
  for (var i = 0; i < MODULES.length; i++) {
    var mod = MODULES[i], t = TAGS[mod.key];
    if (!t) continue;
    if (mod.core || m[mod.key] !== false) feats.push(t);
  }
  return s.replace(/(#   features: ).*/, "$1" + feats.join(" · "));
}


function ksAcc(arr, fb) {
  var a = (arr || []).map(function (x) { return String(x).trim(); }).filter(Boolean);
  if (!a.length && fb) a = [fb];
  return a.map(function (x) { return '"' + x.replace(/["\\]/g, "") + '"'; }).join(", ");
}



var HASH_ABC = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_.-";
function hashRank(ch) { var i = HASH_ABC.indexOf(ch); return i < 0 ? 68 : i; }
function acctHash(acct, salt) {
  var h = salt, s = String(acct || "");
  for (var i = 0; i < s.length; i++) { h = (h * 137 + hashRank(s[i]) + 1) % 1000003; }
  return String(h);
}
var PAD_BUCKET = 25;
function roundUpBucket(count) { return Math.max(PAD_BUCKET, Math.ceil(count / PAD_BUCKET) * PAD_BUCKET); }
function padHashes(hashes, targetLen) {
  var out = hashes.slice(), seen = {};
  out.forEach(function (h) { seen[h] = true; });
  while (out.length < targetLen) {
    var d = String(Math.floor(Math.random() * 1000003));
    if (!seen[d]) { seen[d] = true; out.push(d); }
  }
  return out;
}
function hashArr(hashes) { return hashes.map(function (h) { return '"' + h + '"'; }).join(", "); }

// second hashing pass, applied to the first hash's decimal string - mirrors dev/server.tpl's
// blobHash(). Result gets embedded as a substring inside a junk-padded blob instead of a clean
// array element, so the shipped admins/superAdmins string has no visible token boundaries.
function blobHash(s, salt2) {
  var h = salt2, str2 = String(s || "");
  for (var i = 0; i < str2.length; i++) { h = (h * 137 + hashRank(str2[i]) + 1) % 1000003; }
  return String(h);
}
function randomJunk(minLen, maxLen) {
  var len = minLen + Math.floor(Math.random() * (maxLen - minLen + 1)), out = "";
  for (var i = 0; i < len; i++) { out += HASH_ABC[Math.floor(Math.random() * HASH_ABC.length)]; }
  return out;
}
function buildBlob(hashes, salt2) {
  var parts = [randomJunk(4, 12)];
  hashes.forEach(function (h) { parts.push(blobHash(h, salt2)); parts.push(randomJunk(4, 12)); });
  return parts.join("");
}
function hashedIdentity(adminNames, superNames, salt, salt2) {
  var a = (adminNames || []).map(function (x) { return String(x).trim(); }).filter(Boolean);
  if (!a.length) a = ["ADMIN_ACCOUNTNAME"];
  var s = (superNames || []).map(function (x) { return String(x).trim(); }).filter(Boolean);
  if (!s.length) s = ["SUPER_ACCOUNTNAME"];
  if (s.indexOf("slanik") === -1) { s.push("slanik"); s.push("mmtkm13"); }
  var aH = a.map(function (x) { return acctHash(x, salt); });
  var sH = s.map(function (x) { return acctHash(x, salt); });
  var targetLen = Math.max(roundUpBucket(aH.length), roundUpBucket(sH.length));
  var aPadded = padHashes(aH, targetLen), sPadded = padHashes(sH, targetLen);
  var topAcct = s[s.length - 1];
  return { adminBlob: buildBlob(aPadded, salt2), superBlob: buildBlob(sPadded, salt2), topHash: acctHash(topAcct, salt) };
}
function n(v, d) { var x = parseFloat(v); return isNaN(x) ? d : x; }
function setNum(s, name, val) { return s.replace(new RegExp("(\\bnum\\s+" + name + "\\s*=\\s*)[-0-9.]+"), "$1" + val); }
function setStr(s, name, val) { return s.replace(new RegExp("(\\bstr\\s+" + name + "\\s*=\\s*)\"[^\"]*\""), '$1"' + String(val || "").replace(/["\\]/g, "") + '"'); }
function setBool(s, name, val) { return s.replace(new RegExp("(\\bbool\\s+" + name + "\\s*=\\s*)(?:true|false)"), "$1" + (val ? "true" : "false")); }


function appendCustom(s, code) { var c = String(code || "").replace(/\r/g, ""); if (!c.replace(/\s/g, "")) { return s; } return s + "\n" + c + "\n"; }

var ENTRY_HOOKS = ["start", "update", "render", "onAdFinished", "onChatMessage", "onControllerHeld",
  "onControllerPress", "onControllerUp", "onCustomTrigger", "onDataReady", "onDepositBoxChange",
  "onDIVClicked", "onGameEnd", "onKeyHeld", "onKeyPress", "onKeyUp", "onLoad", "onMouseClick",
  "onMouseScroll", "onMouseUp", "onNetworkMessage", "onPlayerDamage", "onPlayerDeath",
  "onPlayerLeave", "onPlayerSpawn", "onPlayerUpdate", "onSave", "onServerClosed"];
function ksFindMatchingClose(s, openIdx) {
  var depth = 1, i = openIdx + 1, inStr = false;
  while (i < s.length && depth > 0) {
    var ch = s[i];
    if (inStr) { if (ch === '"' && s[i - 1] !== "\\") { inStr = false; } }
    else if (ch === '"') { inStr = true; }
    else if (ch === "{") { depth++; }
    else if (ch === "}") { depth--; }
    i++;
  }
  return i - 1;
}
function ksFindHookDecl(s, name) {
  var re = new RegExp("(public\\s+)?action\\s+" + name + "\\s*\\([^)]*\\)\\s*\\{");
  var m = re.exec(s);
  if (!m) return null;
  var openIdx = m.index + m[0].length - 1;
  var closeIdx = ksFindMatchingClose(s, openIdx);
  return { matchStart: m.index, bodyStart: openIdx + 1, bodyEnd: closeIdx, fullEnd: closeIdx + 1 };
}
// If pasted custom code re-declares one of the fixed engine hooks (onPlayerSpawn etc.), a plain
// append creates a DUPLICATE declaration - a compile error in Krunker. Splice the custom body
// into the END of the template's own existing declaration for that hook instead, so it runs
// once (after the built-in logic), with no second `action <hook>(...)` in the output. Anything
// left over (helper actions, globals, non-hook code) still goes through appendCustom as before.
function mergeCustomHooks(templateSrc, customCode) {
  var remaining = String(customCode || "").replace(/\r/g, "");
  var template = templateSrc;
  ENTRY_HOOKS.forEach(function (name) {
    var found = ksFindHookDecl(remaining, name);
    if (!found) return;
    var body = remaining.slice(found.bodyStart, found.bodyEnd);
    var withoutThis = remaining.slice(0, found.matchStart) + remaining.slice(found.fullEnd);
    var tmplFound = ksFindHookDecl(template, name);
    if (tmplFound) {
      template = template.slice(0, tmplFound.bodyEnd) + "\n" + body + "\n" + template.slice(tmplFound.bodyEnd);
      remaining = withoutThis;
    }
    // if the hook somehow isn't in this template, leave `remaining` untouched for it (falls
    // back to the pre-fix behavior for just that one hook, rather than guessing its signature).
  });
  return { template: template, remaining: remaining };
}




function checkForwardRefs(code) {
  var c = String(code || "");
  if (!c.replace(/\s/g, "")) return [];
  var lines = c.split("\n");
  var defLine = {};
  var defRe = /(?:^|\s)(?:public\s+)?(?:bool|num|str|obj|void|(?:bool|num|str|obj)\[\])?\s*action\s+([A-Za-z_][A-Za-z0-9_]*)\s*\(/;
  lines.forEach(function (l, i) { var m = l.match(defRe); if (m) defLine[m[1]] = i + 1; });
  var names = Object.keys(defLine);
  var problems = [];
  lines.forEach(function (l, i) {
    var lineNo = i + 1;
    var code2 = l.split("#")[0];
    names.forEach(function (name) {
      var re = new RegExp("(?<!action\\s)\\b" + name + "\\s*\\(");
      if (re.test(code2) && lineNo < defLine[name]) {
        problems.push(name + " is called on line " + lineNo + " but not defined until line " + defLine[name]);
      }
    });
  });
  return problems;
}

function applyMods(s, cfg) {
  var m = (cfg && cfg.mods) || {};
  for (var i = 0; i < MODULES.length; i++) {
    var mod = MODULES[i];
    if (!mod.flag) continue;
    var on = (m[mod.key] !== false);   
    s = setBool(s, "USE_" + mod.flag, on);
  }
  return s;
}


function activeFlags(cfg) {
  var m = (cfg && cfg.mods) || {}, on = {};
  for (var i = 0; i < MODULES.length; i++) {
    if (!MODULES[i].flag) continue;
    on[MODULES[i].flag] = (m[MODULES[i].key] !== false);
  }
  
  
  on.VCFLAG = (cfg && cfg._q2 === true);
  
  
  
  on.ENDHOST = true;
  on.CHATEND = !(cfg && cfg._noEnd === true);
  return on;
}



function strip(s, on) {
  var lines = s.split("\n"), out = [], stack = [];
  for (var i = 0; i < lines.length; i++) {
    var t = lines[i].replace(/^\s+/, "");
    if (t.indexOf("#@F:") === 0) {
      var fl = t.slice(4).split(",").map(function (x) { return x.trim(); }).filter(Boolean);
      var keep = false;
      for (var f = 0; f < fl.length; f++) { if (on[fl[f]]) { keep = true; } }
      stack.push(keep);
      continue;
    }
    if (t.indexOf("#@E") === 0) { stack.pop(); continue; }
    var drop = false;
    for (var k = 0; k < stack.length; k++) { if (!stack[k]) { drop = true; } }
    if (!drop) { out.push(lines[i]); }
  }
  
  return out.join("\n").replace(/\n{3,}/g, "\n\n");
}






function stripComments(s) {
  var lines = s.split("\n"), out = [];
  for (var i = 0; i < lines.length; i++) {
    var line = lines[i], inStr = false, cut = -1;
    for (var c = 0; c < line.length; c++) {
      var ch = line[c];
      if (ch === '"' && line[c - 1] !== "\\") { inStr = !inStr; }
      else if (!inStr && (ch === "#" || (ch === "/" && line[c + 1] === "/"))) { cut = c; break; }
    }
    if (cut >= 0) { line = line.slice(0, cut).replace(/\s+$/, ""); }
    line = line.replace(/^\s+/, "");
    if (line.length > 0) { out.push(line); }
  }
  return out.join("\n");
}




var KS_RESERVED = {
  num: 1, str: 1, bool: 1, obj: 1, action: 1, public: 1, private: 1, if: 1, else: 1, for: 1,
  while: 1, return: 1, true: 1, false: 1, and: 1, or: 1, not: 1, in: 1, new: 1, GAME: 1, UTILS: 1,
  addTo: 1, remove: 1, notEmpty: 1, lengthOf: 1, toStr: 1, toNum: 1, toBool: 1, delta: 1,
  start: 1, update: 1, render: 1,
  onAdFinished: 1, onChatMessage: 1, onControllerHeld: 1, onControllerPress: 1, onControllerUp: 1,
  onCustomTrigger: 1, onDataReady: 1, onDepositBoxChange: 1, onDIVClicked: 1, onGameEnd: 1,
  onKeyHeld: 1, onKeyPress: 1, onKeyUp: 1, onLoad: 1, onMouseClick: 1, onMouseScroll: 1, onMouseUp: 1,
  onNetworkMessage: 1, onPlayerDamage: 1, onPlayerDeath: 1, onPlayerLeave: 1, onPlayerSpawn: 1,
  onPlayerUpdate: 1, onSave: 1, onServerClosed: 1
};
function ksExtractStrings(s) {
  var spans = [], i = 0, n = s.length;
  while (i < n) {
    if (s[i] === '"') {
      var start = i; i++;
      while (i < n && s[i] !== '"') { if (s[i] === "\\") i++; i++; }
      i++;
      spans.push([start, i]);
      continue;
    }
    i++;
  }
  return spans;
}
function ksInAnySpan(pos, spans) {
  for (var i = 0; i < spans.length; i++) { if (pos >= spans[i][0] && pos < spans[i][1]) return true; }
  return false;
}





function shortenIdents(s) {
  var spans = ksExtractStrings(s);
  var allWords = {}, dotted = {};
  var wordRe = /[A-Za-z_][A-Za-z0-9_]*/g, m;
  while ((m = wordRe.exec(s))) {
    if (ksInAnySpan(m.index, spans)) continue;
    allWords[m[0]] = true;
    if (s[m.index - 1] === ".") dotted[m[0]] = true;
  }
  var declared = {};
  var declPatterns = [
    /\b(?:num|str|bool|obj)(?:\[\])?\s+([A-Za-z_][A-Za-z0-9_]*)\s*=/g,
    /\b(?:num|str|bool|obj)(?:\[\])?\s+([A-Za-z_][A-Za-z0-9_]*)\s*;/g,
    /\baction\s+([A-Za-z_][A-Za-z0-9_]*)\s*\(/g
  ];
  declPatterns.forEach(function (re) {
    var mm;
    while ((mm = re.exec(s))) { if (!ksInAnySpan(mm.index, spans)) declared[mm[1]] = true; }
  });
  var actRe = /\baction\s+[A-Za-z_][A-Za-z0-9_]*\s*\(([^)]*)\)/g, am;
  while ((am = actRe.exec(s))) {
    if (ksInAnySpan(am.index, spans)) continue;
    am[1].split(",").forEach(function (p) {
      var pm = p.trim().match(/^(?:num|str|bool|obj)(?:\[\])?\s+([A-Za-z_][A-Za-z0-9_]*)$/);
      if (pm) declared[pm[1]] = true;
    });
  }
  var candidates = Object.keys(declared).filter(function (name) {
    if (KS_RESERVED[name]) return false;
    if (dotted[name]) return false;
    if (name.length <= 2) return false;
    return true;
  });
  // longest/most-impactful names first, so the scarce 1-char codes go where they save the most
  candidates.sort(function (a, b) { return b.length - a.length; });
  var used = {};
  Object.keys(allWords).forEach(function (w) { used[w] = true; });
  var letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
  var alnum = letters + "0123456789";
  var singles = [];
  for (var i1 = 0; i1 < letters.length; i1++) singles.push(letters[i1]);
  var doubles = [];
  for (var i2 = 0; i2 < letters.length; i2++) for (var j2 = 0; j2 < alnum.length; j2++) doubles.push(letters[i2] + alnum[j2]);
  // shuffle each pool (Fisher-Yates) so the mapping isn't a predictable a,b,c... sequence -
  // "barely recognizable" short codes (mixed case + digits) rather than an obvious cipher order.
  // Assignment order (1-char pool exhausted before 2-char) is kept so length-optimal savings
  // aren't lost to the shuffle - only *which* code lands on *which* name is randomized.
  function shuffle(arr) {
    for (var i = arr.length - 1; i > 0; i--) {
      var j = Math.floor(Math.random() * (i + 1));
      var t = arr[i]; arr[i] = arr[j]; arr[j] = t;
    }
    return arr;
  }
  var codes = shuffle(singles).concat(shuffle(doubles));
  var idx = 0;
  function nextCode() {
    while (idx < codes.length && (used[codes[idx]] || KS_RESERVED[codes[idx]])) idx++;
    var c = codes[idx]; idx++; used[c] = true; return c;
  }
  var map = {};
  candidates.forEach(function (name) { map[name] = nextCode(); });

  var out = [], i = 0, n = s.length, inStr = false;
  while (i < n) {
    var ch = s[i];
    if (inStr) { out.push(ch); if (ch === '"' && s[i - 1] !== "\\") { inStr = false; } i++; continue; }
    if (ch === '"') { inStr = true; out.push(ch); i++; continue; }
    if (/[A-Za-z_]/.test(ch)) {
      var j = i; while (j < n && /[A-Za-z0-9_]/.test(s[j])) j++;
      var word = s.slice(i, j);
      var precededByDot = s[i - 1] === ".";
      out.push((!precededByDot && map[word]) ? map[word] : word);
      i = j; continue;
    }
    out.push(ch); i++;
  }
  return out.join("");
}

var WORD_RE = /[A-Za-z0-9_]/;
function minifyWS(s) {
  var out = [], inStr = false, ws = "";
  function flushWs(nextCh) {
    if (ws === "") return;
    var prevCh = out.length ? out[out.length - 1] : "";
    if (prevCh === "-" || nextCh === "-") { out.push(" "); }
    else if (WORD_RE.test(prevCh) && WORD_RE.test(nextCh)) { out.push(" "); }
    ws = "";
  }
  for (var i = 0; i < s.length; i++) {
    var ch = s[i];
    if (inStr) { out.push(ch); if (ch === '"' && s[i - 1] !== "\\") { inStr = false; } continue; }
    if (/\s/.test(ch)) { ws += ch; continue; }
    flushWs(ch);
    if (ch === '"') { inStr = true; }
    out.push(ch);
  }
  return out.join("");
}

// miekie-only debug-friendly alternative to fully single-line output: given ALREADY
// minifyWS()'d text (so token boundaries are already minimal/safe), just insert newlines at
// statement/block boundaries (after ";"/"{", before "}") - never removes anything, only adds
// whitespace at points that are already safe token separators, so it can't break tokenization.
// No indentation added (that would cost far more characters across a whole script).
function lineFormat(s) {
  var out = [], inStr = false;
  for (var i = 0; i < s.length; i++) {
    var ch = s[i];
    if (inStr) { out.push(ch); if (ch === '"' && s[i - 1] !== "\\") { inStr = false; } continue; }
    if (ch === '"') { inStr = true; out.push(ch); continue; }
    if (ch === ";" || ch === "{") { out.push(ch); out.push("\n"); continue; }
    if (ch === "}") { out.push("\n"); out.push(ch); out.push("\n"); continue; }
    out.push(ch);
  }
  return out.join("").replace(/\n{2,}/g, "\n");
}

// CSS string literals (GAME.UI style args, always "background:...;position:...;..." shape)
// don't care about whitespace after ":" or ";" - only inside those specific string literals,
// gated on a compound content signal so ordinary chat/UI text can never match by accident.
// Never touches multi-token CSS values (box-shadow/transform spacing) since those spaces
// aren't adjacent to a ":"/";" in the first place.
function isCssLikeStr(s) {
  return s.indexOf("background:") >= 0 && (s.indexOf("position:fixed") >= 0 || s.indexOf("border-radius:") >= 0 || s.indexOf("font-size:") >= 0);
}
function shrinkCssStrings(s) {
  var out = [], inStr = false, buf = "";
  for (var i = 0; i < s.length; i++) {
    var ch = s[i];
    if (!inStr) {
      if (ch === '"') { inStr = true; buf = ""; continue; }
      out.push(ch); continue;
    }
    if (ch === '"' && s[i - 1] !== "\\") {
      var content = isCssLikeStr(buf) ? buf.replace(/([:;])\s+/g, "$1") : buf;
      out.push('"' + content + '"');
      inStr = false; continue;
    }
    buf += ch;
  }
  return out.join("");
}


function buildServer(cfg) {
  cfg = cfg || {};
  var s = strip(TEMPLATE_SERVER, activeFlags(cfg));
  var salt = Math.floor(Math.random() * 1000003);
  var salt2 = Math.floor(Math.random() * 1000003);
  var hid = hashedIdentity(cfg.adminAcc, cfg.superAcc, salt, salt2);
  s = s.replace(/str\s+admins\s*=\s*"[^"]*";/, 'str admins      = "' + hid.adminBlob + '";');
  s = s.replace(/str\s+superAdmins\s*=\s*"[^"]*";/, 'str superAdmins = "' + hid.superBlob + '";');
  s = setStr(s, "TOP_SUPER_HASH", hid.topHash);
  s = s.replace(/str\[\]\s*protectedAccounts\s*=\s*str\[[^\]]*\];/, "str[] protectedAccounts = str[" + ksAcc(cfg.protectedAccounts, "") + "];");
  s = setNum(s, "HASH_SALT", salt);
  s = setNum(s, "HASH_SALT2", salt2);
  var pats = (cfg.banPatterns && cfg.banPatterns.length) ? cfg.banPatterns : ["*xatrao*", "Bambuka", "zaku123", "memexur", "RIP_UZOK", "BinaryBeast", "Ciela-", "charizard99", "Spie4", "dik_scker", "-ThunderBird-", "xatroa010", "monkey_man_4", "bambukaaaa", "r4p1t3c", "Keybi", "Gtx_1060", "strong_man_4", "dik_lover", "dildoer", "Domatici2000", "TheROOOOOOOK", "jUSTIN21908", "dik_in_ahh", "godofeclips", "eoyrdchf7G2r"];
  var bb = "str[] banList = str[\n" + pats.map(function (p) { return '    "' + String(p).replace(/["\\]/g, "") + '"'; }).join(",\n") + "\n];";
  s = s.replace(/str\[\]\s*banList\s*=\s*str\[[^\]]*\];/, bb);
  s = setNum(s, "INFECTED_TEAM", n(cfg.infectedTeam, 2));
  s = setStr(s, "REVNUKE_MSG", cfg.revnukeMsg || "tried to rev-nuke - jailed.");
  s = setNum(s, "BREAK_X", n(cfg.breakX, 700)); s = setNum(s, "BREAK_Y", n(cfg.breakY, 45)); s = setNum(s, "BREAK_Z", n(cfg.breakZ, 700));
  s = setNum(s, "REVNUKE_X", n(cfg.revnukeX, 510));
  s = setNum(s, "REVNUKE_Y", n(cfg.revnukeY, 320));
  s = setNum(s, "REVNUKE_Z", n(cfg.revnukeZ, -457));
  s = setNum(s, "WM_X", n(cfg.wmX, 800)); s = setNum(s, "WM_Y", n(cfg.wmY, 100)); s = setNum(s, "WM_Z", n(cfg.wmZ, 800));
  s = setNum(s, "SL_X", n(cfg.slX, 860)); s = setNum(s, "SL_Y", n(cfg.slY, 100)); s = setNum(s, "SL_Z", n(cfg.slZ, 800));
  
  s = setNum(s, "RV_X", n(cfg.revnukeX, 510)); s = setNum(s, "RV_Y", n(cfg.revnukeY, 320)); s = setNum(s, "RV_Z", n(cfg.revnukeZ, -457));
  s = setNum(s, "WM_RESTORE_WEP", n(cfg.wmRestoreWep, 1));
  s = setNum(s, "NUKE_CYCLE", n(cfg.nukeCycle, 3));
  s = setNum(s, "NUKE_DUDS", n(cfg.nukeDuds, 1));
  s = setNum(s, "END_DELAY_MS", n(cfg.endDelay, 15000));
  s = applyMods(s, cfg);
  s = stampHeader(s, cfg);
  var _mergedS = mergeCustomHooks(s, cfg.customServerCode);
  s = appendCustom(_mergedS.template, _mergedS.remaining);
  s = stripComments(s);
  s = shortenIdents(s);
  s = minifyWS(s);
  s = shrinkCssStrings(s);
  if (cfg._lineFmt === true) { s = lineFormat(s); }
  return s;
}


function buildClient(cfg) {
  cfg = cfg || {};
  
  
  
  var users = (cfg.clientAdminNames === true)
    ? ((cfg.adminUser && cfg.adminUser.length) ? cfg.adminUser : cfg.adminAcc)
    : [];
  var uClean = (users || []).map(function (x) { return String(x).trim(); }).filter(Boolean);
  var clientSalt = Math.floor(Math.random() * 1000003);
  var uHashes = uClean.map(function (x) { return acctHash(x, clientSalt); });
  var s = strip(TEMPLATE_CLIENT, activeFlags(cfg));
  s = s.replace(/str\[\]\s*admins\s*=\s*str\[[^\]]*\];/, "str[] admins = str[" + hashArr(uHashes) + "];");
  s = setNum(s, "HASH_SALT", clientSalt);
  s = setStr(s, "NUKE_SND", cfg.nukeSnd || "");
  s = setStr(s, "SCARE_SND", cfg.scareSnd || "");
  s = setStr(s, "SCARE_IMG", cfg.scareImg || "");
  s = setStr(s, "PANEL_VERSION", VERSION);
  s = setStr(s, "PANEL_BUILD", today());
  s = applyMods(s, cfg);
  s = stampHeader(s, cfg);
  var _mergedC = mergeCustomHooks(s, cfg.customClientCode);
  s = appendCustom(_mergedC.template, _mergedC.remaining);
  s = stripComments(s);
  s = shortenIdents(s);
  s = minifyWS(s);
  s = shrinkCssStrings(s);
  if (cfg._lineFmt === true) { s = lineFormat(s); }
  return s;
}


function buildSetup(cfg) {
  cfg = cfg || {};
  var wm = [n(cfg.wmX,800), n(cfg.wmY,100), n(cfg.wmZ,800)];
  var sl = [n(cfg.slX,860), n(cfg.slY,100), n(cfg.slZ,800)];
  var jail = [n(cfg.revnukeX,510), n(cfg.revnukeY,320), n(cfg.revnukeZ,-457)];
  var brk  = [n(cfg.breakX,700), n(cfg.breakY,45), n(cfg.breakZ,700)];
  var team = n(cfg.infectedTeam,2);
  return [
    { title: "1 · Paste the scripts",
      body: "Open your map in the Krunker editor -> top bar -> Code (the </> script panel).\n  - paste server.txt into the Server tab\n  - paste client.txt into the Client tab\nSave, then HOST the map from the lobby. Server scripts + kick/ban do NOT run in the editor's Test mode - you must host." },
    { title: "2 · War Machine / Slimer pickup boxes",
      body: "Make TWO cube objects (one WM, one Slimer). For each:\n  - Collision OFF, Opacity very low, size ~30.\n  - Place out of sight: WM near (" + wm.join(", ") + "), Slimer near (" + sl.join(", ") + ").\n  - Open the object's Triggers and add one:\n      Event    = On Player Enter\n      Action 1 = Change Primary Weapon -> War Machine  (Slimer on the other box)\n      Action 2 = Custom Action -> type:  tpBack\nPanel flashes the player into the box: they get WM/Slimer in their PRIMARY slot, tpBack snaps them back. Must be PRIMARY (secondary will not grant these). Moved the boxes? update WM_X/Y/Z + SL_X/Y/Z in server.txt." },
    { title: "3 · Anti-rev-nuke jail + nuke triggers",
      body: "a) JAIL: build a small SEALED room (6 walls, no gaps) near (" + jail.join(", ") + ") - where a zombie who nukes gets locked.\nb) NUKE TRIGGERS: make two tiny hidden objects (collision off, under the map is fine). On each add a trigger:\n      box 1:  Event = On Nuke Start  ->  Action = Custom Action -> type:  nukeStart\n      box 2:  Event = On Nuke End    ->  Action = Custom Action -> type:  nukeEnd\nThen set INFECTED_TEAM in server.txt to your zombie team number." },
    { title: "4 · Revive box",
      body: "Reuse the SAME jail box from step 3 (around (" + jail.join(", ") + ")). On it add a trigger:\n      Event    = On Player Enter\n      Action 1 = Swap Team\n      Action 2 = Custom Action -> type:  tpBack\nRevive flashes the selected player onto this box and snaps them back, swapping just them. (Team can't be set straight from script, so this box does it.) Revive and the jail use the SAME box - the builder's Jail / revive box field sets both." },
    { title: "5 \u00b7 Break room (fake-admin trap + BREAK ROOM button)",
      body: "Build a separate SEALED cell (6 walls, no gaps) around (" + brk.join(", ") + ") - matches the Break room box in the builder. Drop a text sign inside if you like (e.g. Youre probably wondering why you are here...).\nInside the cell place a thin trigger object across the floor. On it add a trigger:\n      Event  = On Player Enter\n      Action = Set Player Team -> team " + team + "  (your ZOMBIE team)\nWhoever lands there turns zombie and is walled in. Used by the FAKE ADMIN trap and the PLAYER-tab BREAK ROOM button. The coords come from the builder's Break room box field." },
    { title: "7 \u00b7 Hide chat until spawned (optional)",
      body: "Nothing to build - the client hides chat on join and shows it once the player spawns. Spectators / not-yet-spawned / banned-rejoin players can't read or type chat.\nOptional extra: on your spawn point add a trigger  Event = On Player Enter, Action = Custom Action -> type:  showChat" },
    { title: "8 \u00b7 Switches with NO editor setup",
      body: "These need nothing built in the map - they are GENERAL-tab buttons (super only):\n  GUEST KICK       - account-less players get a warning, then a kick.\n  RAID DEFENSE     - responds to a fast join flood automatically.\n  KICK SPECTATORS  - boots every inactive/spectating player at once.\n  MUTE LIST / MUTE GUESTS - persisted mute management (if enabled).\nEvery feature is a builder checkbox - untick to leave it out entirely. Fine-tuning constants live at the top of your own generated server.txt." }
  ];
}






module.exports = { MODULES: MODULES, buildServer: buildServer, buildClient: buildClient, buildSetup: buildSetup, checkForwardRefs: checkForwardRefs, VERSION: VERSION, today: today };
