var obj;
var obj14;
var htmlString = "";
var htmlPodFile = "";
var arrayAppGradlePackages = [];

function amrInitPage() {
    response = httpGet("https://admost.github.io/amrios/networks.json");
    obj = getNetworks(response);
    fillAdNetworkList(obj);
    fillNetworkFeatures(obj);
    htmlPodFile = "source \'https:\/\/github.com\/CocoaPods\/Specs.git\'\r\nplatform :ios, \'9.0\'\r\n\r\nuse_frameworks!\r\n\r\ntarget \'MyAwesomeTarget\' do\r\n#core SDK\r\npod \'AMRSDK\', \'~&gt; 1.2\'\r\n#mediation adapters\n";
    fillPodFileCode();
  }

function amrInitManuelPage() {
  response = httpGet("https://admost.github.io/amrios/networks.json");
  obj = getNetworks(response);
  fillManuelNetworkFeatures(obj);
}
   
function getNetworks(obj){
    return JSON.parse(obj);
}

function toggleAdNetworkStatus(adNetworkName) {
    var i = getPositionOfAdNetworkOnJSONArray(adNetworkName);
    if (obj.adNetworks[i].status == true) {
        removeAdNetworkToPodFile(i);
    } else {
        addAdNetworkToPodFile(i);
    }
}

function addAdNetworkToPodFile(i) {
    obj.adNetworks[i].status = true;
    fillAdNetworkList(obj);
    fillPodFileCode();
    fillIos14FileCode();
}

function removeAdNetworkToPodFile(i) {
    obj.adNetworks[i].status = false;
    fillAdNetworkList(obj);
    fillPodFileCode();
    fillIos14FileCode();
}

function getPositionOfAdNetworkOnJSONArray(adNetworkName) {
    for (var i = 0; i < obj.adNetworks.length; i++) {
        if (obj.adNetworks[i].displayName === adNetworkName) {
            return i;
        }
    }
    return null;
}

function fillAdNetworkList() {
    htmlString = '<div class="btn-group" style="margin:8px;" id="btn-group-network-AMR"> <button type="button" id="btn-name-network-AMR" class="btn btn-success">AMR</button>  </div>&nbsp;';
    for (var i = 1; i < obj.adNetworks.length; i++) {
        if (obj.adNetworks[i].iosSupport == false) {
            continue;
        }
        htmlString = htmlString + '<div class="btn-group" style="margin:8px; id="btn-group-network-' + obj.adNetworks[i].displayName + '"> <button type="button" id="btn-name-network-' + obj.adNetworks[i].displayName + '" class="btn btn-default">' + obj.adNetworks[i].displayName + '</button> <button type="button" id="btn-icon-network-' + obj.adNetworks[i].displayName + '" onclick="toggleAdNetworkStatus(\'' + obj.adNetworks[i].displayName + '\');" class="btn btn-';

        obj.adNetworks[i].status ? htmlString = htmlString + "danger" : htmlString = htmlString + "success";
        htmlString = htmlString + ' dropdown-toggle"> <span class="fa fa-';

        obj.adNetworks[i].status ? htmlString = htmlString + "minus" : htmlString = htmlString + "plus";
        htmlString = htmlString + '"></span> </button> </div>'
    }
    $("#adnetwork-button-list").html(htmlString);
}

