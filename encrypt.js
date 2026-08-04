#!/usr/bin/env node
/* Lock the builder: encrypt dev/server.tpl + dev/client.tpl with YOUR password and
   bake the ciphertext into builder.js. The plaintext templates never ship — the
   browser decrypts them at runtime only when someone types the right password.

   Usage:   node encrypt.js "your-secret-password"

   - Re-run any time you change the password or edit the templates in dev/.
   - Keep the dev/ folder PRIVATE (don't commit it to a public repo) — it holds the
     plaintext. Ship only builder.js (encrypted) + index.html.
   - Same crypto as the browser: PBKDF2-SHA256 (200k) -> AES-GCM-256. Wrong password
     fails the GCM auth tag, so it can't be brute-detected without trying decryption.
*/
"use strict";
const fs = require("fs");
const path = require("path");
const C = globalThis.crypto; // Node 18+ Web Crypto (same API as the browser)

const password = process.argv[2];
if (!password) {
  console.error('Usage: node encrypt.js "your-password"');
  process.exit(1);
}

function b64(u8) { return Buffer.from(u8).toString("base64"); }

async function enc(plain, password) {
  const salt = C.getRandomValues(new Uint8Array(16));
  const iv = C.getRandomValues(new Uint8Array(12));
  const km = await C.subtle.importKey("raw", new TextEncoder().encode(password), "PBKDF2", false, ["deriveKey"]);
  const key = await C.subtle.deriveKey(
    { name: "PBKDF2", salt, iterations: 200000, hash: "SHA-256" },
    km, { name: "AES-GCM", length: 256 }, false, ["encrypt"]);
  const ct = new Uint8Array(await C.subtle.encrypt({ name: "AES-GCM", iv }, key, new TextEncoder().encode(plain)));
  return [b64(salt), b64(iv), b64(ct)].join(":");
}

(async () => {
  const dir = __dirname;
  const sTpl = fs.readFileSync(path.join(dir, "dev/server.tpl"), "utf8");
  const cTpl = fs.readFileSync(path.join(dir, "dev/client.tpl"), "utf8");

  const encS = await enc(sTpl, password);
  const encC = await enc(cTpl, password);

  let src = fs.readFileSync(path.join(dir, "builder.js"), "utf8");
  src = src.replace(/var ENC_SERVER = "[^"]*";/, 'var ENC_SERVER = "' + encS + '";');
  src = src.replace(/var ENC_CLIENT = "[^"]*";/, 'var ENC_CLIENT = "' + encC + '";');
  fs.writeFileSync(path.join(dir, "builder.js"), src);

  console.log("Locked builder.js:");
  console.log("  server blob:", encS.length, "chars");
  console.log("  client blob:", encC.length, "chars");
  console.log("Password set. Share it only with people you trust. Re-run to rotate it.");
})().catch(e => { console.error(e); process.exit(1); });
