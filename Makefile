DTC := dtc

# install directories
PREFIX ?= /usr
DEVICETREEDIR ?= $(PREFIX)/share/devicetree

DTB_OVERLAYS: sl28-variant1.dtbo sl28-variant2.dtbo sl28-variant3.dtbo sl28-variant4.dtbo carrier-s1914.dtbo carrier-ads2.dtbo

.PHONY: all
all: $(DTB_OVERLAYS)

%.dtbo: %.dtso
	$(DTC) -@ -I dts -O dtb -o $@ $<

.PHONY: clean
clean:
	rm -f *.dtbo

.PHONY: $(DTB_OVERLAYS) install-overlays
install-overlays: $(DTB_OVERLAYS)
	install -d -m 0755 $(DEVICETREEDIR)
	install -D sl28-variant1.dtbo $(DEVICETREEDIR)/sl28-variant1.dtbo
	install -D sl28-variant2.dtbo $(DEVICETREEDIR)/sl28-variant2.dtbo
	install -D sl28-variant3.dtbo $(DEVICETREEDIR)/sl28-variant3.dtbo
	install -D sl28-variant4.dtbo $(DEVICETREEDIR)/sl28-variant4.dtbo
	install -D carrier-s1914.dtbo $(DEVICETREEDIR)/carrier-s1914.dtbo
	install -D carrier-ads2.dtbo $(DEVICETREEDIR)/carrier-ads2.dtbo
