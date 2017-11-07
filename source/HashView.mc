using Toybox.WatchUi as Ui;
using Toybox.Communications as Comms;
using Toybox.Position as Position;
using Toybox.PersistedLocations as PersistedLocations;
using Toybox.Graphics as Gfx;

class HashView extends Ui.View {

	var text;

	function initialize() {
		View.initialize();
	}

  function callback(responseCode, data){
		if (responseCode == 200) {
			var lat = data["geo"]["lat"];
			var long = data["geo"]["long"];
			var name = data["name"];
			var location = new Position.Location({:latitude => lat, :longitude => long, :format => :degrees});
			text = "Location\n" + name + "\nadded.";
			PersistedLocations.persistLocation(location, {:name => name});
		} else {
			text = "Comms error or \nwrong hash";
		}
  	WatchUi.requestUpdate();
  }

  function onShow() {
		var url = "https://garmin-waypoints.herokuapp.com/locations/" + hash;
		var options = {
			:method => Communications.HTTP_REQUEST_METHOD_GET,
			:headers => {
			       "Content-Type" => Communications.REQUEST_CONTENT_TYPE_JSON},
			:responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON
		};

		try {
			Comms.makeWebRequest(url, null, options, method(:callback));
		} catch (ex) {
			System.println( "Error" );
			System.println(ex);
		}
  }

  function onUpdate(dc) {
		dc.setColor( Gfx.COLOR_BLACK, Gfx.COLOR_BLACK );
    dc.clear();
    dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
    if (text != null) {
    	dc.drawText(dc.getWidth()/2, dc.getHeight()*0.3, Gfx.FONT_SMALL, text, Gfx.TEXT_JUSTIFY_CENTER);
    }
  }
}

class HashDelegate extends Ui.InputDelegate {

	function initialize() {
		InputDelegate.initialize();
	}

	function onKey(event){
		System.exit();
    return true;
	}
}
