using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class WaypointsApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    //! onStart() is called on application start up
    function onStart() {
    }

    //! onStop() is called when your application is exiting
    function onStop() {
    }

    //! Return the initial view of your application here
    function getInitialView() {
        return [ new StartView(), new StartDelegate() ];
    }

}

class StartDelegate extends Ui.BehaviorDelegate {

	function createHashPicker() {
		var title = new Ui.Text({:text=>"HASH", :locX=>Ui.LAYOUT_HALIGN_CENTER, :locY=>Ui.LAYOUT_VALIGN_TOP, :color=>Gfx.COLOR_WHITE});
		return new Ui.Picker({:title => title,:pattern => [new NumberFactory(), new NumberFactory(), new NumberFactory()]});
	}
	
	function onSelect() {
		Ui.pushView(createHashPicker(), new HashDelegate(), Ui.SLIDE_DOWN );
	}
}

class StartView extends Ui.View {

	function onUpdate(dc) {
		dc.setColor( Gfx.COLOR_BLACK, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.4, Gfx.FONT_MEDIUM, "ENTER HASH", Gfx.TEXT_JUSTIFY_CENTER);
	}
}

var hash = "";

class HashDelegate extends Ui.PickerDelegate {
	
	function joinArray(array){
		var text = "";
		for (var i=0; i < array.size(); i+=1) {
			text += array[i];
		}
		return text;
	}
	
	function onAccept(values) {
        hash = joinArray(values);
        Ui.pushView(new WaypointsView(), null, Ui.SLIDE_DOWN );
    }
}

