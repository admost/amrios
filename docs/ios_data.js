function getIosNetworks() {
  return JSON.parse(`
  {"ad_networks":
  [{"name":"AMR","status":true,"pod":"AMRSDK","version":"1.4", "minTargetSdk":"8.0"},
  {"name":"AdColony","status":false,"pod":"AMRAdapterAdcolony","version":"4.5", "minTargetSdk":"9.0"},
  {"name":"A4G","status":false,"pod":"AMRAdapterAdmob","version":"8.2", "minTargetSdk":"9.0"},
  {"name":"AdMob","status":false,"pod":"AMRAdapterAdmob","version":"8.2", "minTargetSdk":"9.0"},
  {"name":"Admost","status":false,"pod":"AMRAdapterAdmost","version":"1.4", "minTargetSdk":"8.0"},
  {"name":"Adtiming","status":false,"pod":"AMRAdapterAdtiming","version":"4.4", "minTargetSdk":"9.0"},
  {"name":"Amazon","status":false,"pod":"AMRAdapterAmazon","version":"3.1", "minTargetSdk":"9.0"},
  {"name":"AppLovin","status":false,"pod":"AMRAdapterApplovin","version":"10.0", "minTargetSdk":"9.0"},
  {"name":"Appnext","status":false,"pod":"AMRAdapterAppnext","version":"1.9", "minTargetSdk":"8.0"},
  {"name":"Appsamurai","status":false,"pod":"AMRAdapterAppsamurai","version":"1.4", "minTargetSdk":"8.0"},
  {"name":"Chartboost","status":false,"pod":"AMRAdapterChartboost","version":"8.4", "minTargetSdk":"10.0"},
  {"name":"Criteo","status":false,"pod":"AMRAdapterCriteo","version":"4.3", "minTargetSdk":"8.0"},
  {"name":"DFP","status":false,"pod":"AMRAdapterDFP","version":"8.2", "minTargetSdk":"8.0"},
  {"name":"Facebook","status":false,"pod":"AMRAdapterFacebook","version":"6.3", "minTargetSdk":"9.0"},
  {"name":"Fyber","status":false,"pod":"AMRAdapterFyber","version":"9.1", "minTargetSdk":"8.0"},
  {"name":"HyprMx","status":false,"pod":"AMRAdapterHyprmx","version":"5.4", "minTargetSdk":"8.0"},
  {"name":"InMobi","status":false,"pod":"AMRAdapterInmobi","version":"9.1", "minTargetSdk":"9.0"},
  {"name":"Inneractive","status":false,"pod":"AMRAdapterInneractive","version":"7.8", "minTargetSdk":"8.0"},
  {"name":"IronSource","status":false,"pod":"AMRAdapterIronsource","version":"7.1", "minTargetSdk":"8.0"},
  {"name":"Mintegral","status":false,"pod":"AMRAdapterMintegral","version":"6.7", "minTargetSdk":"9.0"},
  {"name":"Mobfox","status":false,"pod":"AMRAdapterMobfox","version":"4.2", "minTargetSdk":"9.0"},
  {"name":"Mopub","status":false,"pod":"AMRAdapterMopub","version":"5.14", "minTargetSdk":"9.0"},
  {"name":"MyTarget","status":false,"pod":"AMRAdapterMytarget","version":"5.10", "minTargetSdk":"9.0"},
  {"name":"Nexage(AOL)","status":false,"pod":"AMRAdapterNexage","version":"6.8", "minTargetSdk":"8.0"},
  {"name":"Ogury","status":false,"pod":"AMRAdapterOgury","version":"2.3", "minTargetSdk":"10.0"},
  {"name":"Qumpara","status":false,"pod":"AMRAdapterQumpara","version":"1.1", "minTargetSdk":"9.0"},
  {"name":"Pollfish","status":false,"pod":"AMRAdapterPollfish","version":"5.0", "minTargetSdk":"8.0"},
  {"name":"Pubnative","status":false,"pod":"AMRAdapterPubnative","version":"2.2", "minTargetSdk":"9.0"},
  {"name":"Smaato","status":false,"pod":"AMRAdapterSmaato","version":"21.6", "minTargetSdk":"9.0"},
  {"name":"SmartAd","status":false,"pod":"AMRAdapterSmartadserver","version":"7.8", "minTargetSdk":"9.0"},
  {"name":"StartApp","status":false,"pod":"AMRAdapterStartapp","version":"4.6", "minTargetSdk":"8.0"},
  {"name":"Tapjoy","status":false,"pod":"AMRAdapterTapjoy","version":"12.8", "minTargetSdk":"8.0"},
  {"name":"Tappx","status":false,"pod":"AMRAdapterTappx","version":"4.0", "minTargetSdk":"9.0"},
  {"name":"TapResearch","status":false,"pod":"AMRAdapterTapresearch","version":"2.0", "minTargetSdk":"8.0"},
  {"name":"TikTok","status":false,"pod":"AMRAdapterTiktok","version":"3.4", "minTargetSdk":"9.0"},
  {"name":"UnityAds","status":false,"pod":"AMRAdapterUnity","version":"3.6", "minTargetSdk":"9.0"},
  {"name":"Verizon","status":false,"pod":"AMRAdapterVerizon","version":"1.9", "minTargetSdk":"10.0"},
  {"name":"Vungle","status":false,"pod":"AMRAdapterVungle","version":"6.9", "minTargetSdk":"9.0"},
  {"name":"YandexAds","status":false,"pod":"AMRAdapterYandex","version":"3.4", "minTargetSdk":"8.0"},
  {"name":"YouAppi","status":false,"pod":"AMRAdapterYouappi","version":"5.0", "minTargetSdk":"9.0"}]}`);
}