function fillNetworkFeatures() {
    htmlString = '<table class=" table table-bordered table-striped">';
    htmlString = htmlString + '<thead><tr>';
    htmlString = htmlString + '<th rowspan="2" class="text-center">Ad Network<br></br></th>';
    htmlString = htmlString + '<th rowspan="2" class="text-center">SDK Version<br></br></th>';
    htmlString = htmlString + '<th rowspan="2" class="text-center">Adapter Version<br></br></th>';
    htmlString = htmlString + '<th rowspan="2" class="text-center">Header Bidding<br></br></th>';
    htmlString = htmlString + '<th rowspan="2" class="text-center">Changelog<br></br></th>';
    htmlString = htmlString + '<th colspan="6" class="text-center">Supported Ad Types<tr><td>Banner</td><td>Interstitial</td><td>Rewarded</td><td>Offerwall</td><td>Open Ads</td><td>Rewarded Interstitial</td></tr></th>';
    htmlString = htmlString + '</tr></thead>';

    for (var i = 1; i < obj.adNetworks.length; i++) {

        biddingSupport = ""
        if (obj.adNetworks[i].biddingSupport == true) {
            biddingSupport = "✓"
        }

        changelog = "";
        if (obj.adNetworks[i].changelog != "") {
            changelog = obj.adNetworks[i].changelog.replace(obj.adNetworks[i].changelog, "<a href=" + obj.adNetworks[i].changelog + " target='_blank'>Changelog</a>");
        }
        
        var supportedAdTypes = [
            isSupportedAdTypes("Banner", i),
            isSupportedAdTypes("Interstitial", i),
            isSupportedAdTypes("Rewarded", i),
            isSupportedAdTypes("Offerwall", i),
            isSupportedAdTypes("OpenAds", i),
            isSupportedAdTypes("RewardedInterstitial", i)
            ];

        htmlString = htmlString + '<tr>'
            htmlString = htmlString + '<td>'+obj.adNetworks[i].displayName+'</td>'
            htmlString = htmlString + '<td>'+obj.adNetworks[i].SDKVersion+'</td>'
            htmlString = htmlString + '<td>'+obj.adNetworks[i].adapterVersion+'</td>'
            htmlString = htmlString + '<td class="text-center">'+biddingSupport+'</td>'
            htmlString = htmlString + '<td class="text-center">'+changelog+'</td>'
            htmlString = htmlString + '<td class="text-center">'+supportedAdTypes[0]+'</td>'
            htmlString = htmlString + '<td class="text-center">'+supportedAdTypes[1]+'</td>'
            htmlString = htmlString + '<td class="text-center">'+supportedAdTypes[2]+'</td>'
            htmlString = htmlString + '<td class="text-center">'+supportedAdTypes[3]+'</td>'
            htmlString = htmlString + '<td class="text-center">'+supportedAdTypes[4]+'</td>'
            htmlString = htmlString + '<td class="text-center">'+supportedAdTypes[5]+'</td>'
        htmlString = htmlString + '</tr>'

    }
    htmlString = htmlString + '</table>';
    $("#adnetwork-feature-list").html(htmlString);
}

function fillManuelNetworkFeatures() {
    htmlString = '<table class=" table table-bordered table-striped">';
    htmlString = htmlString + '<thead><tr>';
    htmlString = htmlString + '<th rowspan="2" class="text-center">Ad Network<br></br></th>';
    htmlString = htmlString + '<th rowspan="2" class="text-center">SDK<br></br></th>';
    htmlString = htmlString + '<th rowspan="2" class="text-center">Adapter<br></br></th>';
    htmlString = htmlString + '<th rowspan="2" class="text-center">Header Bidding<br></br></th>';
    htmlString = htmlString + '<th colspan="6" class="text-center">Supported Ad Types<tr><td>Banner</td><td>Interstitial</td><td>Rewarded</td><td>Offerwall</td><td>Open Ads</td><td>Rewarded Interstitial</td></tr></th>';
    htmlString = htmlString + '</tr></thead>';

    for (var i = 1; i < obj.adNetworks.length; i++) {

        biddingSupport = ""
        if (obj.adNetworks[i].biddingSupport == true) {
            biddingSupport = "✓"
        }

        networkChangelog = "";
        if (obj.adNetworks[i].networkChangelog != "") {
            networkChangelog = obj.adNetworks[i].networkChangelog.replace(obj.adNetworks[i].networkChangelog, "<a href=" + obj.adNetworks[i].networkChangelog + " target='_blank'>Changelog</a>");
        }
        
        var supportedAdTypes = [
            isSupportedAdTypes("Banner", i),
            isSupportedAdTypes("Interstitial", i),
            isSupportedAdTypes("Rewarded", i),
            isSupportedAdTypes("Offerwall", i),
            isSupportedAdTypes("OpenAds", i),
            isSupportedAdTypes("RewardedInterstitial", i)
            ];

        htmlString = htmlString + '<tr>'
            htmlString = htmlString + '<td>'+obj.adNetworks[i].displayName+'</td>'
            htmlString = htmlString + '<td><a href="'+ obj.adNetworks[i].networkSourceURL +'" target="_blank">'+obj.adNetworks[i].SDKVersion+'</a></td>'
            htmlString = htmlString + '<td><a href="'+ obj.adNetworks[i].sourceURL +'" target="_blank">'+obj.adNetworks[i].adapterVersion+'</a></td>'
            htmlString = htmlString + '<td class="text-center">'+biddingSupport+'</td>'
            htmlString = htmlString + '<td class="text-center">'+supportedAdTypes[0]+'</td>'
            htmlString = htmlString + '<td class="text-center">'+supportedAdTypes[1]+'</td>'
            htmlString = htmlString + '<td class="text-center">'+supportedAdTypes[2]+'</td>'
            htmlString = htmlString + '<td class="text-center">'+supportedAdTypes[3]+'</td>'
            htmlString = htmlString + '<td class="text-center">'+supportedAdTypes[4]+'</td>'
            htmlString = htmlString + '<td class="text-center">'+supportedAdTypes[5]+'</td>'
        htmlString = htmlString + '</tr>'

    }
    htmlString = htmlString + '</table>';
    $("#adnetwork-manual-list").html(htmlString);
}

