# Device tree overlays for SMARC-sAL28

This repository provides device tree overlays which can be loaded on top
the base device tree.

## Variant overlays

There are multiple variants of the SMARC-sAL28 in respect of the network
and audio functionality.

## Carrier overlays

Kontron supports two different carriers. One generic "SMARC evaluation
carrier 2.0" (`carrier-ads2.dtso`) and a "KBox A-230-LS" tailored to the
SMARC-sAL28 board (`carrier-s1914.dtso`). These overlays provide nodes for
the devices provided by these carriers.

## Additional overlays

### Embedded display port

The board provides a display port which can also be used as a embedded
display port. Loading `embedded-display-port.dtso` reconfigures the port as
eDP.

### LVDS port

The board also provides an optional LVDS output. There are variants of the
board which have an eDP-to-LVDS bridge. Load `lvds-display-converter.dtso`
to enable support for this bridge and the LVDS output.

### CPLD update mode

Due to pin restrictions the CPLD shares GPIOs which are needed during CPLD
update. By default, the device tree contains nodes for the CPLD. Loading
`no-cpld.dtso` disables all CPLD devices in the device tree. Thus, the
GPIOs are free again and can be used to update the CPLD.

### SMARC evaluation carrier 2.0 specific overlays

If the module supports it you can enable the second CAN port by loading
`carrier-ads2-can1.dtso`.

### KBox A-230-LS carrier specific overlays

Also the KBox is available in different flavours and configurations.  The
first serial port can be in RS-232 mode (`carrier-s1914-ser0-rs232.dtso`),
in RS-485 mode (`carrier-s1914-ser0-rs485.dtso`) and RS-485 full duplex
mode (`carrier-s1914-ser0-rs485-fd.dtso`). Also the second CAN port can be
enabled if both the carrier and the module supports it
(`carrier-s1914-can1.dtso`).
