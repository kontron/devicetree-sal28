DTC := dtc

# install directories
PREFIX ?= /usr
DEVICETREEDIR ?= $(PREFIX)/share/devicetree

OVERLAYS := sl28-variant1.dtbo sl28-variant2.dtbo sl28-variant3.dtbo sl28-variant4.dtbo
OVERLAYS += carrier-s1914.dtbo carrier-ads2.dtbo
OVERLAYS += carrier-s1914-ser0-rs232.dtbo carrier-s1914-ser0-rs485.dtbo carrier-s1914-ser0-rs485-fd.dtbo
OVERLAYS += embedded-display-port.dtbo no-cpld.dtbo can1.dtbo eno3-swp5.dtbo
OVERLAYS += i2c-gp-400khz.dtbo i2c-pm-400khz.dtbo

.PHONY: all
all: $(OVERLAYS)

%.dtbo: %.dtso
	$(DTC) -@ -I dts -O dtb -o $@ $<

.PHONY: clean
clean:
	rm -f *.dtbo

.PHONY: install-overlays
install-overlays: $(OVERLAYS)
	for o in $(OVERLAYS); do \
		install -D -m644 $$o $(DEVICETREEDIR)/$$o; \
	done
