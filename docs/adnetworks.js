var obj;
var obj14;
var htmlString = "";
var htmlPodFile = "";
var arrayAppGradlePackages = [];

function amrInitPage() {
  //obj = adNetworkJson;
  //obj14 = ios14json;
  response = httpGet("https://admost.github.io/amrios/adnetwork.json");
  obj = getNetworks(response);
  fillAdNetworkList(obj);
  htmlPodFile = "source \'https:\/\/github.com\/CocoaPods\/Specs.git\'\r\nplatform :ios, \'9.0\'\r\n\r\nuse_frameworks!\r\n\r\ntarget \'MyAwesomeTarget\' do\r\n#core SDK\r\npod \'AMRSDK\', \'~&gt; 1.2\'\r\n#mediation adapters\n";
  fillPodFileCode();
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
        htmlString = htmlString + '<div class="btn-group" style="margin:8px; id="btn-group-network-' + obj.adNetworks[i].displayName + '"> <button type="button" id="btn-name-network-' + obj.adNetworks[i].displayName + '" class="btn btn-default">' + obj.adNetworks[i].displayName + '</button> <button type="button" id="btn-icon-network-' + obj.adNetworks[i].displayName + '" onclick="toggleAdNetworkStatus(\'' + obj.adNetworks[i].displayName + '\');" class="btn btn-';

        obj.adNetworks[i].status ? htmlString = htmlString + "danger" : htmlString = htmlString + "success";
        htmlString = htmlString + ' dropdown-toggle"> <span class="fa fa-';

        obj.adNetworks[i].status ? htmlString = htmlString + "minus" : htmlString = htmlString + "plus";
        htmlString = htmlString + '"></span> </button> </div>'
    }
    $("#adnetwork-button-list").html(htmlString);
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