class LocationStore {

  function save(location, options) {
    if (Toybox has :PersistedContent) {
			Toybox.PersistedContent.saveWaypoint(location, options);
		} else {
      System.println("No waypoint storage API");
      throw new Toybox.Lang.Exception();
    }
  }
}