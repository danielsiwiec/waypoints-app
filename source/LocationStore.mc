class LocationStore {

  function save(location, options) {
    if (Toybox has :PersistedContent) {
			Toybox.PersistedContent.saveWaypoint(location, options);
		} else if (Toybox has :PersistedLocations) {
			Toybox.PersistedLocations.persistLocation(location, options);
		} else {
      throw new Toybox.Lang.Exception("No waypoint storage API");
    }
  }
}