using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class DigitFactory extends Ui.PickerFactory {
    hidden var mFormatString;
    hidden var mFont;

    function initialize() {
        mFont = Gfx.FONT_NUMBER_HOT;
        mFormatString = "%d";
        PickerFactory.initialize();
    }

    function getDrawable(index, selected) {
        return new Ui.Text( { :text=>getValue(index).format(mFormatString), :color=>Gfx.COLOR_WHITE, :font=> mFont, :locX =>Ui.LAYOUT_HALIGN_CENTER, :locY=>Ui.LAYOUT_VALIGN_CENTER } );
    }

    function getValue(index) {
        return index;
    }

    function getSize() {
        return 10;
    }
}
