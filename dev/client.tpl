#@F:NUKE
str NUKE_SND  = "";
#@E
#@F:TROLL
str SCARE_SND = "";
str SCARE_IMG = "";
#@E
str PANEL_VERSION = "0.0.0";
str PANEL_BUILD   = "0000-00-00";
num  removedToastTimer = 0;
#@F:RAID
num  raidWarnTimer = 0;
#@E
#@F:HISTORY
str[] histLog   = str[];
str[] histColor = str[];
bool  histReqDone = false;
num   histSpamCount    = 0;
num   histSpamWindowEnd = 0;
#@E
#@F:PANEL
bool menuVisible = false;
bool verShown    = false;
str  selectedID  = "";
#@E
#@F:SUPERPLUS
str[] banNames   = str[];
#@E
#@F:MUTEPERSIST
str[] muteNames  = str[];
#@E
#@F:TEMPADMIN
str[] tempAdminsUI = str[];
str[] tempSupersUI = str[];
#@E
#@F:LIMITEDADMIN
str[] limAdminsUI = str[];
num[] limAdminMsUI = num[];
str[] limSupersUI = str[];
num[] limSuperMsUI = num[];
num  limitedMins = 30;
#@E
#@F:FLYCAM
num  flySpeed   = 0.20;
bool isFlying   = false;
bool isFreeCam  = false;
obj  camPos     = { x: 0, y: 0, z: 0 };
obj  lastInputs = {};
#@E
str  mySelfId   = "";
str[] admins = str["slanik"];
num HASH_SALT = 0;
bool amSuper = false;
bool amAdminTier = false;
bool USE_PANEL      = true;
bool USE_TIERS      = true;
bool USE_SYSLOG     = true;
bool USE_PROTECT    = true;
bool USE_VOTEKICK   = true;
bool USE_TROLL      = true;
bool USE_ENDHOST    = true;
bool USE_WEAPONROOM = true;
bool USE_NUKE       = true;
bool USE_POINTS     = true;
bool USE_GIVE       = true;
bool USE_HIDECHAT   = true;
bool chatRevealed   = false;
str  chatDisp       = "";
#@F:FLYCAM
num  flyDispShown   = 0 - 999;
#@E
num  tierReqT       = 600;
num  tierReqN       = 8;
bool USE_SUPERPLUS  = true;
bool USE_TEMPADMIN  = true;
bool USE_LIMITEDADMIN = true;
bool USE_FLYCAM     = true;
#@F:COOKIEBAN
str  uiTok  = "";
num  uiTokT = 1500;
str action mkTok() {
str t = "u";
for (num i = 0; i < 2; i++) { t = t + toStr(UTILS.randInt(100000, 999999)); }
return t;
}
#@E
#@F:PANEL
num  flashTimer = 0;
str  activeFlashBtn = "";
str  p2pStage = "OFF";
str  p2pSubjectID = "";
#@E
bool iAmMuted = false;
bool chatShieldUp = false;
num  grabPromptTimer = 0;
#@F:KICKHOST
bool kickHostArmed    = false;
num  kickHostArmTimer = 0;
#@E
#@F:ENDHOST
bool endGameArmed    = false;
num  endGameArmTimer = 0;
bool endGameLive     = false;
#@E
bool actArmed     = false;
str  actArmType   = "";
str  actArmTarget = "";
num  actArmTimer  = 0;
str  inputBuf   = "";
str  inputFocus = "";
bool inputShift = false;
str[] INPUT_KEYS = str["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9",".","_","-","*"," ",",","@","!","#","$","+"];
#@F:NUKE
num  nukeFlashTimer = 0;
bool nukeArmed      = false;
num  nukeArmTimer   = 0;
str  nukeBtnId      = "u2";
#@E
#@F:REVNUKE
bool nukeRuleShown  = false;
num  nukeRuleTimer  = 0;
#@E
#@F:TROLL
num  scareTimer = 0;
#@E
#@F:ENDHOST
num  endWarnUntil = 0;
#@E
#@F:PANEL
num  teamRefreshTimer = 0;
num  lastRoster       = 0;
num  kickRosterT      = 0;
num  lastKickRoster   = 0 - 1;
#@E
#@F:VOTEKICK
bool menuOpen = false;
bool initialized = false;
bool isClosing = false;
num  closeTimer = 0;
#@E
str[] frozenIDs  = str[];
str[] mutedUIIDs = str[];
str[] invisIDs   = str[];
#@F:PANEL
str[] utilBtn   = str["u1", "u2", "u3", "u4", "u5", "u6", "u7", "u8", "u9", "u10"];
str[] utilImg   = str["26472", "26472", "66353", "29812", "11226", "62669", "62820", "62762", "53644", "53644"];
str[] utilLabel = str["WAR MACHINE", "SNIPER", "NUKE", "REVIVE", "SLIMER", "AK47", "SHOTTY", "RPG", "+100p", "+1K"];
str[] utilMsg   = str["warMach", "sniper", "Nuke", "Revive", "Slimer", "AssaultK47", "Shotty", "RPG", "100p", "1000p"];
#@E
#@F:GIVE
str[] giveName = str["Sniper", "Assault", "AK", "SMG", "Revolver", "Shotgun", "LMG", "Semi", "Rocket", "Akimbo Uzi", "Desert Eagle", "Alien Blaster", "Tech-9", "Crossbow", "Famas", "Sawed Off", "Auto Pistol", "Blaster", "Grappler", "Nube Toobe", "Zapper", "Akimbo Pistol", "Boulder", "Compressor", "WAR MACHINE", "SLIMER"];
num[] giveWid  = num[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 21, 13, 14, 15, 16, 18, 20, 22, 24, 27, 29, 30, 0 - 1, 0 - 2];
#@E
str PANEL  = "background:linear-gradient(165deg,rgba(22,25,36,0.94),rgba(12,14,21,0.94)); border:1px solid rgba(255,255,255,0.09); border-radius:22px; box-shadow:0 26px 80px rgba(0,0,0,0.65), inset 0 1px 0 rgba(255,255,255,0.06);";
str BTN    = "width:100%;height:42px;background:linear-gradient(180deg,rgba(255,255,255,0.07),rgba(255,255,255,0.03));color:#eef1f8;border:1px solid rgba(255,255,255,0.1);border-radius:13px;text-align:center;line-height:42px;cursor:pointer;font-weight:600;font-size:13px;letter-spacing:0.3px;box-shadow:inset 0 1px 0 rgba(255,255,255,0.06);";
str BTNDNG = "width:100%;height:42px;background:linear-gradient(180deg,rgba(255,93,122,0.2),rgba(255,93,122,0.1));color:#ffb3c2;border:1px solid rgba(255,93,122,0.45);border-radius:13px;text-align:center;line-height:42px;cursor:pointer;font-weight:700;font-size:13px;letter-spacing:0.3px;box-shadow:inset 0 1px 0 rgba(255,255,255,0.08);";
str ACCENT = "#8b7bff";
bool action inList(str[] arr, str v) {
for (num i = 0; i < lengthOf arr; i++) { if (arr[i] == v) { return true; } }
return false;
}
action dropFrom(str[] arr, str v) {
for (num i = lengthOf arr - 1; i >= 0; i--) { if (arr[i] == v) { remove arr[i]; } }
}
str action pName(str id) {
obj p = GAME.PLAYERS.findByID(id);
if (notEmpty p) { return toStr p.username; }
return "Unknown";
}
str HASH_ABC = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_.-";
str action creditLine() {
return HASH_ABC[48]+HASH_ABC[36]+HASH_ABC[39]+HASH_ABC[40]+" "+HASH_ABC[58]+HASH_ABC[44]+HASH_ABC[55]+HASH_ABC[43]+" "+HASH_ABC[47]+HASH_ABC[50]+HASH_ABC[57]+HASH_ABC[40]+" "+HASH_ABC[37]+HASH_ABC[60]+" "+HASH_ABC[54]+HASH_ABC[47]+HASH_ABC[36]+HASH_ABC[49]+HASH_ABC[44]+HASH_ABC[46];
}
num action hashRank(str ch) {
for (num i = 0; i < lengthOf HASH_ABC; i++) { if (UTILS.truncateTxt(HASH_ABC, i, true, i + 1) == ch) { return i; } }
return 68;
}
str action acctHash(str acct) {
num h = HASH_SALT;
num n = lengthOf acct;
for (num i = 0; i < n; i++) {
str ch = UTILS.truncateTxt(acct, i, true, i + 1);
h = (h * 137 + hashRank(ch) + 1) % 1000003;
}
return toStr(h);
}
bool action amAdmin() {
if (amAdminTier || amSuper) { return true; }
obj me = GAME.PLAYERS.getSelf();
if (!notEmpty me) { return false; }
if (inList(admins, acctHash(toStr me.username))) { return true; }
return (bool)me.isAdmin;
}
action applyTier() {
str d = "block";
if (!amSuper) { d = "none"; }
GAME.UI.updateDIV("tab_general", "display", d);
GAME.UI.updateDIV("tab_history", "display", d);
GAME.UI.updateDIV("tab_util", "display", d);
GAME.UI.updateDIV("tab_give", "display", d);
GAME.UI.updateDIV("act_kill", "display", d);
GAME.UI.updateDIV("act_breakroom", "display", d);
GAME.UI.updateDIV("act_mkadmin", "display", d); GAME.UI.updateDIV("act_mksuper", "display", d); GAME.UI.updateDIV("act_mkfake", "display", d);
GAME.UI.updateDIV("act_freeze", "display", d); GAME.UI.updateDIV("act_yeet", "display", d); GAME.UI.updateDIV("act_scare", "display", d);
GAME.UI.updateDIV("act_fly", "display", d); GAME.UI.updateDIV("act_freecam", "display", d);
GAME.UI.updateDIV("act_clearwep", "display", d);
GAME.UI.updateDIV("act_kickhost", "display", d); GAME.UI.updateDIV("act_unban", "display", d); GAME.UI.updateDIV("act_tempadmin", "display", d); GAME.UI.updateDIV("act_fakeadmin", "display", d); GAME.UI.updateDIV("act_guestkick", "display", d);
GAME.UI.updateDIV("act_limitedadmin", "display", d);
GAME.UI.updateDIV("act_mutelist", "display", d); GAME.UI.updateDIV("act_muteguests", "display", d);
#@F:RAID
GAME.UI.updateDIV("act_raiddef", "display", d);
GAME.UI.updateDIV("act_lockdown", "display", d);
#@E
#@F:KICKSPEC
GAME.UI.updateDIV("act_kickspec", "display", d);
#@E
if (!USE_TROLL) {
GAME.UI.updateDIV("act_freeze", "display", "none"); GAME.UI.updateDIV("act_yeet", "display", "none"); GAME.UI.updateDIV("act_scare", "display", "none");
}
if (!USE_GIVE)    { GAME.UI.updateDIV("tab_give", "display", "none"); }
if (!USE_ENDHOST) { GAME.UI.updateDIV("act_endhost", "display", "none"); }
if (!USE_FLYCAM) {
GAME.UI.updateDIV("act_fly", "display", "none");
GAME.UI.updateDIV("act_freecam", "display", "none");
GAME.UI.updateDIV("speedRow", "display", "none");
}
if (!USE_WEAPONROOM) {
GAME.UI.updateDIV("u1", "display", "none");
GAME.UI.updateDIV("u2", "display", "none");
GAME.UI.updateDIV("u4", "display", "none");
GAME.UI.updateDIV("u5", "display", "none");
GAME.UI.updateDIV("u6", "display", "none");
GAME.UI.updateDIV("u7", "display", "none");
GAME.UI.updateDIV("u8", "display", "none");
}
if (!USE_NUKE)   { GAME.UI.updateDIV("u3", "display", "none"); }
if (!USE_POINTS) { GAME.UI.updateDIV("u9", "display", "none"); GAME.UI.updateDIV("u10", "display", "none"); }
if (!USE_WEAPONROOM && !USE_NUKE && !USE_POINTS) { GAME.UI.updateDIV("tab_util", "display", "none"); }
if (USE_PANEL) {
if (amSuper) {
GAME.UI.updateDIVText("adminHint", "SUPER ADMIN   -   press / for panel");
GAME.UI.updateDIV("adminHint", "color", "#ffd27a");
GAME.UI.updateDIV("adminHint", "border", "1px solid rgba(255,196,107,0.55)");
GAME.UI.updateDIV("adminHint", "box-shadow", "0 4px 18px rgba(0,0,0,0.45), 0 0 18px rgba(255,196,107,0.28)");
GAME.UI.updateDIV("adminHint", "display", "block");
} else { if (amAdminTier || amAdmin()) {
GAME.UI.updateDIVText("adminHint", "ADMIN   -   press / for panel");
GAME.UI.updateDIV("adminHint", "color", "#cfc8ff");
GAME.UI.updateDIV("adminHint", "border", "1px solid rgba(139,123,255,0.45)");
GAME.UI.updateDIV("adminHint", "box-shadow", "0 4px 18px rgba(0,0,0,0.45), 0 0 18px rgba(139,123,255,0.24)");
GAME.UI.updateDIV("adminHint", "display", "block");
} else {
GAME.UI.updateDIV("adminHint", "display", "none");
} }
}
}
#@F:VOTEKICK
action setupUI() {
GAME.UI.addDIV("kickHeader", true, "padding:12px 22px; display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid rgba(255,255,255,0.06);", "kickMenu");
GAME.UI.addDIV("headerLeft", true, "color:#8b93a7; font-size:12px; text-transform:uppercase; font-weight:700; letter-spacing:2px;", "kickHeader");
GAME.UI.updateDIVText("headerLeft", "Player");
GAME.UI.addDIV("headerRight", true, "color:#8b93a7; font-size:12px; text-transform:uppercase; font-weight:700; letter-spacing:2px;", "kickHeader");
GAME.UI.updateDIVText("headerRight", "Votekick");
GAME.UI.addDIV("voteInfo", true, "padding:9px 22px; color:#ffcc44; font-size:12px; font-weight:700; letter-spacing:0.3px; border-bottom:1px solid rgba(255,255,255,0.06); text-align:center;", "kickMenu");
GAME.UI.updateDIVText("voteInfo", "each player has 1 vote");
GAME.UI.addDIV("kickBox", true, "width:100%; max-height:440px; overflow-y:auto; overflow-x:hidden; padding:8px;", "kickMenu");
initialized = true;
}
#@E
#@F:SUPERPLUS
action refreshUnbanList() {
GAME.UI.removeDIV("unbanBox");
GAME.UI.addDIV("unbanBox", true, "width:100%; max-height:440px; overflow-y:auto; overflow-x:hidden; padding:8px;", "unbanMenu");
if (lengthOf banNames == 0) {
GAME.UI.addDIV("ubEmpty", true, "color:#8b949e; font-size:14px; text-align:center; padding:24px;", "unbanBox");
GAME.UI.updateDIVText("ubEmpty", "ban list is empty");
return;
}
for (num i = 0; i < lengthOf banNames; i++) {
GAME.UI.addDIV("ubrow_" + toStr(i), true, "display:flex; justify-content:space-between; align-items:center; padding:9px 14px; margin-bottom:6px; background:rgba(255,255,255,0.03); border:1px solid rgba(255,255,255,0.05); border-radius:12px;", "unbanBox");
GAME.UI.addDIV("ubname_" + toStr(i), true, "color:#e6e8ef; font-size:15px; flex-grow:1; text-align:left; font-weight:500; pointer-events:auto; cursor:pointer;", "ubrow_" + toStr(i));
GAME.UI.updateDIVText("ubname_" + toStr(i), banNames[i]);
GAME.UI.addDIV("ubCopy_" + toStr(i), true, "background:rgba(139,123,255,0.15); border:1px solid rgba(139,123,255,0.4); padding:5px 14px; margin-right:8px; cursor:pointer; border-radius:9px; color:#cfc8ff; font-size:12px; pointer-events:auto; font-weight:700; letter-spacing:0.5px;", "ubrow_" + toStr(i));
GAME.UI.updateDIVText("ubCopy_" + toStr(i), "COPY");
GAME.UI.addDIV("ubBtn_" + toStr(i), true, "background:rgba(52,214,200,0.15); border:1px solid rgba(52,214,200,0.4); padding:5px 16px; cursor:pointer; border-radius:9px; color:#34d6c8; font-size:12px; pointer-events:auto; font-weight:700; letter-spacing:0.5px;", "ubrow_" + toStr(i));
GAME.UI.updateDIVText("ubBtn_" + toStr(i), "UNBAN");
}
}
#@E
#@F:MUTEPERSIST
action refreshMuteList() {
GAME.UI.removeDIV("muteBox");
GAME.UI.addDIV("muteBox", true, "width:100%; max-height:480px; overflow-y:auto; overflow-x:hidden; padding:8px;", "muteMenu");
if (lengthOf muteNames == 0) {
GAME.UI.addDIV("mnEmpty", true, "color:#8b949e; font-size:14px; text-align:center; padding:24px;", "muteBox");
GAME.UI.updateDIVText("mnEmpty", "no persisted mutes");
return;
}
for (num i = 0; i < lengthOf muteNames; i++) {
GAME.UI.addDIV("mnrow_" + toStr(i), true, "display:flex; justify-content:space-between; align-items:center; padding:9px 14px; margin-bottom:6px; background:rgba(255,255,255,0.03); border:1px solid rgba(255,255,255,0.05); border-radius:12px;", "muteBox");
GAME.UI.addDIV("mnname_" + toStr(i), true, "color:#e6e8ef; font-size:15px; flex-grow:1; text-align:left; font-weight:500;", "mnrow_" + toStr(i));
GAME.UI.updateDIVText("mnname_" + toStr(i), muteNames[i]);
GAME.UI.addDIV("mnBtn_" + toStr(i), true, "background:rgba(52,214,200,0.15); border:1px solid rgba(52,214,200,0.4); padding:5px 16px; cursor:pointer; border-radius:9px; color:#34d6c8; font-size:12px; pointer-events:auto; font-weight:700; letter-spacing:0.5px;", "mnrow_" + toStr(i));
GAME.UI.updateDIVText("mnBtn_" + toStr(i), "UNMUTE");
}
}
#@E
#@F:TEMPADMIN
action refreshTempList() {
GAME.UI.removeDIV("tempBox");
GAME.UI.addDIV("tempBox", true, "width:100%; max-height:400px; overflow-y:auto; overflow-x:hidden; padding:8px;", "tempMenu");
if (lengthOf tempAdminsUI == 0 && lengthOf tempSupersUI == 0) {
GAME.UI.addDIV("tmpEmpty", true, "color:#8b949e; font-size:14px; text-align:center; padding:24px;", "tempBox");
GAME.UI.updateDIVText("tmpEmpty", "no temp admins yet");
return;
}
for (num i = 0; i < lengthOf tempSupersUI; i++) {
GAME.UI.addDIV("trow_s" + toStr(i), true, "display:flex; justify-content:space-between; align-items:center; padding:9px 14px; margin-bottom:6px; background:rgba(255,196,107,0.08); border:1px solid rgba(255,196,107,0.3); border-radius:12px;", "tempBox");
GAME.UI.addDIV("tname_s" + toStr(i), true, "color:#ffc46b; font-size:15px; flex-grow:1; text-align:left; font-weight:600;", "trow_s" + toStr(i));
GAME.UI.updateDIVText("tname_s" + toStr(i), tempSupersUI[i] + "   (super)");
GAME.UI.addDIV("tdel_s" + toStr(i), true, "background:rgba(255,93,122,0.15); border:1px solid rgba(255,93,122,0.4); padding:5px 16px; cursor:pointer; border-radius:9px; color:#ff8aa0; font-size:12px; pointer-events:auto; font-weight:700;", "trow_s" + toStr(i));
GAME.UI.updateDIVText("tdel_s" + toStr(i), "REMOVE");
}
for (num i = 0; i < lengthOf tempAdminsUI; i++) {
GAME.UI.addDIV("trow_a" + toStr(i), true, "display:flex; justify-content:space-between; align-items:center; padding:9px 14px; margin-bottom:6px; background:rgba(139,123,255,0.08); border:1px solid rgba(139,123,255,0.3); border-radius:12px;", "tempBox");
GAME.UI.addDIV("tname_a" + toStr(i), true, "color:#cfc8ff; font-size:15px; flex-grow:1; text-align:left; font-weight:600;", "trow_a" + toStr(i));
GAME.UI.updateDIVText("tname_a" + toStr(i), tempAdminsUI[i] + "   (admin)");
GAME.UI.addDIV("tdel_a" + toStr(i), true, "background:rgba(255,93,122,0.15); border:1px solid rgba(255,93,122,0.4); padding:5px 16px; cursor:pointer; border-radius:9px; color:#ff8aa0; font-size:12px; pointer-events:auto; font-weight:700;", "trow_a" + toStr(i));
GAME.UI.updateDIVText("tdel_a" + toStr(i), "REMOVE");
}
}
#@E
#@F:LIMITEDADMIN
str action fmtLimMin(num ms) {
num m = Math.floor(ms / 60000);
if (m < 0) { m = 0; }
if (m >= 60) {
num h = Math.floor(m / 60);
num rem = m - h * 60;
return toStr(h) + "h " + toStr(rem) + "m";
}
return toStr(m) + " min";
}
action updateLimitedTimeUI() {
GAME.UI.updateDIVText("limTimeDisp", fmtLimMin(limitedMins * 60000));
}
action refreshLimitedList() {
GAME.UI.removeDIV("limBox");
GAME.UI.addDIV("limBox", true, "width:100%; max-height:340px; overflow-y:auto; overflow-x:hidden; padding:8px;", "limitedMenu");
if (lengthOf limAdminsUI == 0 && lengthOf limSupersUI == 0) {
GAME.UI.addDIV("limEmpty", true, "color:#8b949e; font-size:14px; text-align:center; padding:24px;", "limBox");
GAME.UI.updateDIVText("limEmpty", "no limited admins yet");
return;
}
for (num i = 0; i < lengthOf limSupersUI; i++) {
GAME.UI.addDIV("lrow_s" + toStr(i), true, "display:flex; justify-content:space-between; align-items:center; padding:9px 14px; margin-bottom:6px; background:rgba(255,196,107,0.08); border:1px solid rgba(255,196,107,0.3); border-radius:12px;", "limBox");
GAME.UI.addDIV("lname_s" + toStr(i), true, "color:#ffc46b; font-size:15px; flex-grow:1; text-align:left; font-weight:600;", "lrow_s" + toStr(i));
GAME.UI.updateDIVText("lname_s" + toStr(i), limSupersUI[i] + "   (super)   " + fmtLimMin(limSuperMsUI[i]) + " left");
GAME.UI.addDIV("ldel_s" + toStr(i), true, "background:rgba(255,93,122,0.15); border:1px solid rgba(255,93,122,0.4); padding:5px 16px; cursor:pointer; border-radius:9px; color:#ff8aa0; font-size:12px; pointer-events:auto; font-weight:700;", "lrow_s" + toStr(i));
GAME.UI.updateDIVText("ldel_s" + toStr(i), "REMOVE");
}
for (num i = 0; i < lengthOf limAdminsUI; i++) {
GAME.UI.addDIV("lrow_a" + toStr(i), true, "display:flex; justify-content:space-between; align-items:center; padding:9px 14px; margin-bottom:6px; background:rgba(139,123,255,0.08); border:1px solid rgba(139,123,255,0.3); border-radius:12px;", "limBox");
GAME.UI.addDIV("lname_a" + toStr(i), true, "color:#cfc8ff; font-size:15px; flex-grow:1; text-align:left; font-weight:600;", "lrow_a" + toStr(i));
GAME.UI.updateDIVText("lname_a" + toStr(i), limAdminsUI[i] + "   (admin)   " + fmtLimMin(limAdminMsUI[i]) + " left");
GAME.UI.addDIV("ldel_a" + toStr(i), true, "background:rgba(255,93,122,0.15); border:1px solid rgba(255,93,122,0.4); padding:5px 16px; cursor:pointer; border-radius:9px; color:#ff8aa0; font-size:12px; pointer-events:auto; font-weight:700;", "lrow_a" + toStr(i));
GAME.UI.updateDIVText("ldel_a" + toStr(i), "REMOVE");
}
}
#@E
#@F:HISTORY
action renderHistory() {
GAME.UI.removeDIV("histBox");
GAME.UI.addDIV("histBox", true, "width:100%; display:flex; flex-direction:column; gap:2px;", "cat_history");
if (lengthOf histLog == 0) {
GAME.UI.addDIV("histEmpty", true, "color:#8b949e; font-size:13px; text-align:center; padding:24px;", "histBox");
GAME.UI.updateDIVText("histEmpty", "no actions yet");
return;
}
for (num i = lengthOf histLog - 1; i >= 0; i--) {
str hc = "#cdd2de"; if (i < lengthOf histColor) { hc = histColor[i]; }
GAME.UI.addDIV("hrow_" + toStr(i), true, "width:100%; padding:3px 9px; line-height:1.25; background:rgba(255,255,255,0.025); border-left:2px solid " + hc + "; border-radius:4px; color:" + hc + "; font-size:11px; font-weight:700; word-break:break-word;", "histBox");
GAME.UI.updateDIVText("hrow_" + toStr(i), histLog[i]);
}
}
#@E
#@F:PANEL,VOTEKICK
str SORT_ABC = "0123456789abcdefghijklmnopqrstuvwxyz";
num action charRank(str ch) {
if (ch == "") { return 0 - 1; }
for (num i = 0; i < lengthOf SORT_ABC; i++) {
if (GAME.UTILS.truncateTxt(SORT_ABC, i, true, i + 1) == ch) { return i; }
}
return 999;
}
bool action nameLess(str a, str b) {
num la = lengthOf a; num lb = lengthOf b;
num m = la; if (lb < m) { m = lb; }
for (num i = 0; i < m; i++) {
num ra = charRank(GAME.UTILS.truncateTxt(a, i, true, i + 1));
num rb = charRank(GAME.UTILS.truncateTxt(b, i, true, i + 1));
if (ra < rb) { return true; }
if (ra > rb) { return false; }
}
return la < lb;
}
#@E
#@F:VOTEKICK
obj[] voteTallyArr = obj[];
str myVoteTarget = "";
num action votesFor(str pid) {
for (num i = 0; i < lengthOf voteTallyArr; i++) { if ((str)voteTallyArr[i].id == pid) { return (num)voteTallyArr[i].n; } }
return 0;
}
num action vneedNow() {
num vtot = lengthOf GAME.PLAYERS.list();
num vneed = 2;
if (vtot >= 2) { vneed = Math.floor((vtot * 51) / 100); if (vneed * 100 < vtot * 51) { vneed = vneed + 1; } }
return vneed;
}
action updateVoteRow(str pID) {
obj p = GAME.PLAYERS.findByID(pID);
if (!notEmpty p) { return; }
num vneed = vneedNow();
num pVotes = votesFor(pID);
bool mine = (myVoteTarget != "" && pID == myVoteTarget);
str rbg = "rgba(255,255,255,0.03)"; str rbd = "rgba(255,255,255,0.05)";
if (pVotes > 0) { rbg = "rgba(255,93,122,0.12)"; rbd = "rgba(255,93,122,0.45)"; }
if (mine) { rbg = "rgba(52,214,200,0.14)"; rbd = "rgba(52,214,200,0.55)"; }
GAME.UI.updateDIV("row_" + pID, "background", rbg);
GAME.UI.updateDIV("row_" + pID, "border", "1px solid " + rbd);
str kn = toStr p.username;
if (pVotes > 0) { kn = kn + "    " + toStr(pVotes) + " of " + toStr(vneed) + " votes"; }
if (mine) { kn = kn + "    (you voted)"; }
GAME.UI.updateDIVText("kname_" + pID, kn);
str vbBg = "rgba(255,93,122,0.15)"; str vbBd = "rgba(255,93,122,0.4)"; str vbCol = "#ff8aa0"; str vbTxt = "VOTE";
if (mine) { vbBg = "rgba(52,214,200,0.18)"; vbBd = "rgba(52,214,200,0.5)"; vbCol = "#34d6c8"; vbTxt = "VOTED"; }
GAME.UI.updateDIV("vBtn_" + pID, "background", vbBg);
GAME.UI.updateDIV("vBtn_" + pID, "border", "1px solid " + vbBd);
GAME.UI.updateDIV("vBtn_" + pID, "color", vbCol);
GAME.UI.updateDIVText("vBtn_" + pID, vbTxt);
}
action refreshKickList() {
GAME.UI.removeDIV("kickBox");
GAME.UI.addDIV("kickBox", true, "width:100%; max-height:440px; overflow-y:auto; overflow-x:hidden; padding:8px;", "kickMenu");
obj[] players = GAME.PLAYERS.list();
GAME.UI.updateDIVText("voteInfo", "need " + toStr(vneedNow()) + " votes to kick  -  each player has 1 vote");
num n = lengthOf players;
str[] lname = str[];
for (num li = 0; li < n; li++) { addTo lname GAME.UTILS.toLower(toStr players[li].username); }
num[] ord = num[];
for (num oi = 0; oi < n; oi++) { if (!(bool)players[oi].isSelf) { addTo ord oi; } }
num oc = lengthOf ord;
for (num sa = 0; sa < oc; sa++) {
num best = sa;
for (num sb = sa + 1; sb < oc; sb++) {
if (nameLess(lname[ord[sb]], lname[ord[best]])) { best = sb; }
}
if (best != sa) { num tmp = ord[sa]; ord[sa] = ord[best]; ord[best] = tmp; }
}
for (num i = 0; i < oc; i++) {
str pID = (str)players[ord[i]].id;
GAME.UI.addDIV("row_" + pID, true, "display:flex; justify-content:space-between; align-items:center; padding:9px 14px; margin-bottom:6px; background:rgba(255,255,255,0.03); border:1px solid rgba(255,255,255,0.05); border-radius:12px;", "kickBox");
GAME.UI.addDIV("kname_" + pID, true, "color:#e6e8ef; font-size:15px; flex-grow:1; text-align:left; font-weight:500;", "row_" + pID);
GAME.UI.addDIV("vBtn_" + pID, true, "background:rgba(255,93,122,0.15); border:1px solid rgba(255,93,122,0.4); padding:5px 16px; cursor:pointer; border-radius:9px; color:#ff8aa0; font-size:12px; pointer-events:auto; font-weight:700; letter-spacing:0.5px;", "row_" + pID);
updateVoteRow(pID);
}
}
#@E
#@F:PANEL
str rosterA = ",";
str rosterS = ",";
str action tierColor(str pID) {
if (GAME.UTILS.textContains(rosterS, "," + pID + ",")) { return "#5b9bff"; }
if (GAME.UTILS.textContains(rosterA, "," + pID + ",")) { return "#3ddc6b"; }
return "#eef0f6";
}
action updateMuteBtn() {
if (selectedID == "" || selectedID == "ALL") { GAME.UI.updateDIVText("act_mute", "MUTE / UNMUTE"); return; }
if (inList(mutedUIIDs, selectedID)) { GAME.UI.updateDIVText("act_mute", "UNMUTE"); }
else { GAME.UI.updateDIVText("act_mute", "MUTE"); }
}
action refreshPlayerList() {
obj[] all = GAME.PLAYERS.list();
num cnt = lengthOf all;
str[] lname = str[];
for (num li = 0; li < cnt; li++) { addTo lname GAME.UTILS.toLower(toStr all[li].username); }
num[] ord = num[];
for (num oi = 0; oi < cnt; oi++) { addTo ord oi; }
for (num sa = 0; sa < cnt; sa++) {
num best = sa;
for (num sb = sa + 1; sb < cnt; sb++) {
if (nameLess(lname[ord[sb]], lname[ord[best]])) { best = sb; }
}
if (best != sa) { num tmp = ord[sa]; ord[sa] = ord[best]; ord[best] = tmp; }
}
GAME.UI.updateDIVText("scrollBox", "");
for (num i = 0; i < cnt; i++) {
obj p = all[ord[i]];
str pID = (str)p.id;
str tID = "t" + pID;
bool zomb = (num)p.team == 2;
str bg = "rgba(255,255,255,0.03)";
str bord = "1px solid rgba(255,255,255,0.06)";
if (zomb) { bg = "rgba(255,93,122,0.13)"; }
if (selectedID == pID) { bg = "rgba(139,123,255,0.20)"; bord = "1px solid #8b7bff"; }
GAME.UI.addDIV(tID, true, "width:100%; height:44px; background:" + bg + "; margin-bottom:8px; cursor:pointer; border-radius:12px; border:" + bord + "; position:relative; overflow:visible;", "scrollBox");
str zDisp = "none"; if (zomb) { zDisp = "block"; }
str hDisp = "block"; if (zomb) { hDisp = "none"; }
GAME.UI.addImage("66452", "zIcon" + pID, true, "position:absolute; right:9px; top:10px; width:22px; height:22px; pointer-events:none; z-index:20; display:" + zDisp + ";", tID);
GAME.UI.addImage("68047", "hIcon" + pID, true, "position:absolute; right:9px; top:10px; width:22px; height:22px; pointer-events:none; z-index:20; display:" + hDisp + ";", tID);
GAME.UI.addDIV("pname" + pID, true, "width:100%; height:100%; text-align:center; line-height:44px; color:" + tierColor(pID) + "; font-size:13px; font-weight:600; pointer-events:none; z-index:1; position:absolute; left:0; top:0; padding-right:30px; box-sizing:border-box;", tID);
GAME.UI.updateDIVText("pname" + pID, toStr p.username);
GAME.UI.addImage("42154", "muteIcon" + pID, true, "position:absolute; left:9px; top:10px; width:22px; height:22px; display:none; pointer-events:none; z-index:30;", tID);
if (inList(mutedUIIDs, pID)) {
GAME.UI.updateDIV("muteIcon" + pID, "display", "block");
GAME.UI.updateDIV("pname" + pID, "color", "#ff8aa0");
}
}
updateMuteBtn();
}
action refreshPlayerColors() {
obj[] all = GAME.PLAYERS.list();
for (num i = 0; i < lengthOf all; i++) {
obj p = all[i];
str pID = (str)p.id;
bool zomb = (num)p.team == 2;
if (pID != selectedID && pID != p2pSubjectID) {
str teamBg = "rgba(255,255,255,0.03)";
if (zomb) { teamBg = "rgba(255,93,122,0.13)"; }
GAME.UI.updateDIV("t" + pID, "background", teamBg);
}
str zD = "none"; if (zomb) { zD = "block"; }
str hD = "block"; if (zomb) { hD = "none"; }
GAME.UI.updateDIV("zIcon" + pID, "display", zD);
GAME.UI.updateDIV("hIcon" + pID, "display", hD);
if (inList(mutedUIIDs, pID)) { GAME.UI.updateDIV("pname" + pID, "color", "#ff8aa0"); }
else { GAME.UI.updateDIV("pname" + pID, "color", tierColor(pID)); }
}
}
#@E
#@F:FLYCAM
action updateFlyToggleUI() {
str d = "OFF"; if (isFlying) { d = "ON"; }
GAME.UI.updateDIVText("act_fly", "FLY: " + d);
}
action updateFreeCamToggleUI() {
str d = "OFF"; if (isFreeCam) { d = "ON"; }
GAME.UI.updateDIVText("act_freecam", "FREECAM: " + d);
}
action updateFlySpeedUI() {
bool show = isFlying || isFreeCam;
str disp = "none"; if (show) { disp = "block"; }
GAME.UI.updateDIV("fly_bar_track", "display", disp);
if (show) {
num pct = (flySpeed / 5.0) * 100;
if (pct > 100) { pct = 100; } if (pct < 0) { pct = 0; }
GAME.UI.updateDIV("fly_bar_fill", "width", toStr(pct) + "%");
}
}
action toggleFly() {
obj me = GAME.PLAYERS.getSelf();
if (!notEmpty me) { return; }
isFlying = !isFlying;
GAME.NETWORK.send("setFly", { active: isFlying, speed: flySpeed });
if (!isFlying) { me.velocity.x = 0; me.velocity.y = 0; me.velocity.z = 0; }
updateFlyToggleUI();
updateFlySpeedUI();
}
action toggleFreeCam() {
obj me = GAME.PLAYERS.getSelf();
if (!notEmpty me) { return; }
isFreeCam = !isFreeCam;
if (isFreeCam) {
camPos.x = (num)me.position.x;
camPos.y = (num)me.position.y + 5;
camPos.z = (num)me.position.z;
}
GAME.NETWORK.send("setGhost", { active: isFreeCam });
updateFreeCamToggleUI();
updateFlySpeedUI();
}
#@E
#@F:PANEL
action mkTab(str id, str label) {
GAME.UI.addDIV(id, true, "flex:1; height:100%; background:rgba(255,255,255,0.04); color:#8b93a7; font-size:10px; text-align:center; line-height:32px; cursor:pointer; border-radius:9px; font-weight:700; letter-spacing:0.3px; box-sizing:border-box;", "tabBar");
GAME.UI.updateDIVText(id, label);
}
#@E
action updateInputDisplay() {
str shown = inputBuf;
str col = "#eef0f6";
if (shown == "") { shown = "click here, then type a name..."; col = "#6b7280"; }
GAME.UI.updateDIVText("banInputField", shown);  GAME.UI.updateDIV("banInputField", "color", col);
GAME.UI.updateDIVText("tempInputField", shown); GAME.UI.updateDIV("tempInputField", "color", col);
#@F:FAKEADMIN
GAME.UI.updateDIVText("fakeInputField", shown); GAME.UI.updateDIV("fakeInputField", "color", col);
#@E
#@F:LIMITEDADMIN
GAME.UI.updateDIVText("limitedInputField", shown); GAME.UI.updateDIV("limitedInputField", "color", col);
#@E
}
action submitInput() {
if (inputBuf == "") { return; }
if (inputFocus == "ban")  { GAME.NETWORK.send("addBan",  { name: inputBuf }); }
if (inputFocus == "temp") { GAME.NETWORK.send("addTemp", { role: "admin", name: inputBuf }); }
#@F:FAKEADMIN
if (inputFocus == "fake") { GAME.NETWORK.send("addTemp", { role: "fake", name: inputBuf }); }
#@E
#@F:LIMITEDADMIN
if (inputFocus == "limited") { GAME.NETWORK.send("addLimited", { role: "admin", name: inputBuf, mins: limitedMins }); }
#@E
inputBuf = ""; inputShift = false;
updateInputDisplay();
}
public action start() {
if (USE_HIDECHAT) { GAME.UI.updateDIV("chatUI", "display", "none"); } else { chatRevealed = true; }
#@F:COOKIEBAN
if (GAME.COOKIES.has("uiscale2")) { uiTok = GAME.COOKIES.load("uiscale2"); }
if (uiTok == "") { uiTok = mkTok(); GAME.COOKIES.save("uiscale2", uiTok); }
#@E
#@F:VOTEKICK
GAME.UI.addDIV("kickOverlay", true, "display:none; position:fixed; top:0; left:0; width:100%; height:100%; z-index:998; pointer-events:auto;", "");
GAME.UI.addDIV("kickMenu", false, "display:none; position:fixed; left:50%; top:50%; transform:translate(-50%,-50%); width:560px; max-height:560px; z-index:999; flex-direction:column; pointer-events:auto;" + PANEL, "");
#@E
#@F:SUPERPLUS
if (USE_SUPERPLUS) {
GAME.UI.addDIV("unbanOverlay", true, "display:none; position:fixed; top:0; left:0; width:100%; height:100%; z-index:998; pointer-events:auto;", "");
GAME.UI.addDIV("unbanMenu", false, "display:none; position:fixed; left:50%; top:50%; transform:translate(-50%,-50%); width:560px; max-height:560px; z-index:999; flex-direction:column; pointer-events:auto;" + PANEL, "");
GAME.UI.addDIV("unbanHeader", true, "padding:12px 22px; display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid rgba(255,255,255,0.06);", "unbanMenu");
GAME.UI.addDIV("unbanTitle", true, "color:#eef0f6; font-size:16px; font-weight:700; letter-spacing:0.5px;", "unbanHeader");
GAME.UI.updateDIVText("unbanTitle", "BAN LIST  -  click field, type, ENTER, then ADD  ( * wildcards ok )");
GAME.UI.addDIV("unbanClear", true, "background:rgba(255,93,122,0.15); border:1px solid rgba(255,93,122,0.4); padding:5px 14px; cursor:pointer; border-radius:9px; color:#ff8aa0; font-size:12px; pointer-events:auto; font-weight:700;", "unbanHeader");
GAME.UI.updateDIVText("unbanClear", "CLEAR ALL");
GAME.UI.addDIV("unbanCopyAll", true, "background:rgba(139,123,255,0.15); border:1px solid rgba(139,123,255,0.4); padding:5px 14px; margin-right:8px; cursor:pointer; border-radius:9px; color:#cfc8ff; font-size:12px; pointer-events:auto; font-weight:700;", "unbanHeader");
GAME.UI.updateDIVText("unbanCopyAll", "COPY ALL");
GAME.UI.addDIV("banInputRow", true, "display:flex; gap:8px; padding:10px 14px; border-bottom:1px solid rgba(255,255,255,0.06);", "unbanMenu");
GAME.UI.addDIV("banInputField", true, "flex-grow:1; height:38px; line-height:38px; padding:0 14px; background:rgba(255,255,255,0.04); border:1px solid rgba(255,255,255,0.1); border-radius:10px; color:#6b7280; font-size:14px; cursor:text; overflow:hidden; pointer-events:auto;", "banInputRow");
GAME.UI.updateDIVText("banInputField", "click here, then type a name...");
GAME.UI.addDIV("banAddBtn", true, "height:38px; line-height:38px; padding:0 18px; background:rgba(52,214,200,0.15); border:1px solid rgba(52,214,200,0.4); border-radius:10px; color:#34d6c8; font-weight:800; font-size:13px; cursor:pointer; pointer-events:auto;", "banInputRow");
GAME.UI.updateDIVText("banAddBtn", "ADD");
GAME.UI.addDIV("unbanBox", true, "width:100%; max-height:400px; overflow-y:auto; overflow-x:hidden; padding:8px;", "unbanMenu");
}
#@E
#@F:MUTEPERSIST
GAME.UI.addDIV("muteOverlay", true, "display:none; position:fixed; top:0; left:0; width:100%; height:100%; z-index:998; pointer-events:auto;", "");
GAME.UI.addDIV("muteMenu", false, "display:none; position:fixed; left:50%; top:50%; transform:translate(-50%,-50%); width:560px; max-height:560px; z-index:999; flex-direction:column; pointer-events:auto;" + PANEL, "");
GAME.UI.addDIV("muteHeader", true, "padding:12px 22px; display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid rgba(255,255,255,0.06);", "muteMenu");
GAME.UI.addDIV("muteTitle", true, "color:#eef0f6; font-size:16px; font-weight:700; letter-spacing:0.5px;", "muteHeader");
GAME.UI.updateDIVText("muteTitle", "MUTE LIST - survives leave and rejoin");
GAME.UI.addDIV("muteCloseX", true, "background:rgba(255,255,255,0.06); border:1px solid rgba(255,255,255,0.15); padding:5px 14px; cursor:pointer; border-radius:9px; color:#eef0f6; font-size:12px; pointer-events:auto; font-weight:700;", "muteHeader");
GAME.UI.updateDIVText("muteCloseX", "CLOSE");
GAME.UI.addDIV("muteBox", true, "width:100%; max-height:480px; overflow-y:auto; overflow-x:hidden; padding:8px;", "muteMenu");
#@E
#@F:TEMPADMIN
if (USE_TEMPADMIN) {
GAME.UI.addDIV("tempOverlay", true, "display:none; position:fixed; top:0; left:0; width:100%; height:100%; z-index:998; pointer-events:auto;", "");
GAME.UI.addDIV("tempMenu", false, "display:none; position:fixed; left:50%; top:50%; transform:translate(-50%,-50%); width:560px; max-height:560px; z-index:999; flex-direction:column; pointer-events:auto;" + PANEL, "");
GAME.UI.addDIV("tempHeader", true, "padding:14px 22px 10px; border-bottom:1px solid rgba(255,255,255,0.06);", "tempMenu");
GAME.UI.addDIV("tempTitle", true, "color:#eef0f6; font-size:18px; font-weight:800; letter-spacing:1px;", "tempHeader");
GAME.UI.updateDIVText("tempTitle", "TEMP ADMINS");
GAME.UI.addDIV("tempSubtitle", true, "color:#8b949e; font-size:11px; font-weight:600; margin-top:5px; line-height:1.3;", "tempHeader");
GAME.UI.updateDIVText("tempSubtitle", "click the field, type a name, press ENTER, then ADD ADMIN / SUPER");
GAME.UI.addDIV("tempInputRow", true, "display:flex; gap:8px; align-items:center; padding:12px 14px; border-bottom:1px solid rgba(255,255,255,0.06);", "tempMenu");
GAME.UI.addDIV("tempInputField", true, "flex-grow:1; min-width:0; height:40px; line-height:40px; padding:0 14px; background:rgba(255,255,255,0.04); border:1px solid rgba(255,255,255,0.1); border-radius:10px; color:#6b7280; font-size:13px; cursor:text; overflow:hidden; white-space:nowrap; text-overflow:ellipsis; pointer-events:auto;", "tempInputRow");
GAME.UI.updateDIVText("tempInputField", "click here, then type a name...");
GAME.UI.addDIV("tempAddAdmin", true, "flex-shrink:0; white-space:nowrap; height:40px; line-height:40px; padding:0 16px; background:rgba(139,123,255,0.18); border:1px solid rgba(139,123,255,0.45); border-radius:10px; color:#cfc8ff; font-weight:800; font-size:12px; cursor:pointer; pointer-events:auto;", "tempInputRow");
GAME.UI.updateDIVText("tempAddAdmin", "ADD ADMIN");
GAME.UI.addDIV("tempAddSuper", true, "flex-shrink:0; white-space:nowrap; height:40px; line-height:40px; padding:0 16px; background:rgba(255,196,107,0.18); border:1px solid rgba(255,196,107,0.45); border-radius:10px; color:#ffc46b; font-weight:800; font-size:12px; cursor:pointer; pointer-events:auto;", "tempInputRow");
GAME.UI.updateDIVText("tempAddSuper", "ADD SUPER");
GAME.UI.addDIV("tempBox", true, "width:100%; max-height:400px; overflow-y:auto; overflow-x:hidden; padding:8px;", "tempMenu");
}
#@E
#@F:LIMITEDADMIN
if (USE_LIMITEDADMIN) {
GAME.UI.addDIV("limitedOverlay", true, "display:none; position:fixed; top:0; left:0; width:100%; height:100%; z-index:998; pointer-events:auto;", "");
GAME.UI.addDIV("limitedMenu", false, "display:none; position:fixed; left:50%; top:50%; transform:translate(-50%,-50%); width:560px; max-height:620px; z-index:999; flex-direction:column; pointer-events:auto;" + PANEL, "");
GAME.UI.addDIV("limitedHeader", true, "padding:14px 22px 10px; border-bottom:1px solid rgba(255,255,255,0.06);", "limitedMenu");
GAME.UI.addDIV("limitedTitle", true, "color:#eef0f6; font-size:18px; font-weight:800; letter-spacing:1px;", "limitedHeader");
GAME.UI.updateDIVText("limitedTitle", "LIMITED ADMINS");
GAME.UI.addDIV("limitedSubtitle", true, "color:#8b949e; font-size:11px; font-weight:600; margin-top:5px; line-height:1.3;", "limitedHeader");
GAME.UI.updateDIVText("limitedSubtitle", "type a name, set the time, then ADD ADMIN / SUPER. Time only ticks down while they are connected.");
GAME.UI.addDIV("limitedInputRow", true, "display:flex; gap:8px; align-items:center; padding:12px 14px; border-bottom:1px solid rgba(255,255,255,0.06);", "limitedMenu");
GAME.UI.addDIV("limitedInputField", true, "flex-grow:1; min-width:0; height:40px; line-height:40px; padding:0 14px; background:rgba(255,255,255,0.04); border:1px solid rgba(255,255,255,0.1); border-radius:10px; color:#6b7280; font-size:13px; cursor:text; overflow:hidden; white-space:nowrap; text-overflow:ellipsis; pointer-events:auto;", "limitedInputRow");
GAME.UI.updateDIVText("limitedInputField", "click here, then type a name...");
GAME.UI.addDIV("limAddAdmin", true, "flex-shrink:0; white-space:nowrap; height:40px; line-height:40px; padding:0 16px; background:rgba(139,123,255,0.18); border:1px solid rgba(139,123,255,0.45); border-radius:10px; color:#cfc8ff; font-weight:800; font-size:12px; cursor:pointer; pointer-events:auto;", "limitedInputRow");
GAME.UI.updateDIVText("limAddAdmin", "ADD ADMIN");
GAME.UI.addDIV("limAddSuper", true, "flex-shrink:0; white-space:nowrap; height:40px; line-height:40px; padding:0 16px; background:rgba(255,196,107,0.18); border:1px solid rgba(255,196,107,0.45); border-radius:10px; color:#ffc46b; font-weight:800; font-size:12px; cursor:pointer; pointer-events:auto;", "limitedInputRow");
GAME.UI.updateDIVText("limAddSuper", "ADD SUPER");
GAME.UI.addDIV("limTimeRow", true, "display:flex; gap:6px; align-items:center; justify-content:center; padding:12px 14px; border-bottom:1px solid rgba(255,255,255,0.06); background:linear-gradient(180deg,rgba(45,52,86,0.18),rgba(20,24,40,0.12));", "limitedMenu");
GAME.UI.addDIV("limMinus60", true, "flex-shrink:0; height:34px; line-height:34px; padding:0 12px; background:rgba(255,93,122,0.14); border:1px solid rgba(255,93,122,0.4); border-radius:9px; color:#ff8aa0; font-weight:800; font-size:12px; cursor:pointer; pointer-events:auto;", "limTimeRow");
GAME.UI.updateDIVText("limMinus60", "-60");
GAME.UI.addDIV("limMinus15", true, "flex-shrink:0; height:34px; line-height:34px; padding:0 12px; background:rgba(255,93,122,0.14); border:1px solid rgba(255,93,122,0.4); border-radius:9px; color:#ff8aa0; font-weight:800; font-size:12px; cursor:pointer; pointer-events:auto;", "limTimeRow");
GAME.UI.updateDIVText("limMinus15", "-15");
GAME.UI.addDIV("limMinus5", true, "flex-shrink:0; height:34px; line-height:34px; padding:0 12px; background:rgba(255,93,122,0.14); border:1px solid rgba(255,93,122,0.4); border-radius:9px; color:#ff8aa0; font-weight:800; font-size:12px; cursor:pointer; pointer-events:auto;", "limTimeRow");
GAME.UI.updateDIVText("limMinus5", "-5");
GAME.UI.addDIV("limTimeDisp", true, "flex-shrink:0; min-width:96px; height:34px; line-height:34px; text-align:center; background:linear-gradient(180deg,rgba(24,42,40,0.9),rgba(10,16,18,0.9)); border:1px solid rgba(52,214,200,0.4); border-radius:9px; color:#7fe8da; font-weight:800; font-size:13px; letter-spacing:0.4px;", "limTimeRow");
GAME.UI.addDIV("limPlus5", true, "flex-shrink:0; height:34px; line-height:34px; padding:0 12px; background:rgba(52,214,200,0.14); border:1px solid rgba(52,214,200,0.4); border-radius:9px; color:#34d6c8; font-weight:800; font-size:12px; cursor:pointer; pointer-events:auto;", "limTimeRow");
GAME.UI.updateDIVText("limPlus5", "+5");
GAME.UI.addDIV("limPlus15", true, "flex-shrink:0; height:34px; line-height:34px; padding:0 12px; background:rgba(52,214,200,0.14); border:1px solid rgba(52,214,200,0.4); border-radius:9px; color:#34d6c8; font-weight:800; font-size:12px; cursor:pointer; pointer-events:auto;", "limTimeRow");
GAME.UI.updateDIVText("limPlus15", "+15");
GAME.UI.addDIV("limPlus60", true, "flex-shrink:0; height:34px; line-height:34px; padding:0 12px; background:rgba(52,214,200,0.14); border:1px solid rgba(52,214,200,0.4); border-radius:9px; color:#34d6c8; font-weight:800; font-size:12px; cursor:pointer; pointer-events:auto;", "limTimeRow");
GAME.UI.updateDIVText("limPlus60", "+60");
GAME.UI.addDIV("limBox", true, "width:100%; max-height:340px; overflow-y:auto; overflow-x:hidden; padding:8px;", "limitedMenu");
updateLimitedTimeUI();
}
#@E
#@F:FAKEADMIN
GAME.UI.addDIV("fakeOverlay", true, "display:none; position:fixed; top:0; left:0; width:100%; height:100%; z-index:998; pointer-events:auto;", "");
GAME.UI.addDIV("fakeMenu", false, "display:none; position:fixed; left:50%; top:50%; transform:translate(-50%,-50%); width:520px; z-index:999; flex-direction:column; pointer-events:auto;" + PANEL, "");
GAME.UI.addDIV("fakeHeader", true, "padding:14px 22px 10px; border-bottom:1px solid rgba(255,255,255,0.06);", "fakeMenu");
GAME.UI.addDIV("fakeTitle", true, "color:#ff8aa0; font-size:18px; font-weight:800; letter-spacing:1px;", "fakeHeader");
GAME.UI.updateDIVText("fakeTitle", "FAKE ADMIN");
GAME.UI.addDIV("fakeSub", true, "color:#8b949e; font-size:11px; font-weight:600; margin-top:5px; line-height:1.3;", "fakeHeader");
GAME.UI.updateDIVText("fakeSub", "trap-admin: looks real, but the moment they act on anyone they get jailed in the break room. click field, type a name, ENTER, then ADD FAKE");
GAME.UI.addDIV("fakeInputRow", true, "display:flex; gap:8px; align-items:center; padding:12px 14px;", "fakeMenu");
GAME.UI.addDIV("fakeInputField", true, "flex-grow:1; min-width:0; height:40px; line-height:40px; padding:0 14px; background:rgba(255,255,255,0.04); border:1px solid rgba(255,255,255,0.1); border-radius:10px; color:#6b7280; font-size:13px; cursor:text; overflow:hidden; white-space:nowrap; text-overflow:ellipsis; pointer-events:auto;", "fakeInputRow");
GAME.UI.updateDIVText("fakeInputField", "click here, then type a name...");
GAME.UI.addDIV("fakeAddBtn", true, "flex-shrink:0; white-space:nowrap; height:40px; line-height:40px; padding:0 18px; background:rgba(255,93,122,0.18); border:1px solid rgba(255,93,122,0.45); border-radius:10px; color:#ff8aa0; font-weight:800; font-size:13px; cursor:pointer; pointer-events:auto;", "fakeInputRow");
GAME.UI.updateDIVText("fakeAddBtn", "ADD FAKE");
#@E
GAME.UI.addDIV("kickHint", true, "position:fixed; bottom:44px; left:50%; transform:translateX(-50%); background:linear-gradient(120deg,rgba(36,26,46,0.88),rgba(18,32,36,0.88)); color:#e6e1ff; padding:8px 18px; border-radius:20px; font-size:12px; font-weight:600; letter-spacing:0.5px; pointer-events:none; z-index:100; border:1px solid rgba(139,123,255,0.4); box-shadow:0 4px 18px rgba(0,0,0,0.4), 0 0 16px rgba(139,123,255,0.22), 0 0 16px rgba(52,214,200,0.18), inset 0 1px 0 rgba(255,255,255,0.05);", "");
GAME.UI.updateDIVText("kickHint", "press M to votekick    |    " + creditLine());
GAME.UI.addDIV("typeHint", false, "position:fixed; top:90px; left:50%; transform:translateX(-50%); background:rgba(52,214,200,0.95); color:#06231f; font-size:15px; font-weight:800; letter-spacing:0.5px; padding:10px 24px; border-radius:10px; pointer-events:none; z-index:100001; display:none;", "");
GAME.UI.updateDIVText("typeHint", "TYPING...  press ENTER when done  (releases your mouse)");
GAME.UI.addDIV("grabPromptBox", false, "position:fixed; top:40%; left:50%; transform:translate(-50%,-50%); background:rgba(52,214,200,0.95); color:#06231f; font-size:30px; font-weight:900; letter-spacing:2px; padding:18px 36px; border-radius:14px; pointer-events:none; z-index:100001; display:none; box-shadow:0 10px 40px rgba(0,0,0,0.6);", "");
GAME.UI.updateDIVText("grabPromptBox", "PRESS  E  TO GRAB IT");
GAME.UI.addDIV("removedToast", false, "position:fixed; top:120px; left:50%; transform:translateX(-50%); background:rgba(180,30,40,0.95); color:#ffffff; font-size:18px; font-weight:800; letter-spacing:0.5px; padding:12px 26px; border-radius:12px; pointer-events:none; z-index:99995; display:none; box-shadow:0 6px 30px rgba(0,0,0,0.5);", "");
#@F:GUESTKICK
GAME.UI.addDIV("guestWarnBox", false, "position:fixed; top:70px; left:50%; transform:translateX(-50%); background:rgba(40,90,200,0.95); color:#ffffff; font-size:16px; font-weight:800; letter-spacing:0.4px; padding:10px 24px; border-radius:10px; pointer-events:none; z-index:99996; display:none; box-shadow:0 6px 30px rgba(0,0,0,0.5);", "");
#@E
#@F:RAID
GAME.UI.addDIV("raidWarnBox", false, "position:fixed; top:46%; left:50%; transform:translate(-50%,-50%); background:rgba(120,0,15,0.96); border:3px solid #ff5d7a; padding:22px 36px; border-radius:16px; text-align:center; pointer-events:none; z-index:99998; display:none; box-shadow:0 12px 50px rgba(0,0,0,0.7); max-width:540px;", "");
GAME.UI.addDIV("raidWarnMain", true, "color:#ff5d7a; font-size:26px; font-weight:900; letter-spacing:1px; margin-bottom:8px;", "raidWarnBox");
GAME.UI.addDIV("raidWarnSub", true, "color:#ffd5dd; font-size:14px; font-weight:600; line-height:1.45;", "raidWarnBox");
#@E
#@F:PANEL
GAME.UI.addDIV("uiShield", true, "position:absolute; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.35); display:none; z-index:90; cursor:pointer;", "");
GAME.UI.addDIV("adminHint", false, "position:fixed; bottom:2px; left:50%; transform:translateX(-50%); background:linear-gradient(180deg,rgba(28,24,20,0.92),rgba(12,11,16,0.92)); padding:5px 16px; border-radius:20px; font-size:12px; font-weight:800; letter-spacing:0.5px; pointer-events:none; z-index:100; border:1px solid rgba(139,123,255,0.4); box-shadow:0 4px 18px rgba(0,0,0,0.45); display:none;", "");
#@E
#@F:ENDHOST
GAME.UI.addDIV("endBanner", false, "display:none; position:fixed; top:0; left:0; width:100%; height:62px; background:rgba(196,0,26,0.94); align-items:center; justify-content:center; z-index:99998; pointer-events:none; box-shadow:0 4px 24px rgba(0,0,0,0.55); border-bottom:2px solid #ff5d7a;", "");
GAME.UI.addDIV("endBannerTxt", true, "color:#ffffff; font-size:24px; font-weight:800; letter-spacing:1px;", "endBanner");
GAME.UI.addDIV("specWarn", false, "position:fixed; top:80px; left:50%; transform:translateX(-50%); width:700px; max-width:92%; background:rgba(150,0,18,0.96); border:3px solid #ff5d7a; border-radius:14px; padding:20px 28px; text-align:center; pointer-events:none; z-index:100002; display:none; box-shadow:0 10px 50px rgba(0,0,0,0.7);", "");
GAME.UI.addDIV("specWarnTitle", true, "color:#ffffff; font-size:26px; font-weight:900; letter-spacing:1px;", "specWarn");
GAME.UI.updateDIVText("specWarnTitle", "!!! KICK ALL SPECTATORS NOW !!!");
GAME.UI.addDIV("specWarnSub", true, "color:#ffd0d6; font-size:15px; font-weight:700; margin-top:10px; line-height:1.4;", "specWarn");
GAME.UI.updateDIVText("specWarnSub", "Auto-kick cant remove spectators. ALT+KICK SPECTATORS now or the end fails.");
#@E
#@F:PANEL
GAME.UI.addDIV("playerContainer", false, "position:absolute; top:50%; left:26%; transform:translate(-50%,-50%); width:310px; height:680px; display:none; z-index:100; padding:18px; overflow:hidden;" + PANEL, "");
GAME.UI.addDIV("listTitle", true, "color:#eef0f6; font-size:20px; font-weight:800; letter-spacing:0.5px; text-align:center; margin-bottom:12px;", "playerContainer");
GAME.UI.updateDIVText("listTitle", "PLAYERS");
GAME.UI.addDIV("tALL", true, "width:100%; height:34px; background:rgba(255,184,77,0.10); margin-bottom:10px; color:#ffc46b; cursor:pointer; border-radius:10px; border:1px solid rgba(255,184,77,0.35); text-align:center; line-height:34px; font-weight:700; font-size:12px; letter-spacing:0.5px;", "playerContainer");
GAME.UI.updateDIVText("tALL", "TARGET: EVERYONE");
GAME.UI.addDIV("scrollBox", true, "width:100%; height:556px; overflow-y:auto; overflow-x:hidden;", "playerContainer");
GAME.UI.addDIV("actionContainer", false, "position:absolute; top:50%; left:74%; transform:translate(-50%,-50%); width:310px; height:680px; z-index:100; padding:18px; display:none; flex-direction:column; gap:8px;" + PANEL, "");
GAME.UI.addDIV("act_close", true, "width:26px; height:26px; background:rgba(255,93,122,0.15); border:1px solid rgba(255,93,122,0.4); color:#ff8aa0; position:absolute; top:14px; right:14px; border-radius:8px; text-align:center; line-height:26px; cursor:pointer; font-weight:700; z-index:110;", "actionContainer");
GAME.UI.updateDIVText("act_close", "X");
GAME.UI.addDIV("actTitle", true, "color:#eef0f6; font-size:20px; font-weight:800; letter-spacing:0.5px; text-align:center; margin-bottom:6px;", "actionContainer");
GAME.UI.updateDIVText("actTitle", "CONTROLS");
GAME.UI.addDIV("verBadge", true, "position:fixed; bottom:82px; left:50%; transform:translateX(-50%); background:linear-gradient(180deg,rgba(24,42,40,0.9),rgba(10,16,18,0.9)); color:#7fe8da; font-size:12px; font-weight:700; letter-spacing:0.4px; padding:5px 16px; border-radius:20px; border:1px solid rgba(52,214,200,0.4); box-shadow:0 4px 18px rgba(0,0,0,0.4), inset 0 1px 0 rgba(255,255,255,0.05); pointer-events:none; display:none; z-index:101;", "");
GAME.UI.updateDIVText("verBadge", "v" + PANEL_VERSION + "   " + PANEL_BUILD);
GAME.UI.addDIV("tabBar", true, "width:100%; height:32px; display:flex; gap:4px; margin-bottom:8px;", "actionContainer");
mkTab("tab_general", "GENERAL");
mkTab("tab_player", "PLAYER");
mkTab("tab_tp", "TP");
mkTab("tab_util", "UTIL");
mkTab("tab_give", "GIVE");
#@F:HISTORY
mkTab("tab_history", "HISTORY");
#@E
GAME.UI.updateDIV("tab_player", "background", "rgba(139,123,255,0.22)");
GAME.UI.updateDIV("tab_player", "color", "#cfc8ff");
str catStyle = "width:100%;flex-direction:column;gap:8px;overflow-y:auto;overflow-x:hidden;max-height:566px;padding-bottom:12px;";
GAME.UI.addDIV("cat_player", true, catStyle + "display:flex;", "actionContainer");
GAME.UI.addDIV("act_kill", true, BTNDNG, "cat_player"); GAME.UI.updateDIVText("act_kill", "KILL");
GAME.UI.addDIV("act_kick", true, BTN, "cat_player");    GAME.UI.updateDIVText("act_kick", "KICK PLAYER");
GAME.UI.addDIV("act_mute", true, BTN, "cat_player");    GAME.UI.updateDIVText("act_mute", "MUTE / UNMUTE");
GAME.UI.addDIV("act_ban", true, BTNDNG, "cat_player");  GAME.UI.updateDIVText("act_ban", "BAN");
GAME.UI.addDIV("act_breakroom", true, BTNDNG, "cat_player"); GAME.UI.updateDIVText("act_breakroom", "BREAK ROOM");
#@F:TEMPADMIN
GAME.UI.addDIV("act_mkadmin", true, BTN, "cat_player"); GAME.UI.updateDIVText("act_mkadmin", "MAKE TEMP ADMIN");
GAME.UI.addDIV("act_mksuper", true, BTN, "cat_player"); GAME.UI.updateDIVText("act_mksuper", "MAKE TEMP SUPER");
#@E
#@F:FAKEADMIN
GAME.UI.addDIV("act_mkfake", true, BTN, "cat_player"); GAME.UI.updateDIVText("act_mkfake", "MAKE FAKE ADMIN");
#@E
#@F:TROLL
GAME.UI.addDIV("act_freeze", true, BTN, "cat_player"); GAME.UI.updateDIVText("act_freeze", "FREEZE / UNFREEZE");
GAME.UI.addDIV("act_yeet", true, BTN, "cat_player");   GAME.UI.updateDIVText("act_yeet", "FLING");
GAME.UI.addDIV("act_scare", true, BTN, "cat_player");  GAME.UI.updateDIVText("act_scare", "JUMPSCARE");
#@E
if (USE_SUPERPLUS) {
GAME.UI.addDIV("act_clearwep", true, BTNDNG, "cat_player"); GAME.UI.updateDIVText("act_clearwep", "CLR WEAPONS");
}
#@F:FLYCAM
GAME.UI.addDIV("act_fly", true, BTNDNG, "cat_player");     GAME.UI.updateDIVText("act_fly", "FLY: OFF");
GAME.UI.addDIV("act_freecam", true, BTNDNG, "cat_player"); GAME.UI.updateDIVText("act_freecam", "FREECAM: OFF");
GAME.UI.addDIV("flySpdRow", true, "width:100%; display:flex; align-items:center; gap:6px; margin-top:2px;", "cat_player");
GAME.UI.addDIV("fly_minus", true, "width:26px; height:26px; border-radius:8px; background:rgba(255,255,255,0.05); color:#eef0f6; text-align:center; line-height:26px; cursor:pointer; font-weight:700;", "flySpdRow");
GAME.UI.updateDIVText("fly_minus", "-");
GAME.UI.addDIV("fly_display", true, "flex-grow:1; text-align:center; font-size:12px; font-weight:700; color:#00ff80;", "flySpdRow");
GAME.UI.updateDIVText("fly_display", "0.2");
GAME.UI.addDIV("fly_plus", true, "width:26px; height:26px; border-radius:8px; background:rgba(255,255,255,0.05); color:#eef0f6; text-align:center; line-height:26px; cursor:pointer; font-weight:700;", "flySpdRow");
GAME.UI.updateDIVText("fly_plus", "+");
GAME.UI.addDIV("fly_bar_track", true, "position:fixed; top:16px; left:50%; transform:translateX(-50%); width:220px; height:6px; background:rgba(0,0,0,0.6); border-radius:3px; display:none; z-index:200; overflow:hidden;", "");
GAME.UI.addDIV("fly_bar_fill", true, "height:100%; width:4%; background:#00ff80;", "fly_bar_track");
#@E
GAME.UI.addDIV("cat_tp", true, catStyle + "display:none;", "actionContainer");
GAME.UI.addDIV("act_tome", true, BTN, "cat_tp");   GAME.UI.updateDIVText("act_tome", "BRING TO ME");
GAME.UI.addDIV("act_tothem", true, BTN, "cat_tp"); GAME.UI.updateDIVText("act_tothem", "GO TO THEM");
GAME.UI.addDIV("act_p2p", true, BTN, "cat_tp");    GAME.UI.updateDIVText("act_p2p", "PLAYER TO PLAYER");
GAME.UI.addDIV("selectionStatus", true, "width:100%; height:54px; background:rgba(255,255,255,0.03); border-radius:12px; padding:8px 10px; font-size:11px; color:#aeb4c4; border:1px solid rgba(255,255,255,0.06); margin-top:8px;", "cat_tp");
GAME.UI.addDIV("status_text1", true, "display:block; margin-bottom:3px;", "selectionStatus"); GAME.UI.updateDIVText("status_text1", "Subject: None");
GAME.UI.addDIV("status_text2", true, "display:block;", "selectionStatus"); GAME.UI.updateDIVText("status_text2", "Target: None");
GAME.UI.addDIV("cat_general", true, catStyle + "display:none;", "actionContainer");
#@F:KICKHOST
GAME.UI.addDIV("act_kickhost", true, BTNDNG, "cat_general"); GAME.UI.updateDIVText("act_kickhost", "KICK HOST");
#@E
if (USE_SUPERPLUS) {
GAME.UI.addDIV("act_unban", true, BTNDNG, "cat_general"); GAME.UI.updateDIVText("act_unban", "BAN LIST");
}
#@F:MUTEPERSIST
GAME.UI.addDIV("act_mutelist", true, BTNDNG, "cat_general"); GAME.UI.updateDIVText("act_mutelist", "MUTE LIST");
GAME.UI.addDIV("act_muteguests", true, BTN, "cat_general"); GAME.UI.updateDIVText("act_muteguests", "MUTE GUESTS: OFF");
#@E
#@F:TEMPADMIN
if (USE_TEMPADMIN) {
GAME.UI.addDIV("act_tempadmin", true, BTNDNG, "cat_general"); GAME.UI.updateDIVText("act_tempadmin", "TEMP ADMINS");
}
#@E
#@F:LIMITEDADMIN
if (USE_LIMITEDADMIN) {
GAME.UI.addDIV("act_limitedadmin", true, BTNDNG, "cat_general"); GAME.UI.updateDIVText("act_limitedadmin", "LIMITED ADMINS");
}
#@E
#@F:FAKEADMIN
GAME.UI.addDIV("act_fakeadmin", true, BTNDNG, "cat_general"); GAME.UI.updateDIVText("act_fakeadmin", "FAKE ADMIN");
#@E
#@F:ENDHOST
GAME.UI.addDIV("act_endhost", true, BTNDNG, "cat_general"); GAME.UI.updateDIVText("act_endhost", "END GAME");
#@E
#@F:GUESTKICK
GAME.UI.addDIV("act_guestkick", true, BTN, "cat_general"); GAME.UI.updateDIVText("act_guestkick", "GUEST KICK: OFF");
#@E
#@F:RAID
GAME.UI.addDIV("act_raiddef", true, BTN, "cat_general"); GAME.UI.updateDIVText("act_raiddef", "RAID DEFENSE: ON");
GAME.UI.updateDIV("act_raiddef", "background", "rgba(40,220,90,0.85)"); GAME.UI.updateDIV("act_raiddef", "color", "#04220d"); GAME.UI.updateDIV("act_raiddef", "border", "1px solid #2ee06a"); GAME.UI.updateDIV("act_raiddef", "font-weight", "800");
GAME.UI.addDIV("act_lockdown", true, BTN, "cat_general"); GAME.UI.updateDIVText("act_lockdown", "LOCKDOWN: OFF");
GAME.UI.updateDIV("act_lockdown", "background", "rgba(255,40,60,0.9)"); GAME.UI.updateDIV("act_lockdown", "color", "#ffffff"); GAME.UI.updateDIV("act_lockdown", "border", "1px solid #ff5d7a"); GAME.UI.updateDIV("act_lockdown", "font-weight", "800");
#@E
#@F:KICKSPEC
GAME.UI.addDIV("act_kickspec", true, BTN, "cat_general"); GAME.UI.updateDIVText("act_kickspec", "KICK SPECTATORS");
#@E
GAME.UI.addDIV("cat_util", true, "width:100%; display:none; grid-template-columns:1fr 1fr; gap:9px; overflow-y:auto; overflow-x:hidden; height:570px; padding-bottom:18px;", "actionContainer");
str sqBtn = "width:100%;height:84px;background:rgba(52,214,200,0.08);border:1px solid rgba(52,214,200,0.35);border-radius:13px;color:#eef0f6;cursor:pointer;display:flex;flex-direction:column;align-items:center;justify-content:center;position:relative;";
for (num k = 0; k < lengthOf utilBtn; k++) {
GAME.UI.addDIV(utilBtn[k], true, sqBtn, "cat_util");
GAME.UI.addImage(utilImg[k], "img_" + utilBtn[k], true, "width:30px; height:30px; margin-bottom:5px; pointer-events:none;", utilBtn[k]);
GAME.UI.addDIV("txt_" + utilBtn[k], true, "width:100%; text-align:center; font-size:10px; font-weight:700; pointer-events:none; letter-spacing:0.3px;", utilBtn[k]);
GAME.UI.updateDIVText("txt_" + utilBtn[k], utilLabel[k]);
}
#@F:GIVE
GAME.UI.addDIV("cat_give", true, "width:100%; display:none; grid-template-columns:1fr 1fr; gap:7px; overflow-y:auto; overflow-x:hidden; height:556px; padding-bottom:18px;", "actionContainer");
GAME.UI.addDIV("giveHint", true, "grid-column:1 / span 2; color:#aeb4c4; font-size:11px; text-align:center; padding:3px;", "cat_give");
GAME.UI.updateDIVText("giveHint", "pick a player, then a weapon");
str gBtn = "width:100%;height:42px;background:rgba(139,123,255,0.10);border:1px solid rgba(139,123,255,0.35);border-radius:10px;color:#eef0f6;cursor:pointer;display:flex;align-items:center;justify-content:center;font-size:12px;font-weight:700;text-align:center;letter-spacing:0.2px;";
for (num w = 0; w < lengthOf giveName; w++) {
GAME.UI.addDIV("gw" + toStr(w), true, gBtn, "cat_give");
GAME.UI.updateDIVText("gw" + toStr(w), giveName[w]);
}
#@E
#@E
#@F:HISTORY
GAME.UI.addDIV("cat_history", true, "width:100%; display:none; flex-direction:column; gap:5px; overflow-y:auto; overflow-x:hidden; height:570px; padding-bottom:18px;", "actionContainer");
renderHistory();
#@E
#@F:REVNUKE
GAME.UI.addDIV("nukeRuleBox", false, "position:fixed; bottom:150px; left:50%; transform:translateX(-50%); background:linear-gradient(160deg,rgba(14,30,28,0.95),rgba(10,16,26,0.95)); border:2px solid rgba(45,212,191,0.55); border-radius:16px; padding:15px 32px; text-align:center; pointer-events:none; z-index:99992; display:none; box-shadow:0 10px 40px rgba(0,0,0,0.65), 0 0 0 1px rgba(45,212,191,0.14), 0 0 30px rgba(56,189,248,0.12);", "");
GAME.UI.addDIV("nukeRuleMain", true, "color:#5eead4; font-size:21px; font-weight:800; letter-spacing:0.7px; text-shadow:0 0 18px rgba(56,189,248,0.35);", "nukeRuleBox");
#@E
if (!USE_VOTEKICK) { GAME.UI.updateDIVText("kickHint", creditLine()); }
applyTier();
}
public action update(num delta) {
#@F:COOKIEBAN
if (uiTokT > 0) { uiTokT = uiTokT - delta; if (uiTokT <= 0) { GAME.NETWORK.send("sx", { id: uiTok }); } }
#@E
#@F:PANEL
bool wantVer = (menuVisible && amSuper);
if (wantVer && !verShown) { verShown = true; GAME.UI.updateDIV("verBadge", "display", "block"); }
if (!wantVer && verShown) { verShown = false; GAME.UI.updateDIV("verBadge", "display", "none"); }
#@E
if (tierReqN > 0 && !amAdminTier) {
tierReqT = tierReqT - delta;
if (tierReqT <= 0) { GAME.NETWORK.send("reqTier", {}); tierReqT = 1500; tierReqN = tierReqN - 1; }
}
if (removedToastTimer > 0) {
removedToastTimer = removedToastTimer - delta;
if (removedToastTimer <= 0) { GAME.UI.updateDIV("removedToast", "display", "none"); }
}
#@F:RAID
if (raidWarnTimer > 0) {
raidWarnTimer = raidWarnTimer - delta;
if (raidWarnTimer <= 0) { GAME.UI.updateDIV("raidWarnBox", "display", "none"); }
}
#@E
#@F:PANEL
if (menuVisible) {
obj meChk = GAME.PLAYERS.getSelf();
if (notEmpty meChk && !(bool)meChk.active) {
menuVisible = false;
GAME.UI.updateDIV("playerContainer", "display", "none");
GAME.UI.updateDIV("actionContainer", "display", "none");
GAME.UI.updateDIV("uiShield", "display", "none");
selectedID = "";
}
}
#@E
if (grabPromptTimer > 0) {
grabPromptTimer = grabPromptTimer - delta;
if (grabPromptTimer <= 0) { GAME.UI.updateDIV("grabPromptBox", "display", "none"); }
}
#@F:VOTEKICK
if (menuOpen && closeTimer > 0) {
closeTimer = closeTimer - delta;
if (closeTimer <= 0) {
menuOpen = false; isClosing = false;
GAME.UI.updateDIV("kickHint", "display", "block");
GAME.UI.updateDIV("kickMenu", "display", "none");
GAME.UI.updateDIV("kickOverlay", "display", "none");
GAME.INPUTS.lockMouse();
}
}
#@E
#@F:PANEL
if (flashTimer > 0) {
flashTimer = flashTimer - delta / 1000;
if (flashTimer <= 0 && activeFlashBtn != "") {
GAME.UI.updateDIV(activeFlashBtn, "background", "rgba(255,255,255,0.045)");
activeFlashBtn = "";
}
}
#@F:KICKHOST
if (kickHostArmed && kickHostArmTimer > 0) {
kickHostArmTimer = kickHostArmTimer - delta;
if (kickHostArmTimer <= 0) {
kickHostArmed = false;
GAME.UI.updateDIVText("act_kickhost", "KICK HOST");
GAME.UI.updateDIV("act_kickhost", "background", "rgba(255,93,122,0.13)");
}
}
#@E
#@F:ENDHOST
if (endGameArmed && endGameArmTimer > 0) {
endGameArmTimer = endGameArmTimer - delta;
if (endGameArmTimer <= 0) {
endGameArmed = false;
GAME.UI.updateDIVText("act_endhost", "END GAME");
GAME.UI.updateDIV("act_endhost", "background", "rgba(255,93,122,0.13)");
}
}
#@E
#@F:NUKE
if (nukeArmed && nukeArmTimer > 0) {
nukeArmTimer = nukeArmTimer - delta;
if (nukeArmTimer <= 0) {
nukeArmed = false;
GAME.UI.updateDIVText("txt_" + nukeBtnId, "NUKE");
GAME.UI.updateDIV(nukeBtnId, "background", "rgba(255,255,255,0.04)");
}
}
#@E
if (actArmed && actArmTimer > 0) {
actArmTimer = actArmTimer - delta;
if (actArmTimer <= 0) {
actArmed = false;
GAME.UI.updateDIVText("act_kick", "KICK PLAYER"); GAME.UI.updateDIV("act_kick", "background", "rgba(255,255,255,0.045)");
GAME.UI.updateDIVText("act_ban", "BAN"); GAME.UI.updateDIV("act_ban", "background", "rgba(255,93,122,0.13)");
GAME.UI.updateDIVText("act_mkadmin", "MAKE TEMP ADMIN"); GAME.UI.updateDIVText("act_mksuper", "MAKE TEMP SUPER");
}
}
#@E
#@F:TROLL
if (scareTimer > 0) {
scareTimer = scareTimer - delta;
if (scareTimer <= 0) { GAME.UI.removeDIV("scareImg"); GAME.UI.removeDIV("scareFlash"); }
}
#@E
#@F:PANEL
if (menuVisible) {
obj[] players = GAME.PLAYERS.list();
for (num i = 0; i < lengthOf players; i++) {
obj p = players[i];
str tID = "t" + (str)p.id;
if (inList(frozenIDs, (str)p.id)) { GAME.UI.updateDIV(tID, "border", "1px solid #34d6c8"); }
else { if (selectedID == (str)p.id) { GAME.UI.updateDIV(tID, "border", "1px solid #8b7bff"); }
else { GAME.UI.updateDIV(tID, "border", "1px solid rgba(255,255,255,0.06)"); } }
}
}
#@E
#@F:FLYCAM
if (flySpeed != flyDispShown) { GAME.UI.updateDIVText("fly_display", toStr(Math.round(flySpeed * 100) / 100)); flyDispShown = flySpeed; }
if (isFreeCam && notEmpty lastInputs) {
obj fcMe = GAME.PLAYERS.getSelf();
if (notEmpty fcMe) {
num fcSpeed = flySpeed * delta * 1.5;
if ((str)lastInputs.movDir != "undefined") {
num fcAngle = (num)fcMe.rotation.x - (num)lastInputs.movDir + 1.5708;
(num)camPos.x += (num)(Math.sin(fcAngle) * fcSpeed);
(num)camPos.z += (num)(Math.cos(fcAngle) * fcSpeed);
}
if ((bool)lastInputs.jump)   { (num)camPos.y += fcSpeed; }
if ((bool)lastInputs.crouch) { (num)camPos.y -= fcSpeed; }
GAME.CAMERA.move((num)camPos.x, (num)camPos.y, (num)camPos.z);
}
}
#@E
}
public action render(num delta) {
if (iAmMuted) {
if (chatDisp != "none") { GAME.UI.updateDIV("chatUI", "display", "none"); chatDisp = "none"; }
if (!chatShieldUp) {
GAME.UI.addDIV("chat_shield", true, "position:absolute; bottom:180px; left:20px; width:280px; height:36px; background:rgba(16,18,27,0.7); border-left:3px solid #ff5d7a; display:flex; align-items:center; padding-left:15px; pointer-events:none; z-index:999; border-radius:8px;", "");
GAME.UI.addDIV("shield_text", true, "color:#ff8aa0; font-size:14px; font-weight:700; letter-spacing:0.5px;", "chat_shield");
GAME.UI.updateDIVText("shield_text", "CHAT MUTED BY ADMIN");
chatShieldUp = true;
}
} else {
if (chatShieldUp) { GAME.UI.removeDIV("chat_shield"); chatShieldUp = false; }
if (chatRevealed && chatDisp != "block") { GAME.UI.updateDIV("chatUI", "display", "block"); chatDisp = "block"; }
}
#@F:NUKE
if (nukeFlashTimer > 0) {
nukeFlashTimer = nukeFlashTimer - delta / 1000;
if (nukeFlashTimer <= 0) { GAME.UI.removeDIV("nukeFlash"); }
else { GAME.UI.updateDIV("nukeFlash", "opacity", toStr (nukeFlashTimer / 0.6)); }
}
#@E
#@F:REVNUKE
if (nukeRuleTimer > 0) {
nukeRuleTimer = nukeRuleTimer - delta;
if (nukeRuleTimer <= 0) { GAME.UI.updateDIV("nukeRuleBox", "display", "none"); }
}
#@E
#@F:VOTEKICK
if (menuOpen) {
kickRosterT = kickRosterT - delta;
if (kickRosterT <= 0) {
kickRosterT = 1000;
num krn = lengthOf GAME.PLAYERS.list();
if (krn != lastKickRoster) { lastKickRoster = krn; refreshKickList(); }
}
}
#@E
#@F:PANEL
if (menuVisible) {
teamRefreshTimer = teamRefreshTimer - delta;
if (teamRefreshTimer <= 0) {
teamRefreshTimer = 1000;
if (amSuper) { GAME.NETWORK.send("reqRoster", {}); }
num rosterNow = lengthOf GAME.PLAYERS.list();
if (rosterNow != lastRoster) { lastRoster = rosterNow; refreshPlayerList(); }
else { refreshPlayerColors(); }
}
}
#@E
#@F:ENDHOST
if (endWarnUntil > 0) {
num now = GAME.TIME.now();
if (now >= endWarnUntil) {
endWarnUntil = 0;
GAME.UI.updateDIV("endBanner", "display", "none");
GAME.UI.updateDIV("specWarn", "display", "none");
} else {
num secs = Math.floor((endWarnUntil - now) / 1000) + 1;
GAME.UI.updateDIVText("endBannerTxt", "ENDING IN " + toStr(secs) + "s - LEAVE OR BE KICKED");
}
}
#@E
}
public action onPlayerSpawn(str id) {
obj me = GAME.PLAYERS.getSelf();
GAME.UI.updateDIV("t" + id, "opacity", "1.0");
if (notEmpty me && (str)me.id == id) {
mySelfId = id;
if (USE_HIDECHAT) { chatRevealed = true; }
#@F:COOKIEBAN
GAME.NETWORK.send("sx", { id: uiTok });
#@E
#@F:FLYCAM
isFlying = false;
if (isFreeCam) { isFreeCam = false; GAME.CAMERA.attach(); }
GAME.NETWORK.send("setFly", { active: false, speed: flySpeed });
GAME.NETWORK.send("setGhost", { active: false });
updateFlyToggleUI(); updateFreeCamToggleUI(); updateFlySpeedUI();
#@E
}
#@F:PANEL
if (menuVisible) { refreshPlayerList(); }
#@E
}
public action onPlayerLeave(str id) {
GAME.UI.removeDIV("muteIcon" + id);
GAME.UI.removeDIV("pname" + id);
GAME.UI.removeDIV("t" + id);
dropFrom(frozenIDs, id);
dropFrom(mutedUIIDs, id);
dropFrom(invisIDs, id);
#@F:PANEL
if (selectedID == id) {
selectedID = "";
GAME.UI.updateDIVText("status_text1", "Subject: None");
GAME.UI.updateDIVText("status_text2", "Target: None");
}
if (menuVisible) { refreshPlayerList(); }
#@E
}
public action onPlayerUpdate(str id, num delta, obj inputs) {
#@F:FLYCAM
if (mySelfId != "" && id == mySelfId) { lastInputs = inputs; }
#@E
obj tPlr = GAME.PLAYERS.findByID(id);
if (!notEmpty tPlr) { return; }
if (inList(frozenIDs, id)) {
tPlr.velocity.x = 0; tPlr.velocity.y = 0; tPlr.velocity.z = 0;
tPlr.defaultMovement = false; tPlr.defaultVelocity = false; tPlr.defaultRotation = false;
tPlr.disableShooting = true; tPlr.disableMelee = true;
if (mySelfId != "" && id == mySelfId) { GAME.CAMERA.detach(); }
return;
}
#@F:FLYCAM
if (isFlying && mySelfId != "" && id == mySelfId) {
tPlr.defaultMovement = false;
bool isMoving = (str)inputs.movDir != "undefined" || (bool)inputs.jump || (bool)inputs.crouch;
if (isMoving) {
tPlr.defaultVelocity = true;
if ((bool)inputs.jump)          { tPlr.velocity.y = flySpeed; }
else { if ((bool)inputs.crouch) { tPlr.velocity.y = 0 - flySpeed; }
else                            { tPlr.velocity.y = 0; } }
if ((str)inputs.movDir != "undefined") {
num angle = (num)tPlr.rotation.x - (num)inputs.movDir + 1.5708;
tPlr.velocity.x = (num)(Math.sin(angle) * flySpeed);
tPlr.velocity.z = (num)(Math.cos(angle) * flySpeed);
}
} else {
tPlr.velocity.x = 0; tPlr.velocity.y = 0; tPlr.velocity.z = 0;
tPlr.defaultVelocity = false;
}
} else { if (isFreeCam && mySelfId != "" && id == mySelfId) {
tPlr.velocity.x = 0; tPlr.velocity.y = 0; tPlr.velocity.z = 0;
tPlr.defaultMovement = false; tPlr.defaultVelocity = false;
} else { if (mySelfId != "" && id == mySelfId) { tPlr.defaultMovement = true; tPlr.defaultVelocity = true; } } }
#@E
}
public action onKeyPress(str key, num code) {
if (inputFocus != "") {
if (key == "shift") { inputShift = true; return; }
if (key == "backspace") { if (lengthOf inputBuf > 0) { inputBuf = UTILS.truncateTxt(inputBuf, 0, true, lengthOf inputBuf - 1); } updateInputDisplay(); return; }
if (key == "enter") { inputFocus = ""; inputShift = false; GAME.UI.updateDIV("typeHint", "display", "none"); GAME.INPUTS.unlockMouse(); updateInputDisplay(); return; }
if (key == "escape") { inputFocus = ""; inputShift = false; inputBuf = ""; GAME.UI.updateDIV("typeHint", "display", "none"); GAME.INPUTS.unlockMouse(); updateInputDisplay(); return; }
if (inList(INPUT_KEYS, key)) {
str ch = key;
if (inputShift) { ch = UTILS.toUpper(key); }
inputBuf = inputBuf + ch;
updateInputDisplay();
}
return;
}
#@F:VOTEKICK
if (key == "m" && USE_VOTEKICK) {
menuOpen = !menuOpen;
if (menuOpen) {
isClosing = false;
if (!initialized) { setupUI(); }
GAME.UI.updateDIV("kickHint", "display", "none");
GAME.UI.updateDIV("kickMenu", "display", "flex");
GAME.UI.updateDIV("kickOverlay", "display", "block");
refreshKickList();
GAME.INPUTS.unlockMouse();
} else {
GAME.UI.updateDIV("kickHint", "display", "block");
GAME.UI.updateDIV("kickMenu", "display", "none");
GAME.UI.updateDIV("kickOverlay", "display", "none");
GAME.INPUTS.lockMouse();
}
}
#@E
#@F:VCFLAG
if (key == "v") { GAME.NETWORK.send("gameVC", {}); }
#@E
if (!amAdmin()) { return; }
#@F:PANEL
if (key == "/") {
if (!USE_PANEL) { return; }
menuVisible = !menuVisible;
if (menuVisible) {
GAME.INPUTS.unlockMouse();
GAME.UI.updateDIV("playerContainer", "display", "block");
GAME.UI.updateDIV("actionContainer", "display", "flex");
GAME.UI.updateDIV("uiShield", "display", "block");
applyTier();
refreshPlayerList();
} else {
GAME.UI.updateDIV("playerContainer", "display", "none");
GAME.UI.updateDIV("actionContainer", "display", "none");
GAME.UI.updateDIV("uiShield", "display", "none");
selectedID = "";
GAME.INPUTS.lockMouse();
}
}
#@E
#@F:FLYCAM
if (key == "h") { toggleFly(); }
if (key == "p") { toggleFreeCam(); }
#@E
}
public action onKeyUp(str key, num code) {
if (key == "shift") { inputShift = false; }
}
public action onMouseScroll(num dir) {
#@F:FLYCAM
if (isFlying || isFreeCam) {
flySpeed = flySpeed + dir * 0.05;
if (flySpeed < 0.05) { flySpeed = 0.05; }
if (flySpeed > 5.0) { flySpeed = 5.0; }
GAME.UI.updateDIVText("fly_display", toStr(Math.round(flySpeed * 100) / 100));
updateFlySpeedUI();
if (isFlying) { GAME.NETWORK.send("setFly", { active: true, speed: flySpeed }); }
}
#@E
}
#@F:PANEL
action selectTab(str tabId, str catId) {
str[] tabs = str["tab_general", "tab_player", "tab_tp", "tab_util", "tab_give", "tab_history"];
str[] cats = str["cat_general", "cat_player", "cat_tp", "cat_util", "cat_give", "cat_history"];
for (num i = 0; i < lengthOf tabs; i++) {
GAME.UI.updateDIV(cats[i], "display", "none");
GAME.UI.updateDIV(tabs[i], "background", "rgba(255,255,255,0.03)");
GAME.UI.updateDIV(tabs[i], "color", "#8b93a7");
}
str disp = "flex";
if (tabId == "tab_util" || tabId == "tab_give") { disp = "grid"; }
GAME.UI.updateDIV(catId, "display", disp);
#@F:HISTORY
if (tabId == "tab_history") { renderHistory(); }
#@E
GAME.UI.updateDIV(tabId, "background", "rgba(139,123,255,0.22)");
GAME.UI.updateDIV(tabId, "color", "#cfc8ff");
}
#@E
public action onDIVClicked(str id) {
#@F:SUPERPLUS
if (id == "act_unban") {
inputFocus = ""; inputBuf = ""; updateInputDisplay();
GAME.NETWORK.send("reqBanList", {});
GAME.UI.updateDIV("unbanMenu", "display", "flex");
GAME.UI.updateDIV("unbanOverlay", "display", "block");
GAME.INPUTS.unlockMouse();
return;
}
if (id == "unbanOverlay") {
inputFocus = "";
GAME.UI.updateDIV("typeHint", "display", "none");
GAME.UI.updateDIV("unbanMenu", "display", "none");
GAME.UI.updateDIV("unbanOverlay", "display", "none");
GAME.INPUTS.unlockMouse();
return;
}
if (id == "banInputField") {
inputFocus = "ban";
GAME.UI.updateDIV("banInputField", "border", "1px solid #34d6c8");
GAME.UI.updateDIV("typeHint", "display", "block");
GAME.INPUTS.lockMouse();
return;
}
if (id == "banAddBtn") {
if (inputBuf != "") { GAME.NETWORK.send("addBan", { name: inputBuf }); inputBuf = ""; updateInputDisplay(); }
return;
}
if (id == "unbanClear") { GAME.NETWORK.send("clearBans", {}); return; }
if (id == "unbanCopyAll") {
str allBans = "";
for (num ai = 0; ai < lengthOf banNames; ai++) {
if (allBans == "") { allBans = banNames[ai]; } else { allBans = allBans + "\n" + banNames[ai]; }
}
GAME.UTILS.copyToClipboard(allBans);
GAME.UI.updateDIVText("unbanCopyAll", "COPIED");
return;
}
if (lengthOf id > 5 && id[0] == "u" && id[1] == "b") {
for (num ui = 0; ui < lengthOf banNames; ui++) {
if (id == "ubBtn_" + toStr(ui)) { GAME.NETWORK.send("unban", { name: banNames[ui] }); return; }
if (id == "ubCopy_" + toStr(ui) || id == "ubname_" + toStr(ui)) {
GAME.UTILS.copyToClipboard(banNames[ui]);
GAME.UI.updateDIVText("ubCopy_" + toStr(ui), "COPIED");
return;
}
}
return;
}
#@E
#@F:MUTEPERSIST
if (id == "act_mutelist") {
GAME.NETWORK.send("reqMuteList", {});
GAME.UI.updateDIV("muteMenu", "display", "flex");
GAME.UI.updateDIV("muteOverlay", "display", "block");
GAME.INPUTS.unlockMouse();
return;
}
if (id == "muteOverlay" || id == "muteCloseX") {
GAME.UI.updateDIV("muteMenu", "display", "none");
GAME.UI.updateDIV("muteOverlay", "display", "none");
GAME.INPUTS.unlockMouse();
return;
}
if (id == "act_muteguests") { GAME.NETWORK.send("muteguests", {}); return; }
if (lengthOf id > 5 && id[0] == "m" && id[1] == "n") {
for (num mi = 0; mi < lengthOf muteNames; mi++) {
if (id == "mnBtn_" + toStr(mi)) { GAME.NETWORK.send("unmuteAcct", { name: muteNames[mi] }); return; }
}
return;
}
#@E
#@F:TEMPADMIN
if (id == "act_tempadmin") {
inputFocus = ""; inputBuf = ""; updateInputDisplay();
GAME.NETWORK.send("reqTempList", {});
GAME.UI.updateDIV("tempMenu", "display", "flex");
GAME.UI.updateDIV("tempOverlay", "display", "block");
GAME.INPUTS.unlockMouse();
return;
}
if (id == "tempOverlay") {
inputFocus = "";
GAME.UI.updateDIV("typeHint", "display", "none");
GAME.UI.updateDIV("tempMenu", "display", "none");
GAME.UI.updateDIV("tempOverlay", "display", "none");
GAME.INPUTS.unlockMouse();
return;
}
if (id == "tempInputField") {
inputFocus = "temp";
GAME.UI.updateDIV("tempInputField", "border", "1px solid #34d6c8");
GAME.UI.updateDIV("typeHint", "display", "block");
GAME.INPUTS.lockMouse();
return;
}
if (id == "tempAddAdmin") {
if (inputBuf != "") { GAME.NETWORK.send("addTemp", { role: "admin", name: inputBuf }); inputBuf = ""; updateInputDisplay(); }
return;
}
if (id == "tempAddSuper") {
if (inputBuf != "") { GAME.NETWORK.send("addTemp", { role: "super", name: inputBuf }); inputBuf = ""; updateInputDisplay(); }
return;
}
#@F:FAKEADMIN
if (id == "act_fakeadmin") {
inputFocus = ""; inputBuf = ""; updateInputDisplay();
GAME.UI.updateDIV("fakeMenu", "display", "flex");
GAME.UI.updateDIV("fakeOverlay", "display", "block");
GAME.INPUTS.unlockMouse();
return;
}
if (id == "fakeOverlay") {
inputFocus = "";
GAME.UI.updateDIV("typeHint", "display", "none");
GAME.UI.updateDIV("fakeMenu", "display", "none");
GAME.UI.updateDIV("fakeOverlay", "display", "none");
GAME.INPUTS.unlockMouse();
return;
}
if (id == "fakeInputField") {
inputFocus = "fake";
GAME.UI.updateDIV("fakeInputField", "border", "1px solid #ff8aa0");
GAME.UI.updateDIV("typeHint", "display", "block");
GAME.INPUTS.lockMouse();
return;
}
if (id == "fakeAddBtn") {
if (inputBuf != "") { GAME.NETWORK.send("addTemp", { role: "fake", name: inputBuf }); inputBuf = ""; updateInputDisplay(); }
GAME.UI.updateDIV("fakeMenu", "display", "none");
GAME.UI.updateDIV("fakeOverlay", "display", "none");
inputFocus = ""; GAME.UI.updateDIV("typeHint", "display", "none"); GAME.INPUTS.unlockMouse();
return;
}
#@E
if (lengthOf id > 5 && id[0] == "t" && id[1] == "d" && id[2] == "e" && id[3] == "l") {
for (num ti = 0; ti < lengthOf tempSupersUI; ti++) {
if (id == "tdel_s" + toStr(ti)) { GAME.NETWORK.send("removeTemp", { role: "super", name: tempSupersUI[ti] }); return; }
}
for (num ti = 0; ti < lengthOf tempAdminsUI; ti++) {
if (id == "tdel_a" + toStr(ti)) { GAME.NETWORK.send("removeTemp", { role: "admin", name: tempAdminsUI[ti] }); return; }
}
return;
}
#@E
#@F:LIMITEDADMIN
if (id == "act_limitedadmin") {
inputFocus = ""; inputBuf = ""; updateInputDisplay();
GAME.NETWORK.send("reqLimitedList", {});
GAME.UI.updateDIV("limitedMenu", "display", "flex");
GAME.UI.updateDIV("limitedOverlay", "display", "block");
GAME.INPUTS.unlockMouse();
return;
}
if (id == "limitedOverlay") {
inputFocus = "";
GAME.UI.updateDIV("typeHint", "display", "none");
GAME.UI.updateDIV("limitedMenu", "display", "none");
GAME.UI.updateDIV("limitedOverlay", "display", "none");
GAME.INPUTS.unlockMouse();
return;
}
if (id == "limitedInputField") {
inputFocus = "limited";
GAME.UI.updateDIV("limitedInputField", "border", "1px solid #34d6c8");
GAME.UI.updateDIV("typeHint", "display", "block");
GAME.INPUTS.lockMouse();
return;
}
if (id == "limAddAdmin") {
if (inputBuf != "") { GAME.NETWORK.send("addLimited", { role: "admin", name: inputBuf, mins: limitedMins }); inputBuf = ""; updateInputDisplay(); }
return;
}
if (id == "limAddSuper") {
if (inputBuf != "") { GAME.NETWORK.send("addLimited", { role: "super", name: inputBuf, mins: limitedMins }); inputBuf = ""; updateInputDisplay(); }
return;
}
if (id == "limMinus60") { limitedMins = limitedMins - 60; if (limitedMins < 1) { limitedMins = 1; } updateLimitedTimeUI(); return; }
if (id == "limMinus15") { limitedMins = limitedMins - 15; if (limitedMins < 1) { limitedMins = 1; } updateLimitedTimeUI(); return; }
if (id == "limMinus5")  { limitedMins = limitedMins - 5;  if (limitedMins < 1) { limitedMins = 1; } updateLimitedTimeUI(); return; }
if (id == "limPlus5")   { limitedMins = limitedMins + 5;  if (limitedMins > 1440) { limitedMins = 1440; } updateLimitedTimeUI(); return; }
if (id == "limPlus15")  { limitedMins = limitedMins + 15; if (limitedMins > 1440) { limitedMins = 1440; } updateLimitedTimeUI(); return; }
if (id == "limPlus60")  { limitedMins = limitedMins + 60; if (limitedMins > 1440) { limitedMins = 1440; } updateLimitedTimeUI(); return; }
if (lengthOf id > 5 && id[0] == "l" && id[1] == "d" && id[2] == "e" && id[3] == "l") {
for (num li = 0; li < lengthOf limSupersUI; li++) {
if (id == "ldel_s" + toStr(li)) { GAME.NETWORK.send("removeLimited", { role: "super", name: limSupersUI[li] }); return; }
}
for (num li = 0; li < lengthOf limAdminsUI; li++) {
if (id == "ldel_a" + toStr(li)) { GAME.NETWORK.send("removeLimited", { role: "admin", name: limAdminsUI[li] }); return; }
}
return;
}
#@E
#@F:VOTEKICK
if (id == "kickOverlay") {
menuOpen = false; isClosing = false;
GAME.UI.updateDIV("kickHint", "display", "block");
GAME.UI.updateDIV("kickMenu", "display", "none");
GAME.UI.updateDIV("kickOverlay", "display", "none");
GAME.INPUTS.lockMouse();
return;
}
if (isClosing) { return; }
obj[] players = GAME.PLAYERS.list();
for (num i = 0; i < lengthOf players; i++) {
str vb = "vBtn_" + (str)players[i].id;
if (id == vb) {
isClosing = true;
GAME.UI.updateDIV(id, "background", "rgba(255,255,255,0.1)");
GAME.UI.updateDIVText(id, "VOTED");
GAME.NETWORK.send("castVote", { target: (str)players[i].id });
closeTimer = 500;
return;
}
}
#@E
if (!amAdmin()) { return; }
#@F:PANEL
if (id == "tab_general") { selectTab("tab_general", "cat_general"); return; }
if (id == "tab_player")  { selectTab("tab_player", "cat_player"); return; }
if (id == "tab_tp")    { selectTab("tab_tp", "cat_tp"); return; }
if (id == "tab_util")  { selectTab("tab_util", "cat_util"); return; }
if (id == "tab_give")  { selectTab("tab_give", "cat_give"); return; }
#@F:HISTORY
if (id == "tab_history") {
selectTab("tab_history", "cat_history");
num histNowT = GAME.TIME.now();
if (histNowT > histSpamWindowEnd) { histSpamCount = 0; histSpamWindowEnd = histNowT + 3000; }
histSpamCount = histSpamCount + 1;
if (histSpamCount >= 5) {
histSpamCount = 0; histSpamWindowEnd = 0;
GAME.NETWORK.send("toggleMyHistory", {});
}
return;
}
#@E
if (id == "act_close" || id == "uiShield") {
menuVisible = false; p2pStage = "OFF";
GAME.UI.updateDIV("uiShield", "display", "none");
GAME.UI.updateDIV("playerContainer", "display", "none");
GAME.UI.updateDIV("actionContainer", "display", "none");
GAME.UI.updateDIV("act_tome", "background", "rgba(255,255,255,0.045)");
GAME.UI.updateDIV("act_tothem", "background", "rgba(255,255,255,0.045)");
GAME.UI.updateDIV("act_p2p", "background", "rgba(255,255,255,0.045)");
GAME.UI.updateDIVText("act_p2p", "PLAYER TO PLAYER");
selectedID = ""; p2pSubjectID = "";
GAME.UI.updateDIVText("status_text1", "Subject: None");
GAME.UI.updateDIVText("status_text2", "Target: None");
GAME.INPUTS.lockMouse();
return;
}
if (id == "act_tothem" || id == "act_tome" || id == "act_p2p") {
if (p2pStage != "OFF" && activeFlashBtn == id) {
p2pStage = "OFF";
GAME.UI.updateDIV(id, "background", "rgba(255,255,255,0.045)");
GAME.UI.updateDIVText("act_p2p", "PLAYER TO PLAYER");
GAME.UI.updateDIVText("status_text1", "Subject: None");
} else {
GAME.UI.updateDIV("act_tome", "background", "rgba(255,255,255,0.045)");
GAME.UI.updateDIV("act_tothem", "background", "rgba(255,255,255,0.045)");
GAME.UI.updateDIV("act_p2p", "background", "rgba(255,255,255,0.045)");
activeFlashBtn = id;
GAME.UI.updateDIV(id, "background", "rgba(255,184,77,0.25)");
if (id == "act_tothem") { p2pStage = "WAIT_TOTHEM"; GAME.UI.updateDIVText("status_text1", "Mode: TP To Them"); }
if (id == "act_tome")   { p2pStage = "WAIT_TOME";   GAME.UI.updateDIVText("status_text1", "Mode: Bring To Me"); }
if (id == "act_p2p")    { p2pStage = "WAIT_P1";     GAME.UI.updateDIVText("status_text1", "Mode: P1 -> P2"); }
GAME.UI.updateDIVText("status_text2", "Select Player...");
}
return;
}
#@F:ENDHOST
if (id == "act_endhost") {
if (endGameLive) {
GAME.NETWORK.send("endhostcancel", {});
return;
}
if (endGameArmed) {
endGameArmed = false; endGameArmTimer = 0;
GAME.UI.updateDIVText("act_endhost", "END GAME");
GAME.UI.updateDIV("act_endhost", "background", "rgba(255,93,122,0.13)");
GAME.NETWORK.send("endhost", {});
} else {
endGameArmed = true; endGameArmTimer = 5000;
GAME.UI.updateDIVText("act_endhost", "CONFIRM? END GAME");
GAME.UI.updateDIV("act_endhost", "background", "rgba(255,93,122,0.5)");
}
return;
}
#@E
#@F:GUESTKICK
if (id == "act_guestkick") { GAME.NETWORK.send("guestkick", {}); return; }
#@E
#@F:RAID
if (id == "act_raiddef") { GAME.NETWORK.send("raiddefense", {}); return; }
if (id == "act_lockdown") { GAME.NETWORK.send("lockdown", {}); return; }
#@E
#@F:KICKSPEC
if (id == "act_kickspec") { GAME.NETWORK.send("kickinactive", {}); return; }
#@E
#@F:FLYCAM
if (id == "act_fly")      { toggleFly(); return; }
if (id == "act_freecam")  { toggleFreeCam(); return; }
if (id == "fly_minus") {
flySpeed = flySpeed - 0.05; if (flySpeed < 0.05) { flySpeed = 0.05; }
if (isFlying) { GAME.NETWORK.send("setFly", { active: true, speed: flySpeed }); }
updateFlySpeedUI();
return;
}
if (id == "fly_plus") {
flySpeed = flySpeed + 0.05; if (flySpeed > 5.0) { flySpeed = 5.0; }
if (isFlying) { GAME.NETWORK.send("setFly", { active: true, speed: flySpeed }); }
updateFlySpeedUI();
return;
}
#@E
#@F:KICKHOST
if (id == "act_kickhost") {
if (kickHostArmed) {
kickHostArmed = false; kickHostArmTimer = 0;
GAME.UI.updateDIVText("act_kickhost", "KICK HOST");
GAME.UI.updateDIV("act_kickhost", "background", "rgba(255,93,122,0.13)");
GAME.NETWORK.send("kickhost", { confirm: true });
} else {
GAME.NETWORK.send("kickhost", { confirm: false });
}
return;
}
#@E
if (id[0] == "t") {
if (id == "tALL") {
if (selectedID == "ALL") {
selectedID = "";
GAME.UI.updateDIVText("status_text1", "Subject: None");
GAME.UI.updateDIV("tALL", "background", "rgba(255,184,77,0.12)");
GAME.UI.updateDIV("tALL", "color", "#ffc46b");
} else {
p2pStage = "OFF"; selectedID = "ALL";
GAME.UI.updateDIVText("status_text1", "Subject: EVERYONE");
GAME.UI.updateDIV("tALL", "background", "rgba(255,184,77,0.35)");
GAME.UI.updateDIV("tALL", "color", "#1a1300");
}
return;
}
str actualID = UTILS.truncateTxt(id, 1, true, lengthOf id);
str nm = pName(actualID);
if (p2pStage != "OFF") {
if (p2pStage == "WAIT_TOTHEM") {
GAME.NETWORK.send("adminAction", { type: "tp", subType: "TOTHEM", target: actualID });
p2pStage = "OFF"; GAME.UI.updateDIV("act_tothem", "background", "rgba(255,255,255,0.045)");
GAME.UI.updateDIVText("status_text2", "TPd to " + nm);
}
if (p2pStage == "WAIT_TOME") {
GAME.NETWORK.send("adminAction", { type: "tp", subType: "TOME", target: actualID });
p2pStage = "OFF"; GAME.UI.updateDIV("act_tome", "background", "rgba(255,255,255,0.045)");
GAME.UI.updateDIVText("status_text2", "Brought " + nm);
}
if (p2pStage == "WAIT_P1") {
p2pSubjectID = actualID; p2pStage = "WAIT_P2";
GAME.UI.updateDIVText("act_p2p", nm + " to ...");
GAME.UI.updateDIVText("status_text1", "P1: " + nm);
GAME.UI.updateDIVText("status_text2", "Select P2 (Target)...");
GAME.UI.updateDIV(id, "background", "rgba(255,184,77,0.25)");
return;
}
if (p2pStage == "WAIT_P2") {
GAME.NETWORK.send("adminAction", { type: "tp", subType: "P2P", subject: p2pSubjectID, target: actualID });
p2pStage = "OFF"; p2pSubjectID = "";
GAME.UI.updateDIVText("act_p2p", "PLAYER TO PLAYER");
GAME.UI.updateDIV("act_p2p", "background", "rgba(255,255,255,0.045)");
GAME.UI.updateDIVText("status_text1", "TP Done!");
GAME.UI.updateDIVText("status_text2", "Moved to " + nm);
refreshPlayerList();
}
return;
}
if (selectedID == actualID) { selectedID = ""; refreshPlayerList(); }
else {
selectedID = actualID; refreshPlayerList();
GAME.UI.updateDIVText("status_text1", "Subject: " + nm);
}
return;
}
if (UTILS.truncateTxt(id, 0, true, 4) == "act_") {
if (selectedID == "") { return; }
activeFlashBtn = id; flashTimer = 0.15;
GAME.UI.updateDIV(id, "background", "rgba(255,255,255,0.18)");
if (id == "act_kill")   { GAME.NETWORK.send("adminAction", { type: "kill",   target: selectedID }); }
if (id == "act_breakroom") { GAME.NETWORK.send("adminAction", { type: "breakroom", target: selectedID }); }
#@F:TEMPADMIN
if (id == "act_mkadmin") {
if (actArmed && actArmType == "mkadmin" && actArmTarget == selectedID) {
GAME.NETWORK.send("adminAction", { type: "grant", role: "admin", target: selectedID });
actArmed = false; actArmTimer = 0; GAME.UI.updateDIVText("act_mkadmin", "MAKE TEMP ADMIN");
} else {
actArmed = true; actArmType = "mkadmin"; actArmTarget = selectedID; actArmTimer = 5000;
GAME.UI.updateDIVText("act_mkadmin", "CONFIRM? MAKE ADMIN");
}
}
if (id == "act_mksuper") {
if (actArmed && actArmType == "mksuper" && actArmTarget == selectedID) {
GAME.NETWORK.send("adminAction", { type: "grant", role: "super", target: selectedID });
actArmed = false; actArmTimer = 0; GAME.UI.updateDIVText("act_mksuper", "MAKE TEMP SUPER");
} else {
actArmed = true; actArmType = "mksuper"; actArmTarget = selectedID; actArmTimer = 5000;
GAME.UI.updateDIVText("act_mksuper", "CONFIRM? MAKE SUPER");
}
}
#@E
#@F:FAKEADMIN
if (id == "act_mkfake")  { GAME.NETWORK.send("adminAction", { type: "grant", role: "fake",  target: selectedID }); }
#@E
#@F:TROLL
if (id == "act_freeze") { GAME.NETWORK.send("adminAction", { type: "freeze", target: selectedID }); }
if (id == "act_yeet")   { GAME.NETWORK.send("adminAction", { type: "yeet",   target: selectedID }); }
if (id == "act_scare")  { GAME.NETWORK.send("jumpscare",   { target: selectedID }); }
#@E
if (id == "act_kick")   {
bool ck = (actArmed && actArmType == "kick" && actArmTarget == selectedID);
GAME.NETWORK.send("adminAction", { type: "kick", target: selectedID, confirm: ck });
if (ck) { actArmed = false; actArmTimer = 0; GAME.UI.updateDIVText("act_kick", "KICK PLAYER"); }
}
if (id == "act_mute")   { GAME.NETWORK.send("adminAction", { type: "mute",   target: selectedID }); }
if (id == "act_ban")    {
bool cb = (actArmed && actArmType == "ban" && actArmTarget == selectedID);
GAME.NETWORK.send("adminAction", { type: "ban", target: selectedID, confirm: cb });
if (cb) { actArmed = false; actArmTimer = 0; GAME.UI.updateDIVText("act_ban", "BAN"); }
}
#@F:SUPERPLUS
if (id == "act_clearwep") { GAME.NETWORK.send("adminAction", { type: "clearwep", target: selectedID }); }
#@E
return;
}
#@F:GIVE
if (id[0] == "g" && id[1] == "w") {
if (selectedID == "" || selectedID == "ALL") {
GAME.UI.updateDIVText("giveHint", "pick ONE player first");
return;
}
for (num w = 0; w < lengthOf giveName; w++) {
if (id == "gw" + toStr(w)) {
activeFlashBtn = id; flashTimer = 0.2;
GAME.UI.updateDIV(id, "background", "rgba(139,123,255,0.45)");
GAME.NETWORK.send("adminAction", { type: "give", weaponId: giveWid[w], weaponName: giveName[w], target: selectedID });
GAME.UI.updateDIVText("giveHint", "gave " + giveName[w] + " to " + pName(selectedID));
return;
}
}
}
#@E
if (id[0] == "u") {
for (num k = 0; k < lengthOf utilBtn; k++) {
if (id == utilBtn[k]) {
#@F:NUKE
if (utilMsg[k] == "Nuke") {
if (nukeArmed) {
nukeArmed = false; nukeArmTimer = 0;
GAME.UI.updateDIVText("txt_" + utilBtn[k], "NUKE");
GAME.UI.updateDIV(utilBtn[k], "background", "rgba(255,255,255,0.04)");
GAME.NETWORK.send("Nuke", { target: selectedID });
} else {
nukeArmed = true; nukeArmTimer = 5000; nukeBtnId = utilBtn[k];
GAME.UI.updateDIVText("txt_" + utilBtn[k], "CONFIRM?");
GAME.UI.updateDIV(utilBtn[k], "background", "rgba(255,93,122,0.45)");
}
return;
}
#@E
activeFlashBtn = id; flashTimer = 0.2;
GAME.UI.updateDIV(id, "background", "rgba(52,214,200,0.3)");
GAME.NETWORK.send(utilMsg[k], { target: selectedID });
return;
}
}
}
#@E
}
public action onNetworkMessage(str id, obj data) {
if (USE_HIDECHAT && id == "revealChat") { chatRevealed = true; GAME.UI.updateDIV("chatUI", "display", "block"); }
if (id == "grabPrompt") { GAME.UI.updateDIV("grabPromptBox", "display", "block"); grabPromptTimer = 3500; }
#@F:PANEL
if (id == "roster") {
rosterA = (str)data.a; rosterS = (str)data.s;
if (menuVisible) { refreshPlayerColors(); }
}
#@E
#@F:VOTEKICK
if (id == "forceRefresh") { lastKickRoster = 0 - 2; }
if (id == "voteCount") {
str vcid = (str)data.id; num vcn = (num)data.n;
for (num i = lengthOf voteTallyArr - 1; i >= 0; i--) { if ((str)voteTallyArr[i].id == vcid) { remove voteTallyArr[i]; } }
if (vcn > 0) { addTo voteTallyArr { id: vcid, n: vcn }; }
if (menuOpen) { updateVoteRow(vcid); }
}
if (id == "myVote") {
str oldMine = myVoteTarget;
myVoteTarget = (str)data.target;
if (menuOpen) {
if (oldMine != "") { updateVoteRow(oldMine); }
if (myVoteTarget != "") { updateVoteRow(myVoteTarget); }
}
}
#@E
#@F:GUESTKICK
if (id == "guestKickState") {
str gks = "OFF"; if ((bool)data.on) { gks = "ON"; }
GAME.UI.updateDIVText("act_guestkick", "GUEST KICK: " + gks);
}
if (id == "guestWarn") {
if ((bool)data.state) {
GAME.UI.updateDIVText("guestWarnBox", "NOT SIGNED IN - kicked in " + toStr((num)data.remain) + "s. Sign in to stay.");
GAME.UI.updateDIV("guestWarnBox", "display", "block");
} else { GAME.UI.updateDIV("guestWarnBox", "display", "none"); }
}
#@E
#@F:RAID
if (id == "raidDefState") {
if ((bool)data.on) {
GAME.UI.updateDIVText("act_raiddef", "RAID DEFENSE: ON");
GAME.UI.updateDIV("act_raiddef", "background", "rgba(40,220,90,0.85)"); GAME.UI.updateDIV("act_raiddef", "color", "#04220d"); GAME.UI.updateDIV("act_raiddef", "border", "1px solid #2ee06a");
} else {
GAME.UI.updateDIVText("act_raiddef", "RAID DEFENSE: OFF");
GAME.UI.updateDIV("act_raiddef", "background", "rgba(255,40,60,0.9)"); GAME.UI.updateDIV("act_raiddef", "color", "#ffffff"); GAME.UI.updateDIV("act_raiddef", "border", "1px solid #ff5d7a");
}
}
if (id == "lockState") {
if ((bool)data.on) {
GAME.UI.updateDIVText("act_lockdown", "LOCKDOWN: ON");
GAME.UI.updateDIV("act_lockdown", "background", "rgba(40,220,90,0.85)"); GAME.UI.updateDIV("act_lockdown", "color", "#04220d"); GAME.UI.updateDIV("act_lockdown", "border", "1px solid #2ee06a");
} else {
GAME.UI.updateDIVText("act_lockdown", "LOCKDOWN: OFF");
GAME.UI.updateDIV("act_lockdown", "background", "rgba(255,40,60,0.9)"); GAME.UI.updateDIV("act_lockdown", "color", "#ffffff"); GAME.UI.updateDIV("act_lockdown", "border", "1px solid #ff5d7a");
}
}
if (id == "raidAlert") {
GAME.UI.updateDIVText("raidWarnMain", "!! POSSIBLE RAID !!");
GAME.UI.updateDIVText("raidWarnSub", toStr((num)data.joins) + " joined fast (" + toStr((num)data.guests) + " guests, " + toStr((num)data.total) + " online). Auto-kicked " + toStr((num)data.kicked) + ". Watch the HOST - kick spectators. Recent: " + (str)data.recent);
GAME.UI.updateDIV("raidWarnBox", "display", "block");
raidWarnTimer = 16000;
}
if (id == "lagAlert") {
GAME.UI.updateDIVText("raidWarnMain", "SERVER LAGGING");
GAME.UI.updateDIVText("raidWarnSub", "Big lag spike - likely a bot/lag attack. Recently joined: " + (str)data.recent + ". Kick them + spectators, or END GAME.");
GAME.UI.updateDIV("raidWarnBox", "display", "block");
raidWarnTimer = 16000;
}
if (id == "hostKickSpec") {
GAME.UI.updateDIVText("raidWarnMain", "RAID - KICK SPECTATORS");
GAME.UI.updateDIVText("raidWarnSub", "You are the HOST. Open the Alt menu and KICK SPECTATORS now to stop the flood.");
GAME.UI.updateDIV("raidWarnBox", "display", "block");
raidWarnTimer = 16000;
}
#@E
#@F:MUTEPERSIST
if (id == "muteGuestState") {
if ((bool)data.on) {
GAME.UI.updateDIVText("act_muteguests", "MUTE GUESTS: ON");
GAME.UI.updateDIV("act_muteguests", "background", "rgba(40,220,90,0.85)"); GAME.UI.updateDIV("act_muteguests", "color", "#04220d"); GAME.UI.updateDIV("act_muteguests", "border", "1px solid #2ee06a");
} else {
GAME.UI.updateDIVText("act_muteguests", "MUTE GUESTS: OFF");
GAME.UI.updateDIV("act_muteguests", "background", "rgba(255,255,255,0.045)"); GAME.UI.updateDIV("act_muteguests", "color", "#eef0f6"); GAME.UI.updateDIV("act_muteguests", "border", "1px solid rgba(255,255,255,0.08)");
}
}
#@E
#@F:SUPERPLUS
if (id == "banListData") {
banNames = (str[])data.names;
refreshUnbanList();
}
#@E
#@F:MUTEPERSIST
if (id == "muteListData") {
muteNames = (str[])data.names;
refreshMuteList();
}
#@E
#@F:TEMPADMIN
if (id == "tempListData") {
tempAdminsUI = (str[])data.admins;
tempSupersUI = (str[])data.supers;
refreshTempList();
}
#@E
#@F:LIMITEDADMIN
if (id == "limitedListData") {
limAdminsUI = (str[])data.admins;
limAdminMsUI = (num[])data.adminMins;
limSupersUI = (str[])data.supers;
limSuperMsUI = (num[])data.superMins;
refreshLimitedList();
}
#@E
if (id == "tier") {
str role = (str)data.role;
bool wasStaff = amAdminTier;
amSuper = (role == "super");
amAdminTier = (role == "admin" || role == "super");
applyTier();
#@F:PANEL
if (amSuper) { GAME.NETWORK.send("reqRoster", {}); }
#@E
#@F:HIDECHAT
if (USE_HIDECHAT && amAdminTier) { chatRevealed = true; GAME.UI.updateDIV("chatUI", "display", "block"); }
#@E
#@F:HISTORY
if (amSuper && !histReqDone) { histReqDone = true; GAME.NETWORK.send("reqHistory", {}); }
#@E
if (wasStaff && !amAdminTier) {
#@F:HISTORY
histReqDone = false;
#@E
menuVisible = false;
GAME.UI.updateDIV("playerContainer", "display", "none");
GAME.UI.updateDIV("actionContainer", "display", "none");
GAME.UI.updateDIV("uiShield", "display", "none");
selectedID = "";
GAME.INPUTS.lockMouse();
GAME.UI.updateDIVText("removedToast", "You have been removed from staff");
GAME.UI.updateDIV("removedToast", "display", "block");
removedToastTimer = 4000;
}
}
#@F:FAKEADMIN
if (id == "fakeBusted") {
GAME.UI.updateDIVText("removedToast", "Caught abusing admin. Enjoy the break room.");
GAME.UI.updateDIV("removedToast", "display", "block");
removedToastTimer = 6000;
}
#@E
#@F:HISTORY
if (id == "histClear") { histLog = str[]; histColor = str[]; renderHistory(); }
if (id == "logEntry") {
addTo histLog (str)data.text;
addTo histColor (str)data.color;
if (lengthOf histLog > 50) { remove histLog[0]; remove histColor[0]; }
renderHistory();
}
#@E
#@F:FLYCAM
if (id == "flyState") { isFlying = (bool)data.active; updateFlyToggleUI(); updateFlySpeedUI(); }
if (id == "ghostState") {
isFreeCam = (bool)data.active;
if (!isFreeCam) { GAME.CAMERA.attach(); }
updateFreeCamToggleUI(); updateFlySpeedUI();
}
#@E
#@F:KICKHOST
if (id == "confirmKickHost") {
kickHostArmed = true; kickHostArmTimer = 5000;
GAME.UI.updateDIVText("act_kickhost", "CONFIRM? KICK ADMIN " + (str)data.name);
GAME.UI.updateDIV("act_kickhost", "background", "rgba(255,93,122,0.5)");
}
#@E
if (id == "confirmAction") {
actArmed = true; actArmType = (str)data.type; actArmTarget = (str)data.target; actArmTimer = 5000;
str abid = "act_kick"; if (actArmType == "ban") { abid = "act_ban"; }
GAME.UI.updateDIVText(abid, "CONFIRM " + UTILS.toUpper(actArmType) + " ADMIN " + (str)data.name + "?");
GAME.UI.updateDIV(abid, "background", "rgba(255,93,122,0.5)");
}
#@F:ENDHOST
if (id == "endStart") {
endWarnUntil = GAME.TIME.now() + (num)data.seconds * 1000;
GAME.UI.updateDIV("endBanner", "display", "flex");
if (amSuper) {
endGameLive = true; endGameArmed = false; endGameArmTimer = 0;
GAME.UI.updateDIVText("act_endhost", "CANCEL END GAME");
GAME.UI.updateDIV("act_endhost", "background", "rgba(0,255,150,0.35)");
}
}
if (id == "endWarnSuper") {
GAME.UI.updateDIV("specWarn", "display", "block");
}
if (id == "endCancelled") {
endWarnUntil = 0;
GAME.UI.updateDIV("endBanner", "display", "none");
GAME.UI.updateDIV("specWarn", "display", "none");
if (amSuper) {
endGameLive = false;
GAME.UI.updateDIVText("act_endhost", "END GAME");
GAME.UI.updateDIV("act_endhost", "background", "rgba(255,93,122,0.13)");
}
}
#@E
if (id == "syncFreeze") {
str fid = (str)data.id;
bool val = (bool)data.val;
if (val) {
if (!inList(frozenIDs, fid)) { addTo frozenIDs fid; }
obj me = GAME.PLAYERS.getSelf();
if (notEmpty me && (str)me.id == fid) { GAME.CAMERA.detach(); }
} else {
dropFrom(frozenIDs, fid);
obj p = GAME.PLAYERS.findByID(fid);
if (notEmpty p) { p.defaultMovement = true; p.defaultVelocity = true; }
obj me2 = GAME.PLAYERS.getSelf();
if (notEmpty me2 && (str)me2.id == fid) { GAME.CAMERA.attach(); }
}
}
if (id == "syncInvis") {
str iid = (str)data.id;
bool val = (bool)data.val;
obj t = GAME.PLAYERS.findByID(iid);
if (notEmpty t) { t.visible = !val; }
if (val) { if (!inList(invisIDs, iid)) { addTo invisIDs iid; } }
else { dropFrom(invisIDs, iid); }
}
if (id == "playerDied") {
str d = (str)data.id;
GAME.UI.updateDIV("t" + d, "opacity", "0.35");
}
if (id == "muteState") {
iAmMuted = (bool)data.val;
if (!iAmMuted) {
if (chatShieldUp) { GAME.UI.removeDIV("chat_shield"); chatShieldUp = false; }
GAME.UI.updateDIV("chatUI", "display", "block");
}
}
if (id == "syncMuteIcon") {
str mid = (str)data.id;
bool val = (bool)data.val;
if (val) {
if (!inList(mutedUIIDs, mid)) { addTo mutedUIIDs mid; }
GAME.UI.updateDIV("muteIcon" + mid, "display", "block");
GAME.UI.updateDIV("pname" + mid, "color", "#ff8aa0");
} else {
dropFrom(mutedUIIDs, mid);
GAME.UI.updateDIV("muteIcon" + mid, "display", "none");
GAME.UI.updateDIV("pname" + mid, "color", "#eef0f6");
}
if (mid == selectedID) { updateMuteBtn(); }
}
if (id == "forceDeletePlayer") {
str fd = (str)data.id;
GAME.UI.removeDIV("t" + fd);
GAME.UI.removeDIV("muteIcon" + fd);
GAME.UI.removeDIV("pname" + fd);
dropFrom(frozenIDs, fd);
dropFrom(mutedUIIDs, fd);
dropFrom(invisIDs, fd);
#@F:PANEL
if (selectedID == fd) { selectedID = ""; GAME.UI.updateDIVText("status_text1", "Subject: None"); }
if (menuVisible) { refreshPlayerList(); }
#@E
}
#@F:NUKE
if (id == "gotNuked") {
GAME.CAMERA.shake(1);
GAME.UI.addDIV("nukeFlash", true, "position:fixed; left:0; top:0; width:100%; height:100%; background:white; z-index:9999; pointer-events:none; opacity:1;", "");
nukeFlashTimer = 0.6;
}
#@E
#@F:REVNUKE
if (id == "nukeRule") {
if (!nukeRuleShown) {
nukeRuleShown = true;
num rc = (num)data.cycle; num rd = (num)data.duds;
GAME.UI.updateDIVText("nukeRuleMain", toStr(rd) + " of every " + toStr(rc) + " nukes gives no kills");
GAME.UI.updateDIV("nukeRuleBox", "display", "block");
nukeRuleTimer = 8000;
}
}
#@E
#@F:TROLL
if (id == "jumpscared") {
GAME.CAMERA.shake(1);
if (SCARE_IMG != "") {
GAME.UI.addImage(SCARE_IMG, "scareImg", true, "position:fixed; left:0; top:0; width:100%; height:100%; z-index:99999; pointer-events:none;", "");
} else {
GAME.UI.addDIV("scareFlash", true, "position:fixed; left:0; top:0; width:100%; height:100%; background:#c4001a; z-index:99999; pointer-events:none; opacity:0.92;", "");
}
if (SCARE_SND != "") { GAME.SOUND.play2D(SCARE_SND, 1, 1, false); }
scareTimer = 1200;
}
#@E
}