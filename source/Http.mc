using Toybox.Communications as Comms;

class Http {

  function _req(url, params, options, callback) {
    if (Comms has :makeWebRequest ) {
			Comms.makeWebRequest(url, params, options, callback);
		} else {
      System.println("No Communication API");
      throw new Toybox.Lang.Exception();
    }
  }

  function get(url, callback) {

    var options = {
			:method => Comms.HTTP_REQUEST_METHOD_GET,
			:responseType => Comms.HTTP_RESPONSE_CONTENT_TYPE_JSON
		};

    _req(url, null, options, callback);
  }

  function post(url, body, callback) {

    var options = {
			:method => Comms.HTTP_REQUEST_METHOD_POST,
      :responseType => Comms.HTTP_RESPONSE_CONTENT_TYPE_TEXT_PLAIN
		};

    _req(url, body, options, callback);
  }
}