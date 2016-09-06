include props.mk

sources = `find source -name '*.mc'`
resources = `find resources -name '*.xml' | tr '\n' ':' | sed 's/.$$//'`
SDK_HOME = /Users/dsiwiec/connectiq-sdk-mac-1.2.9

build:
	$(SDK_HOME)/bin/monkeyc --warn --output bin/$(APPNAME).prg -m manifest.xml \
	-z $(resources) -u $(SDK_HOME)/bin/devices.xml \
	-p $(SDK_HOME)/bin/projectInfo.xml $(sources)

run: build
	$(SDK_HOME)/bin/connectiq &&\
	sleep 3 &&\
	$(SDK_HOME)/bin/monkeydo bin/$(APPNAME).prg $(DEVICE)

deploy: build
	cp bin/$(APPNAME).prg /Volumes/GARMIN/GARMIN/APPS/

package:
	$(SDK_HOME)/bin/monkeyc --warn --output bin/$(APPNAME).iq -m manifest.xml \
	-z $(resources) -u $(SDK_HOME)/bin/devices.xml \
	-p $(SDK_HOME)/bin/projectInfo.xml $(sources) -e -r
