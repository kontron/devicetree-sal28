DTC := dtc


.PHONY: all
all: sl28-variant1.dtbo sl28-variant2.dtbo sl28-variant3.dtbo sl28-variant4.dtbo carrier-s1914.dtbo


%.dtbo: %.dtso
	$(DTC) -@ -I dts -O dtb -o $@ $<

.PHONY: clean
clean:
	rm -f *.dtbo
