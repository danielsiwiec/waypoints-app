using Toybox.Communications;

class Analytics {
  
  var http;
  var url = "https://www.google-analytics.com/collect";
  var device;
  var analyticsOn = true;

  function initialize() {
    http = new Http();
    device = System.getDeviceSettings();
  }

  function bodyBuilder(screenName) {
    var body = {
      "v" => "1",
      "t" => "screenview",
      "tid" => "UA-77110226-1",
      "cid" => device.uniqueIdentifier,
      "an" => "sendpoints",
      "av" => "1.1.9",
      "cd" => screenName
    };

    return body;
  }

  function screen(screenName) {
    if (analyticsOn) {
      http.post(url, bodyBuilder(screenName), method(:empty));
    }
  }

  function empty(responseCode, data) {
  }
}