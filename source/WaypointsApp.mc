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

class StartView extends Ui.View {

	function onUpdate(dc) {
		dc.setColor( Gfx.COLOR_BLACK, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.4, Gfx.FONT_MEDIUM, "ENTER HASH", Gfx.TEXT_JUSTIFY_CENTER);
	}
}

class StartDelegate extends Ui.BehaviorDelegate {
	
	function onSelect() {
		Ui.pushView(new Ui.TextPicker(""), new KeyboardListener(), Ui.SLIDE_DOWN );
	}
}

var hash = "";

class KeyboardListener extends Ui.TextPickerDelegate {
    function onTextEntered(text, changed) {
        hash = text;
        Ui.pushView(new WaypointsView(), null, Ui.SLIDE_DOWN );
    }

    function onCancel() {
        Ui.popView(Ui.SLIDE_IMMEDIATE);
    }
}