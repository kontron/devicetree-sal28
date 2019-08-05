DTC := dtc

# install directories
PREFIX ?= /usr
DEVICETREEDIR ?= $(PREFIX)/share/devicetree

OVERLAYS := sl28-variant1.dtbo sl28-variant2.dtbo sl28-variant3.dtbo sl28-variant4.dtbo
OVERLAYS += carrier-s1914.dtbo carrier-ads2.dtbo
OVERLAYS += lvds-display-converter.dtbo embedded-display-port.dtbo
OVERLAYS += no-cpld.dtbo

.PHONY: all
all: $(OVERLAYS)

%.dtbo: %.dtso
	$(DTC) -@ -I dts -O dtb -o $@ $<

.PHONY: clean
clean:
	rm -f *.dtbo

.PHONY: install-overlays
install-overlays: $(OVERLAYS)
	install -d -m 0755 $(DEVICETREEDIR)
	install -D sl28-variant1.dtbo $(DEVICETREEDIR)/sl28-variant1.dtbo
	install -D sl28-variant2.dtbo $(DEVICETREEDIR)/sl28-variant2.dtbo
	install -D sl28-variant3.dtbo $(DEVICETREEDIR)/sl28-variant3.dtbo
	install -D sl28-variant4.dtbo $(DEVICETREEDIR)/sl28-variant4.dtbo
	install -D carrier-s1914.dtbo $(DEVICETREEDIR)/carrier-s1914.dtbo
	install -D carrier-ads2.dtbo $(DEVICETREEDIR)/carrier-ads2.dtbo
	install -D lvds-display-converter.dtbo $(DEVICETREEDIR)/lvds-display-converter.dtbo
	install -D embedded-display-port.dtbo $(DEVICETREEDIR)/embedded-display-port.dtbo
