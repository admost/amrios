function getIosNetworks() {
  return JSON.parse(`
  {"ad_networks":
  [{"name":"AMR","status":true,"pod":"AMRSDK","version":"1.4", "minTargetSdk":"8.0"},
  {"name":"AdColony","status":false,"pod":"AMRAdapterAdcolony","version":"4.3", "minTargetSdk":"9.0"},
  {"name":"A4G","status":false,"pod":"AMRAdapterAdmob","version":"7.64", "minTargetSdk":"9.0"},
  {"name":"AdMob","status":false,"pod":"AMRAdapterAdmob","version":"7.69", "minTargetSdk":"9.0"},
  {"name":"Admost","status":false,"pod":"AMRAdapterAdmost","version":"1.4", "minTargetSdk":"8.0"},
  {"name":"Adtiming","status":false,"pod":"AMRAdapterAdtiming","version":"4.4", "minTargetSdk":"9.0"},
  {"name":"Amazon","status":false,"pod":"AMRAdapterAmazon","version":"3.1", "minTargetSdk":"9.0"},
  {"name":"AppLovin","status":false,"pod":"AMRAdapterApplovin","version":"6.14", "minTargetSdk":"9.0"},
  {"name":"Appnext","status":false,"pod":"AMRAdapterAppnext","version":"1.9", "minTargetSdk":"8.0"},
  {"name":"Appsamurai","status":false,"pod":"AMRAdapterAppsamurai","version":"1.4", "minTargetSdk":"8.0"},
  {"name":"Chartboost","status":false,"pod":"AMRAdapterChartboost","version":"8.4", "minTargetSdk":"10.0"},
  {"name":"Criteo","status":false,"pod":"AMRAdapterCriteo","version":"4.1", "minTargetSdk":"8.0"},
  {"name":"DFP","status":false,"pod":"AMRAdapterDFP","version":"7.69", "minTargetSdk":"8.0"},
  {"name":"Facebook","status":false,"pod":"AMRAdapterFacebook","version":"6.2", "minTargetSdk":"9.0"},
  {"name":"Fyber","status":false,"pod":"AMRAdapterFyber","version":"9.1", "minTargetSdk":"8.0"},
  {"name":"HyprMx","status":false,"pod":"AMRAdapterHyprmx","version":"5.4", "minTargetSdk":"8.0"},
  {"name":"InMobi","status":false,"pod":"AMRAdapterInmobi","version":"9.1", "minTargetSdk":"9.0"},
  {"name":"Inneractive","status":false,"pod":"AMRAdapterInneractive","version":"7.7", "minTargetSdk":"8.0"},
  {"name":"IronSource","status":false,"pod":"AMRAdapterIronsource","version":"7.0", "minTargetSdk":"8.0"},
  {"name":"Mintegral","status":false,"pod":"AMRAdapterMintegral","version":"6.7", "minTargetSdk":"9.0"},
  {"name":"Mobfox","status":false,"pod":"AMRAdapterMobfox","version":"4.2", "minTargetSdk":"9.0"},
  {"name":"Mopub","status":false,"pod":"AMRAdapterMopub","version":"5.14", "minTargetSdk":"9.0"},
  {"name":"MyTarget","status":false,"pod":"AMRAdapterMytarget","version":"5.9", "minTargetSdk":"9.0"},
  {"name":"Nexage(AOL)","status":false,"pod":"AMRAdapterNexage","version":"6.8", "minTargetSdk":"8.0"},
  {"name":"Ogury","status":false,"pod":"AMRAdapterOgury","version":"2.3", "minTargetSdk":"10.0"},
  {"name":"Qumpara","status":false,"pod":"AMRAdapterQumpara","version":"1.1", "minTargetSdk":"9.0"},
  {"name":"Pollfish","status":false,"pod":"AMRAdapterPollfish","version":"5.0", "minTargetSdk":"8.0"},
  {"name":"Pubnative","status":false,"pod":"AMRAdapterPubnative","version":"2.2", "minTargetSdk":"9.0"},
  {"name":"Smaato","status":false,"pod":"AMRAdapterSmaato","version":"21.6", "minTargetSdk":"9.0"},
  {"name":"StartApp","status":false,"pod":"AMRAdapterStartapp","version":"4.5", "minTargetSdk":"8.0"},
  {"name":"Tapjoy","status":false,"pod":"AMRAdapterTapjoy","version":"12.7", "minTargetSdk":"8.0"},
  {"name":"Tappx","status":false,"pod":"AMRAdapterTappx","version":"4.0", "minTargetSdk":"9.0"},
  {"name":"TapResearch","status":false,"pod":"AMRAdapterTapresearch","version":"2.0", "minTargetSdk":"8.0"},
  {"name":"TikTok","status":false,"pod":"AMRAdapterTiktok","version":"3.3", "minTargetSdk":"9.0"},
  {"name":"UnityAds","status":false,"pod":"AMRAdapterUnity","version":"3.6", "minTargetSdk":"9.0"},
  {"name":"Vungle","status":false,"pod":"AMRAdapterVungle","version":"6.8", "minTargetSdk":"9.0"},
  {"name":"YandexAds","status":false,"pod":"AMRAdapterYandex","version":"3.1", "minTargetSdk":"8.0"},
  {"name":"YouAppi","status":false,"pod":"AMRAdapterYouappi","version":"5.0", "minTargetSdk":"9.0"}]}`);
}

