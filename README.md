# Device tree overlays for SMARC-sAL28

This repository provides device tree overlays which can be loaded on top
of the base device tree.

## Variant overlays

There are multiple variants of the SMARC-sAL28 in respect of the network
and audio functionality. Board variant 1 has just one ethernet port without
TSN functionality but has all four SerDes lanes available for the user.
Board variant 2 has two ethernet ports and an audio interface. These ports
are connected to the internal switch, thus it doesn't have any direct
ethernet connection, but it makes the board perfect for ring topologies.
Board variant 3 has one (TSN-capable) ethernet port. Board variant 4 has
two ethernet ports (one TSN-capable and one standard one). Both variant 3
and 4 have a special QSGMII lane available, so that the four internal
switch ports can be exposed on the carrier board.

## Carrier overlays

Kontron officially supports two different carriers. One generic "SMARC
evaluation carrier 2.0" (`carrier-ads2.dtso`) and a "KBox A-230-LS"
tailored to the SMARC-sAL28 board (`carrier-s1914.dtso`). These overlays
provide nodes for the devices provided by these carriers.

## Additional overlays

### Embedded display port

The board provides a display port which can also be used as a embedded
display port. Loading `embedded-display-port.dtso` reconfigures the port as
eDP.

### CPLD update mode

Due to pin restrictions the CPLD shares GPIOs which are needed during CPLD
update. By default, the device tree contains nodes for the CPLD. Loading
`no-cpld.dtso` disables all CPLD devices in the device tree. Thus, the
GPIOs are free again and can be used to update the CPLD.

### CAN1

The second CAN port can be enabled if both the carrier and the module
support it. Load `can1.dtso` to enable it. Please note, that this also
requires a modified RCW, because CAN1 shares pins with the I²C PM bus.

### 400kHz for I²C GP and PM

The I²C GP and PM bus can be switched to 400kHz by using either
`i2c-gp-400khz.dtso` or `i2c-pm-400khz.dtso`.

### Second ethernet link to the internal switch

By default, only one 2.5Gb/s link to the internal switch is active. This
acts as a sepecial CPU port. A second port can be enabled by loading the
overlay `eno3-swp5.dtso`. This port has no TSN capabilities and just has
a speed of 1Gb/s.

### KBox A-230-LS carrier specific overlays

The KBox is available in different flavours and configurations, too. The
first serial port can be in RS-232 mode (`carrier-s1914-ser0-rs232.dtso`),
in RS-485 mode (`carrier-s1914-ser0-rs485.dtso`) and RS-485 full duplex
mode (`carrier-s1914-ser0-rs485-fd.dtso`). Also the second CAN port can be
enabled if both the carrier and the module supports it
(`carrier-s1914-can1.dtso`).
