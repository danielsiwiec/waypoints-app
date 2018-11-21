using Toybox.Communications;

class Analytics {
  
  var http;
  var url = "https://www.google-analytics.com/collect";
  var device;

  function initialize() {
    http = new Http();
    device = System.getDeviceSettings();
  }

  function bodyBuilder(page) {
    var body = {
      "v" => "1",
      "t" => "screenview",
      "tid" => "UA-77110226-1",
      "cid" => device.uniqueIdentifier,
      "an" => "sendpoints",
      "av" => "1.1.8",
      "cd" => page
    };

    return body;
  }

  function page(name) {
    http.post(url, bodyBuilder(page), method(:empty));
  }

  function empty(responseCode, data) {
  }
}