monkeyc --warn --output bin/waypoints.prg -m manifest.xml \
-z resources/drawables/drawables.xml:\
resources/strings/strings.xml \
-d fenix3_sim -u /Users/dsiwiec/connect-iq-sdk-1.2.6/bin/devices.xml \
-p /Users/dsiwiec/connect-iq-sdk-1.2.6/bin/projectInfo.xml \
source/WaypointsApp.mc \
source/HashView.mc \
source/DigitFactory.mc \
source/HashPicker.mc
