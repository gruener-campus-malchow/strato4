# How to set up

1. put [Raspberry Pi OS Lite image](https://www.raspberrypi.com/software/) on SD-Card
2. create a empty ssh file in /boot/
3. create wpa_supplicant.conf and put
```
country=de
update_config=1
ctrl_interface=/var/run/wpa_supplicant

network={
 scan_ssid=1
 ssid="MyNetworkSSID"
 psk="Pa55w0rd1234"
}
```
(replace SSID and password with your own)

4. connect PiCamera to cable and Pi
5. connect RTC-module to GPIO-pins

| DS1307 |	Pi GPIO |
|---|---|
| GND |	P1-06 |
| Vcc	| P1-01 (3.3V) |
| SDA	| P1-03 (I2C SDA) |
| SCL	| P1-05 (I2C SCL) |

![GPIO Layout for Pi zero](/doc/RPIGPIO.svg)

7. execute the [setup script](/shared/setup.sh)