function getIos14Keys() {
  return JSON.parse(`
  [
    {"name":"AdColony","skAdNetwork": ["4pfyvq9l8r.skadnetwork","yclnxrl5pm.skadnetwork","v72qych5uu.skadnetwork","tl55sbb4fm.skadnetwork","t38b2kh725.skadnetwork","prcb7njmu6.skadnetwork","ppxm28t8ap.skadnetwork","mlmmfzh3r3.skadnetwork","klf5c3l5u5.skadnetwork","hs6bdukanm.skadnetwork","c6k4g5qg8m.skadnetwork","9t245vhmpl.skadnetwork","9rd848q2bz.skadnetwork","8s468mfl3y.skadnetwork","7ug5zh24hu.skadnetwork","4fzdc2evr5.skadnetwork","4468km3ulz.skadnetwork","3rd42ekr43.skadnetwork","2u9pt9hc89.skadnetwork","m8dbw4sv7c.skadnetwork","7rz58n8ntl.skadnetwork","ejvt5qm6ak.skadnetwork","5lm9lj6jb7.skadnetwork","44jx6755aq.skadnetwork", "mtkv5xtk9e.skadnetwork"]},
    {"name":"AdMob","skAdNetwork": ["cstr6suwn9.skadnetwork"]},
    {"name":"A4G","skAdNetwork": ["cstr6suwn9.skadnetwork"]},
    {"name":"Adtiming","skAdNetwork": ["488r3q3dtq.skadnetwork"]},
    {"name":"AppLovin","skAdNetwork": ["2u9pt9hc89.skadnetwork","4468km3ulz.skadnetwork","4fzdc2evr5.skadnetwork","7ug5zh24hu.skadnetwork","8s468mfl3y.skadnetwork","9rd848q2bz.skadnetwork","9t245vhmpl.skadnetwork","av6w8kgt66.skadnetwork","f38h382jlk.skadnetwork","hs6bdukanm.skadnetwork","kbd757ywx3.skadnetwork","ludvb6z3bs.skadnetwork","m8dbw4sv7c.skadnetwork","mlmmfzh3r3.skadnetwork","prcb7njmu6.skadnetwork","t38b2kh725.skadnetwork","tl55sbb4fm.skadnetwork","wzmmz9fp6w.skadnetwork","yclnxrl5pm.skadnetwork","ydx93a7ass.skadnetwork"]},
    {"name":"Chartboost","skAdNetwork": ["f38h382jlk.skadnetwork"]},
    {"name":"Criteo","skAdNetwork": ["hs6bdukanm.skadnetwork"]},
    {"name":"Facebook","skAdNetwork": ["v9wttpbfk9.skadnetwork", "n38lu8286q.skadnetwork"]},
    {"name":"HyprMx","skAdNetwork": ["nu4557a4je.skadnetwork"]},
    {"name":"InMobi","skAdNetwork": ["uw77j35x4d.skadnetwork", "7ug5zh24hu.skadnetwork", "hs6bdukanm.skadnetwork", "4fzdc2evr5.skadnetwork", "ggvn48r87g.skadnetwork", "5lm9lj6jb7.skadnetwork", "9rd848q2bz.skadnetwork", "c6k4g5qg8m.skadnetwork", "wzmmz9fp6w.skadnetwork", "3sh42y64q3.skadnetwork", "yclnxrl5pm.skadnetwork", "kbd757ywx3.skadnetwork", "f73kdq92p3.skadnetwork", "ydx93a7ass.skadnetwork", "w9q455wk68.skadnetwork", "prcb7njmu6.skadnetwork", "wg4vff78zm.skadnetwork", "mlmmfzh3r3.skadnetwork", "tl55sbb4fm.skadnetwork", "4pfyvq9l8r.skadnetwork", "t38b2kh725.skadnetwork", "5l3tpt7t6e.skadnetwork", "7rz58n8ntl.skadnetwork", "klf5c3l5u5.skadnetwork", "cg4yq2srnc.skadnetwork", "av6w8kgt66.skadnetwork", "9t245vhmpl.skadnetwork", "v72qych5uu.skadnetwork", "2u9pt9hc89.skadnetwork", "44jx6755aq.skadnetwork", "8s468mfl3y.skadnetwork", "p78axxw29g.skadnetwork", "ppxm28t8ap.skadnetwork", "424m5254lk.skadnetwork" ]},
    {"name":"IronSource","skAdNetwork": ["su67r6k2v3.skadnetwork"]},
    {"name":"Mintegral","skAdNetwork": ["kbd757ywx3.skadnetwork"]},
    {"name":"Pubnative","skAdNetwork": ["tl55sbb4fm.skadnetwork", "6xzpu9s2p8.skadnetwork"]},
    {"name":"StartApp","skAdNetwork": ["5l3tpt7t6e.skadnetwork", "mlmmfzh3r3.skadnetwork", "hs6bdukanm.skadnetwork", "t38b2kh725.skadnetwork", "5lm9lj6jb7.skadnetwork", "v72qych5uu.skadnetwork"]},
    {"name":"Tapjoy","skAdNetwork": ["ecpz2srf59.skadnetwork", "ecpz2srf59.skadnetwork","7ug5zh24hu.skadnetwork","9t245vhmpl.skadnetwork","prcb7njmu6.skadnetwork","5lm9lj6jb7.skadnetwork","578prtvx9j.skadnetwork","22mmun2rn5.skadnetwork","uw77j35x4d.skadnetwork","c6k4g5qg8m.skadnetwork","hs6bdukanm.skadnetwork","yclnxrl5pm.skadnetwork","3sh42y64q3.skadnetwork","cj5566h2ga.skadnetwork","klf5c3l5u5.skadnetwork","8s468mfl3y.skadnetwork","2u9pt9hc89.skadnetwork","7rz58n8ntl.skadnetwork","ppxm28t8ap.skadnetwork","5tjdwbrq8w.skadnetwork","238da6jt44.skadnetwork","24t9a8vw3c.skadnetwork","252b5q8x7y.skadnetwork","3qy4746246.skadnetwork","3rd42ekr43.skadnetwork","424m5254lk.skadnetwork","4468km3ulz.skadnetwork","44jx6755aq.skadnetwork","44n7hlldy6.skadnetwork","488r3q3dtq.skadnetwork","4fzdc2evr5.skadnetwork","4pfyvq9l8r.skadnetwork","523jb4fst2.skadnetwork","52fl2v3hgk.skadnetwork","5a6flpkh64.skadnetwork","5l3tpt7t6e.skadnetwork","737z793b9f.skadnetwork","97r2b46745.skadnetwork","9rd848q2bz.skadnetwork","9yg77x724h.skadnetwork","av6w8kgt66.skadnetwork","cg4yq2srnc.skadnetwork","cstr6suwn9.skadnetwork","dzg6xy7pwj.skadnetwork","ejvt5qm6ak.skadnetwork","f73kdq92p3.skadnetwork","g28c52eehv.skadnetwork","ggvn48r87g.skadnetwork","glqzh8vgby.skadnetwork","gvmwg8q7h5.skadnetwork","hdw39hrw9y.skadnetwork","kbd757ywx3.skadnetwork","lr83yxwka7.skadnetwork","m8dbw4sv7c.skadnetwork","mlmmfzh3r3.skadnetwork","mls7yz5dvl.skadnetwork","mtkv5xtk9e.skadnetwork","n66cz3y3bx.skadnetwork","n9x2a789qt.skadnetwork","nzq8sh4pbs.skadnetwork","p78axxw29g.skadnetwork","pu4na253f3.skadnetwork","s39g8k73mm.skadnetwork","t38b2kh725.skadnetwork","tl55sbb4fm.skadnetwork","u679fj5vs4.skadnetwork","v72qych5uu.skadnetwork","v79kvwwj4g.skadnetwork","w9q455wk68.skadnetwork","wg4vff78zm.skadnetwork","wzmmz9fp6w.skadnetwork","xy9t38ct57.skadnetwork","y45688jllp.skadnetwork","ydx93a7ass.skadnetwork","yrqqpx2mcb.skadnetwork","z4gj7hsk7h.skadnetwork","zmvfpc5aq8.skadnetwork"]},    {"name":"TikTok","skAdNetwork": ["238da6jt44.skadnetwork", "22mmun2rn5.skadnetwork"]},
    {"name":"UnityAds","skAdNetwork": ["s39g8k73mm.skadnetwork","g28c52eehv.skadnetwork","3qy4746246.skadnetwork","f73kdq92p3.skadnetwork", "lr83yxwka7.skadnetwork", "cstr6suwn9.skadnetwork", "bvpn9ufa9b.skadnetwork", "c6k4g5qg8m.skadnetwork", "f38h382jlk.skadnetwork", "3sh42y64q3.skadnetwork", "av6w8kgt66.skadnetwork", "t38b2kh725.skadnetwork", "5lm9lj6jb7.skadnetwork", "4468km3ulz.skadnetwork", "44n7hlldy6.skadnetwork", "578prtvx9j.skadnetwork", "tl55sbb4fm.skadnetwork", "prcb7njmu6.skadnetwork", "4fzdc2evr5.skadnetwork", "m8dbw4sv7c.skadnetwork", "v79kvwwj4g.skadnetwork", "mlmmfzh3r3.skadnetwork", "488r3q3dtq.skadnetwork", "zmvfpc5aq8.skadnetwork", "wzmmz9fp6w.skadnetwork", "ydx93a7ass.skadnetwork", "44jx6755aq.skadnetwork", "424m5254lk.skadnetwork", "ppxm28t8ap.skadnetwork", "238da6jt44.skadnetwork", "glqzh8vgby.skadnetwork", "yclnxrl5pm.skadnetwork", "hs6bdukanm.skadnetwork", "9rd848q2bz.skadnetwork", "2u9pt9hc89.skadnetwork", "v72qych5uu.skadnetwork", "24t9a8vw3c.skadnetwork", "4dzt52r2t5.skadnetwork", "7ug5zh24hu.skadnetwork", "9t245vhmpl.skadnetwork", "3rd42ekr43.skadnetwork", "wg4vff78zm.skadnetwork", "8s468mfl3y.skadnetwork", "kbd757ywx3.skadnetwork", "22mmun2rn5.skadnetwork", "4pfyvq9l8r.skadnetwork", "5a6flpkh64.skadnetwork"]},
    {"name":"Verizon","skAdNetwork": ["e5fvkxwrpn.skadnetwork"]},
    {"name":"Vungle","skAdNetwork": ["gta9lk7p23.skadnetwork", "ydx93a7ass.skadnetwork", "4fzdc2evr5.skadnetwork", "4pfyvq9l8r.skadnetwork", "v72qych5uu.skadnetwork", "mlmmfzh3r3.skadnetwork", "c6k4g5qg8m.skadnetwork", "yclnxrl5pm.skadnetwork", "5lm9lj6jb7.skadnetwork", "n9x2a789qt.skadnetwork", "tl55sbb4fm.skadnetwork", "2u9pt9hc89.skadnetwork", "8s468mfl3y.skadnetwork", "glqzh8vgby.skadnetwork", "22mmun2rn5.skadnetwork", "3rd42ekr43.skadnetwork"]}
    ]
    `);
}
