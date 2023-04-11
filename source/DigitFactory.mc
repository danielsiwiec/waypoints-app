using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
import Toybox.Lang;

class DigitFactory extends Ui.PickerFactory {
    hidden var mFont;

    function initialize() {
        mFont = Gfx.FONT_NUMBER_HOT;
        PickerFactory.initialize();
    }

    function getDrawable(index, selected) {
        return new Ui.Text( { :text=>getValue(index) as String, :color=>Gfx.COLOR_WHITE, :font=> mFont, :locX =>Ui.LAYOUT_HALIGN_CENTER, :locY=>Ui.LAYOUT_VALIGN_CENTER } );
    }

    function getValue(index) {
        return index.format("%d");
    }

    function getSize() {
        return 10;
    }
}