function isSupportedAdTypes(type, index) {
    if (obj.adNetworks[index].supportedAdTypes.includes(type)) {
        return "✓"
    } else {
        return ""
    }
}

function fillPodFileCode() {
    $('#file-pod').html("source \'https:\/\/github.com\/CocoaPods\/Specs.git\'\r\nplatform :ios, \'8.0\'\r\n\r\nuse_frameworks!\r\n\r\ntarget \'MyAwesomeTarget\' do\r\n#core SDK\r\npod \'"+obj.adNetworks[0].adapterName+"\', \'~&gt; "+ obj.adNetworks[0].podVersion+"\'\r\n#mediation adapters\n");

    for (var i = 1; i < obj.adNetworks.length; i++) {
        if (obj.adNetworks[i].adapterName && obj.adNetworks[i].status == true && document.getElementById("file-pod").innerHTML.indexOf(obj.adNetworks[i].adapterName) == -1) {
          $('#file-pod').append("pod \'"+ obj.adNetworks[i].adapterName+"\', \'~&gt; "+obj.adNetworks[i].podVersion +"\'\r\n");
        }
    }

    $('#file-pod').append("\nend");
}

function fillIos14FileCode(){
    var finalValues = [];
    var selectedNetworks = [];

    //$('#file-ios-14').text("<key>SKAdNetworkItems</key>");    
    for (var i = 1; i < obj.adNetworks.length; i++) {
        if(obj.adNetworks[i].status == true){
            selectedNetworks.push(obj.adNetworks[i]);
            for(var j = 0; j<obj.adNetworks[i].skadnetworkIDS.length; j++){
                if(!includesUpper(finalValues,obj.adNetworks[i].skadnetworkIDS[j])){//if(!finalValues.includes(obj14[j].skAdNetwork[k])){
                    finalValues.push(obj.adNetworks[i].skadnetworkIDS[j]);
                }
            }          
        }
    }

    if (selectedNetworks.length == 0) {
        $('#file-ios-14').text("PLEASE SELECT ONE OR MORE NETWORKS TO CREATE YOUR SKADNETWORK LIST.");    
    } else {
        var finalXMLStr =  "<key>SKAdNetworkItems</key>\n<array>\n"//"<key>SKAdNetworkItems</key><array>";

        for(var i=0 ; i<finalValues.length ; i++){
            finalXMLStr+="\t<dict>\n\t\t<key>SKAdNetworkIdentifier</key>\n\t\t<string>"+ finalValues[i] + "</string>\n\t</dict>\n";
        }
    
        finalXMLStr+="</array>\n"
    
        $('#file-ios-14').text(finalXMLStr); 
    }  
}

function includesUpper(arr,item)
{
    for(var i=0;i<arr.length;i++){
        if(arr[i].toUpperCase() == item.toUpperCase()) return true;
    }
    return false;
}

function httpGet(theUrl)
{
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", theUrl, false ); // false for synchronous request
    xmlHttp.send( null );
    return xmlHttp.responseText;
}