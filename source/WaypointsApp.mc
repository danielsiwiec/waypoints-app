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
		Ui.pushView(new HashPickerView(), new HashPickerDelegate(), Ui.SLIDE_DOWN);
    return true;
	}
}