function getIos14Keys() {
  return JSON.parse(`
  [
    {"name":"AdColony","skAdNetwork": ["4PFYVQ9L8R.skadnetwork","YCLNXRL5PM.skadnetwork","V72QYCH5UU.skadnetwork","TL55SBB4FM.skadnetwork","T38B2KH725.skadnetwork","PRCB7NJMU6.skadnetwork","PPXM28T8AP.skadnetwork","MLMMFZH3R3.skadnetwork","KLF5C3L5U5.skadnetwork","HS6BDUKANM.skadnetwork","C6K4G5QG8M.skadnetwork","9T245VHMPL.skadnetwork","9RD848Q2BZ.skadnetwork","8S468MFL3Y.skadnetwork","7UG5ZH24HU.skadnetwork","4FZDC2EVR5.skadnetwork","4468KM3ULZ.skadnetwork","3RD42EKR43.skadnetwork","2U9PT9HC89.skadnetwork","M8DBW4SV7C.skadnetwork","7RZ58N8NTL.skadnetwork","EJVT5QM6AK.skadnetwork","5LM9LJ6JB7.skadnetwork","44JX6755AQ.skadnetwork", "MTKV5XTK9E.skadnetwork"]},
    {"name":"AdMob","skAdNetwork": ["cstr6suwn9.skadnetwork"]},
    {"name":"Adtiming","skAdNetwork": ["488r3q3dtq.skadnetwork"]},
    {"name":"AppLovin","skAdNetwork": ["2u9pt9hc89.skadnetwork","4468km3ulz.skadnetwork","4fzdc2evr5.skadnetwork","7ug5zh24hu.skadnetwork","8s468mfl3y.skadnetwork","9rd848q2bz.skadnetwork","9t245vhmpl.skadnetwork","av6w8kgt66.skadnetwork","f38h382jlk.skadnetwork","hs6bdukanm.skadnetwork","kbd757ywx3.skadnetwork","ludvb6z3bs.skadnetwork","m8dbw4sv7c.skadnetwork","mlmmfzh3r3.skadnetwork","prcb7njmu6.skadnetwork","t38b2kh725.skadnetwork","tl55sbb4fm.skadnetwork","wzmmz9fp6w.skadnetwork","yclnxrl5pm.skadnetwork","ydx93a7ass.skadnetwork"]},
    {"name":"Chartboost","skAdNetwork": ["F38H382JLK.skadnetwork"]},
    {"name":"Criteo","skAdNetwork": ["hs6bdukanm.skadnetwork"]},
    {"name":"Facebook","skAdNetwork": ["v9wttpbfk9.skadnetwork", "n38lu8286q.skadnetwork"]},
    {"name":"HyprMx","skAdNetwork": ["NU4557A4JE.skadnetwork"]},
    {"name":"InMobi","skAdNetwork": ["uw77j35x4d.skadnetwork", "7UG5ZH24HU.skadnetwork", "hs6bdukanm.skadnetwork", "4FZDC2EVR5.skadnetwork", "ggvn48r87g.skadnetwork", "5lm9lj6jb7.skadnetwork", "9RD848Q2BZ.skadnetwork", "c6k4g5qg8m.skadnetwork", "WZMMZ9FP6W.skadnetwork", "3sh42y64q3.skadnetwork", "YCLNXRL5PM.skadnetwork", "KBD757YWX3.skadnetwork", "f73kdq92p3.skadnetwork", "ydx93a7ass.skadnetwork", "W9Q455WK68.skadnetwork", "prcb7njmu6.skadnetwork", "wg4vff78zm.skadnetwork", "mlmmfzh3r3.skadnetwork", "TL55SBB4FM.skadnetwork", "4PFYVQ9L8R.skadnetwork", "t38b2kh725.skadnetwork", "5l3tpt7t6e.skadnetwork", "7rz58n8ntl.skadnetwork", "KLF5C3L5U5.skadnetwork", "cg4yq2srnc.skadnetwork", "av6w8kgt66.skadnetwork", "9T245VHMPL.skadnetwork", "V72QYCH5UU.skadnetwork", "2U9PT9HC89.skadnetwork", "44jx6755aq.skadnetwork", "8s468mfl3y.skadnetwork", "p78axxw29g.skadnetwork", "ppxm28t8ap.skadnetwork", "424m5254lk.skadnetwork" ]},
    {"name":"IronSource","skAdNetwork": ["SU67R6K2V3.skadnetwork"]},
    {"name":"Mintegral","skAdNetwork": ["KBD757YWX3.skadnetwork"]},
    {"name":"Pubnative","skAdNetwork": ["TL55SBB4FM.skadnetwork", "6xzpu9s2p8.skadnetwork"]},
    {"name":"Tapjoy","skAdNetwork": ["ECPZ2SRF59.skadnetwork", "7UG5ZH24HU.skadnetwork", "9T245VHMPL.skadnetwork", "prcb7njmu6.skadnetwork", "5lm9lj6jb7.skadnetwork", "578prtvx9j.skadnetwork"]},
    {"name":"TikTok","skAdNetwork": ["238da6jt44.skadnetwork", "22mmun2rn5.skadnetwork"]},
    {"name":"UnityAds","skAdNetwork": ["f73kdq92p3.skadnetwork", "lr83yxwka7.skadnetwork", "cstr6suwn9.skadnetwork", "bvpn9ufa9b.skadnetwork", "c6k4g5qg8m.skadnetwork", "F38H382JLK.skadnetwork", "3sh42y64q3.skadnetwork", "av6w8kgt66.skadnetwork", "t38b2kh725.skadnetwork", "5lm9lj6jb7.skadnetwork", "4468km3ulz.skadnetwork", "44n7hlldy6.skadnetwork", "578prtvx9j.skadnetwork", "TL55SBB4FM.skadnetwork", "prcb7njmu6.skadnetwork", "4FZDC2EVR5.skadnetwork", "M8DBW4SV7C.skadnetwork", "v79kvwwj4g.skadnetwork", "mlmmfzh3r3.skadnetwork", "488r3q3dtq.skadnetwork", "zmvfpc5aq8.skadnetwork", "WZMMZ9FP6W.skadnetwork", "ydx93a7ass.skadnetwork", "44jx6755aq.skadnetwork", "424M5254LK.skadnetwork", "ppxm28t8ap.skadnetwork", "238da6jt44.skadnetwork", "GLQZH8VGBY.skadnetwork", "YCLNXRL5PM.skadnetwork", "hs6bdukanm.skadnetwork", "9RD848Q2BZ.skadnetwork", "2U9PT9HC89.skadnetwork", "v72qych5uu.skadnetwork", "24t9a8vw3c.skadnetwork", "4DZT52R2T5.skadnetwork", "7UG5ZH24HU.skadnetwork", "9T245VHMPL.skadnetwork", "3RD42EKR43.skadnetwork", "wg4vff78zm.skadnetwork", "8s468mfl3y.skadnetwork", "KBD757YWX3.skadnetwork", "22mmun2rn5.skadnetwork", "4PFYVQ9L8R.skadnetwork", "5a6flpkh64.skadnetwork"]},
    {"name":"Vungle","skAdNetwork": ["GTA9LK7P23.skadnetwork", "ydx93a7ass.skadnetwork", "4FZDC2EVR5.skadnetwork", "4PFYVQ9L8R.skadnetwork", "v72qych5uu.skadnetwork", "mlmmfzh3r3.skadnetwork", "c6k4g5qg8m.skadnetwork", "YCLNXRL5PM.skadnetwork", "5lm9lj6jb7.skadnetwork", "n9x2a789qt.skadnetwork", "TL55SBB4FM.skadnetwork", "2U9PT9HC89.skadnetwork", "8s468mfl3y.skadnetwork", "GLQZH8VGBY.skadnetwork", "22mmun2rn5.skadnetwork", "3RD42EKR43.skadnetwork"]}
    ]
    `);
}
