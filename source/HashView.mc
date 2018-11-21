using Toybox.WatchUi as Ui;
using Toybox.Position as Position;
using Toybox.Graphics as Gfx;

class HashView extends Ui.View {

	var text;
	var http;
	var locationStore;
	var analytics;

	function initialize() {
		View.initialize();
		http = new Http();
		locationStore = new LocationStore();
		analytics = new Analytics();
	}

  function callback(responseCode, data){
		if (responseCode == 200) {
			var lat = data["geo"]["lat"];
			var long = data["geo"]["long"];
			var name = data["name"];
			var location = new Position.Location({:latitude => lat, :longitude => long, :format => :degrees});
			text = "Location\n" + name + "\nadded.";
			try {
				locationStore.save(location, {:name => name});
			} catch (ex) {
				System.println(ex.getErrorMessage());
				text = "No wypt API";
			}
		} else {
			text = "Comms error or \nwrong hash";
		}
  	WatchUi.requestUpdate();
  }

  function onShow() {
		analytics.screen("HashView");
		var url = "https://garmin-waypoints.herokuapp.com/locations/" + hash;
		try {
			http.get(url, method(:callback));
		} catch (ex) {
			System.println(ex.getErrorMessage());
			text = "No comms";
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
