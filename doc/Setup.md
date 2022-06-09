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
6. execute the [setup script](/shared/setup.sh)