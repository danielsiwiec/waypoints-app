using Toybox.WatchUi as Ui;
using Toybox.Communications as Comms;
using Toybox.Position as Position;
using Toybox.PersistedLocations as PersistedLocations;
using Toybox.Graphics as Gfx;

class WaypointsView extends Ui.View {

	var text;

    function initialize() {
        View.initialize();
    }

    //! Load your resources here
    function onLayout(dc) {
    }
    
    function callback(responseCode, data){
    	System.println("DATA: " + data);
    	var lat = data["geo"]["lat"];
    	var long = data["geo"]["long"];
    	var name = data["name"];
    	var location = new Position.Location({:latitude => lat, :longitude => long, :format => :degrees});
    	text = "Location\n" + name + "\nadded.";
    	PersistedLocations.persistLocation(location, {:name => name});
    	WatchUi.requestUpdate();
    }

    //! Called when this View is brought to the foreground. Restore
    //! the state of this View and prepare it to be shown. This includes
    //! loading resources into memory.
    function onShow() {
    	System.println("HASH: " + hash);
    	Comms.makeJsonRequest("https://garmin-waypoints.herokuapp.com/locations/" + hash, null, null, method(:callback));
    }
    
    

    //! Update the view
    function onUpdate(dc) {
    	System.println("Updating the view");
    	dc.setColor( Gfx.COLOR_BLACK, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
        if (text != null) {
        	dc.drawText(dc.getWidth()/2, dc.getHeight()*0.3, Gfx.FONT_SMALL, text, Gfx.TEXT_JUSTIFY_CENTER);
        }
    }

    //! Called when this View is removed from the screen. Save the
    //! state of this View here. This includes freeing resources from
    //! memory.
    function onHide() {
    }

}
