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
	function onLayout(dc) {
		dc.setColor( Gfx.COLOR_BLACK, Gfx.COLOR_BLACK );
	    dc.clear();
	    dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
		Ui.pushView(new HashPicker(), new HashPickerDelegate(), Ui.SLIDE_DOWN);
	}
}

class HashPicker extends Ui.Picker {

	function initialize(){
		var title = new Ui.Text({:text=>"HASH", :locX=>Ui.LAYOUT_HALIGN_CENTER, :locY=>Ui.LAYOUT_VALIGN_TOP, :color=>Gfx.COLOR_WHITE});
		Ui.Picker.initialize({:title => title,:pattern => createNumberPattern(4)});
		WatchUi.requestUpdate();
	}

	function createNumberPattern(count) {
		var digits = new [count];
		for (var i=0 ; i<count ; i+=1) {
			digits[i] = new DigitFactory();
		}
		return digits;
	}
}

class HashPickerDelegate extends Ui.PickerDelegate {

	function joinArray(array){
		var text = "";
		for (var i=0; i < array.size(); i+=1) {
			text += array[i];
		}
		return text;
	}

	function onAccept(values) {
        hash = joinArray(values);
        Ui.pushView(new HashView(), new HashDelegate(), Ui.SLIDE_DOWN );
    }

    function onCancel() {
    	System.exit();
    }
}

class HashDelegate extends Ui.InputDelegate {
	function onKey(){
		System.exit();
    return true;
	}
}
