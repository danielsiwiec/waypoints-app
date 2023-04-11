using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

var hash = "";

class SendPoints extends App.AppBase {

    function initialize() {
      AppBase.initialize();
    }

    function getInitialView() {
      return [new HashPickerView(), new HashPickerDelegate()];
    }

}