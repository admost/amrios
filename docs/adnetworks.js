var obj = JSON.parse(`
{"ad_networks":
[{"name":"AMR","status":true,"pod":"AMRSDK","version":"1.4", minTargetSdk="8.0"},
{"name":"AdColony","status":false,"pod":"AMRAdapterAdcolony","version":"3.3", minTargetSdk="8.0"},
{"name":"AdMob","status":false,"pod":"AMRAdapterAdmob","version":"7.47", minTargetSdk="8.0"},
{"name":"Admost","status":false,"pod":"AMRAdapterAdmost","version":"1.2", minTargetSdk="8.0"},
{"name":"Adtiming","status":false,"pod":"AMRAdapterAdtiming","version":"3.6", minTargetSdk="8.0"},
{"name":"Amazon","status":false,"pod":"AMRAdapterAmazon","version":"2.2", minTargetSdk="8.0"},
{"name":"AppLovin","status":false,"pod":"AMRAdapterApplovin","version":"6.8", minTargetSdk="9.0"},
{"name":"Appnext","status":false,"pod":"AMRAdapterAppnext","version":"1.9", minTargetSdk="8.0"},
{"name":"Appsamurai","status":false,"pod":"AMRAdapterAppsamurai","version":"1.4", minTargetSdk="8.0"},
{"name":"Chartboost","status":false,"pod":"AMRAdapterChartboost","version":"7.5", minTargetSdk="8.0"},
{"name":"DFP","status":false,"pod":"AMRAdapterDFP","version":"7.47", minTargetSdk="8.0"},
{"name":"Facebook","status":false,"pod":"AMRAdapterFacebook","version":"5.4", minTargetSdk="9.0"},
{"name":"Fyber","status":false,"pod":"AMRAdapterFyber","version":"8.22", minTargetSdk="8.0"},
{"name":"InMobi","status":false,"pod":"AMRAdapterInmobi","version":"7.3", minTargetSdk="9.0"},
{"name":"Inneractive","status":false,"pod":"AMRAdapterInneractive","version":"7.3", minTargetSdk="8.0"},
{"name":"IronSource","status":false,"pod":"AMRAdapterIronsource","version":"6.8", minTargetSdk="8.0"},
{"name":"Mintegral","status":false,"pod":"AMRAdapterMintegral","version":"5.5", minTargetSdk="8.0"},
{"name":"Mobfox","status":false,"pod":"AMRAdapterMobfox","version":"3.6", minTargetSdk="9.0"},
{"name":"Mopub","status":false,"pod":"AMRAdapterMopub","version":"5.7", minTargetSdk="9.0"},
{"name":"MyTarget","status":false,"pod":"AMRAdapterMytarget","version":"5.3", minTargetSdk="8.0"},
{"name":"Nexage(AOL)","status":false,"pod":"AMRAdapterNexage","version":"6.8", minTargetSdk="8.0"},
{"name":"Pollfish","status":false,"pod":"AMRAdapterPollfish","version":"5.0", minTargetSdk="8.0"},
{"name":"Smaato","status":false,"pod":"AMRAdapterSmaato","version":"10.2", minTargetSdk="8.0"},
{"name":"StartApp","status":false,"pod":"AMRAdapterStartapp","version":"3.11", minTargetSdk="8.0"},
{"name":"Tapjoy","status":false,"pod":"AMRAdapterTapjoy","version":"12.3", minTargetSdk="8.0"},
{"name":"TapResearch","status":false,"pod":"AMRAdapterTapresearch","version":"2.0", minTargetSdk="8.0"},
{"name":"UnityAds","status":false,"pod":"AMRAdapterUnity","version":"3.2", minTargetSdk="8.0"},
{"name":"Vungle","status":false,"pod":"AMRAdapterVungle","version":"6.3", minTargetSdk="8.0"},
{"name":"YandexAds","status":false,"pod":"AMRAdapterYandex","version":"2.13", minTargetSdk="8.0"},
{"name":"YouAppi","status":false,"pod":"AMRAdapterYouappi","version":"4.4", minTargetSdk="9.0"}]}`
);

var htmlString = "";

var arrayAppGradlePackages = [];


fillAdNetworkList(obj);

var htmlPodFile = "source \'https:\/\/github.com\/CocoaPods\/Specs.git\'\r\nplatform :ios, \'8.0\'\r\n\r\nuse_frameworks!\r\n\r\ntarget \'MyAwesomeTarget\' do\r\n#core SDK\r\npod \'AMRSDK\', \'~&gt; 1.2\'\r\n#mediation adapters\n";

fillPodFileCode();


function toggleAdNetworkStatus(adNetworkName) {
    var i = getPositionOfAdNetworkOnJSONArray(adNetworkName);
    if (obj.ad_networks[i].status == true) {
        removeAdNetworkToPodFile(i);
    } else {
        addAdNetworkToPodFile(i);
    }
}

function addAdNetworkToPodFile(i) {
    obj.ad_networks[i].status = true;
    fillAdNetworkList(obj);
    fillPodFileCode();
}

function removeAdNetworkToPodFile(i) {
    obj.ad_networks[i].status = false;
    fillAdNetworkList(obj);
    fillPodFileCode();
}

function getPositionOfAdNetworkOnJSONArray(adNetworkName) {
    for (var i = 0; i < obj.ad_networks.length; i++) {
        if (obj.ad_networks[i].name === adNetworkName) {
            return i;
        }
    }
    return null;
}

function fillAdNetworkList() {
    htmlString = '<div class="btn-group" style="margin:8px;" id="btn-group-network-AMR"> <button type="button" id="btn-name-network-AMR" class="btn btn-success">AMR</button>  </div>&nbsp;';
    for (var i = 1; i < obj.ad_networks.length; i++) {
        htmlString = htmlString + '<div class="btn-group" style="margin:8px; id="btn-group-network-' + obj.ad_networks[i].name + '"> <button type="button" id="btn-name-network-' + obj.ad_networks[i].name + '" class="btn btn-default">' + obj.ad_networks[i].name + '</button> <button type="button" id="btn-icon-network-' + obj.ad_networks[i].name + '" onclick="toggleAdNetworkStatus(\'' + obj.ad_networks[i].name + '\');" class="btn btn-';

        obj.ad_networks[i].status ? htmlString = htmlString + "danger" : htmlString = htmlString + "success";
        htmlString = htmlString + ' dropdown-toggle"> <span class="fa fa-';

        obj.ad_networks[i].status ? htmlString = htmlString + "minus" : htmlString = htmlString + "plus";
        htmlString = htmlString + '"></span> </button> </div>'
    }
    $("#adnetwork-button-list").html(htmlString);
}


function fillPodFileCode() {

    $('#file-pod').html("source \'https:\/\/github.com\/CocoaPods\/Specs.git\'\r\nplatform :ios, \'8.0\'\r\n\r\nuse_frameworks!\r\n\r\ntarget \'MyAwesomeTarget\' do\r\n#core SDK\r\npod \'"+obj.ad_networks[0].pod+"\', \'~&gt; "+ obj.ad_networks[0].version+"\'\r\n#mediation adapters\n");

    for (var i = 1; i < obj.ad_networks.length; i++) {
        if (obj.ad_networks[i].pod && obj.ad_networks[i].status == true) {
                $('#file-pod').append("pod \'"+ obj.ad_networks[i].pod+"\', \'~&gt; "+obj.ad_networks[i].version +"\'\r\n");
        }
    }

    $('#file-pod').append("\nend");

}
