using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

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
      Ui.pushView(new HashView(), new HashDelegate(), Ui.SLIDE_DOWN );
  }

  function onCancel() {
  	System.exit();
  }
}
