using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class HashPickerView extends Ui.Picker {

	var analytics;

	function initialize(){
		analytics = new Analytics();
		var title = new Ui.Text({:text=>"HASH", :locX=>Ui.LAYOUT_HALIGN_CENTER, :locY=>Ui.LAYOUT_VALIGN_TOP, :color=>Gfx.COLOR_WHITE});
		Ui.Picker.initialize({:title => title,:pattern => createNumberPattern(4)});
	}

	function createNumberPattern(count) {
		var digits = new [count];
		for (var i=0 ; i<count ; i+=1) {
			digits[i] = new DigitFactory();
		}
		return digits;
	}

	function onShow() {
		analytics.page("HashPicker");
	}

	function onUpdate(dc) {
		dc.setColor( Gfx.COLOR_BLACK, Gfx.COLOR_BLACK );
    dc.clear();
    dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
  }
}

class HashPickerDelegate extends Ui.PickerDelegate {

  function initialize(){
    PickerDelegate.initialize();
  }

	function joinArray(array){
		var text = "";
		for (var i=0; i < array.size(); i+=1) {
			text += array[i];
		}
		return text;
	}

	function onAccept(values) {
      hash = joinArray(values);
      Ui.switchToView(new HashView(), new HashDelegate(), Ui.SLIDE_IMMEDIATE );
  }

  function onCancel() {
  	System.exit();
  }
}
