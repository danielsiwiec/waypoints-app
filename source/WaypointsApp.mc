using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

var hash = "";

class WaypointsApp extends App.AppBase {

    function initialize() {
      AppBase.initialize();
    }

    function getInitialView() {
      return [ new ScreenClearingView() ];
    }

}

class ScreenClearingView extends Ui.View {

  function initialize() {
    View.initialize();
  }

	function onLayout(dc) {
		dc.setColor( Gfx.COLOR_BLACK, Gfx.COLOR_BLACK );
	  dc.clear();
	  dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
		Ui.pushView(new HashPicker(), new HashPickerDelegate(), Ui.SLIDE_DOWN);
	}
}
