# Wifi Hotspot

* Create an AP (Access Point) with password encryption and internet connection.
* Choose one of the following encryptions: WPA, WPA2, WPA/WPA2, Open (no encryption).
* Hide your SSID.
* Disable communication between clients (client isolation).
* Enable IEEE 802.11n & 802.11ac modes support
* Internet sharing methods: NATed or Bridged or None (no Internet sharing).
* Choose the AP Gateway IP (only for 'NATed' and 'None' Internet sharing methods).
* You can create an AP with the same interface you are getting your Internet connection.
* Customise wifi Channel, Change MAC address, etc.

## Dependencies

- bash (to run this script)
- util-linux (for getopt)
- procps or procps-ng
- hostapd
- iproute2
- iw
- iwconfig (you only need this if 'iw' can not recognize your adapter)
- haveged (optional)

Dependencies for 'NAT' or 'None' Internet sharing method

- dnsmasq
- iptables

```bash
sudo apt install -y libgtk-3-dev build-essential gcc g++ pkg-config make hostapd libqrencode-dev libpng-dev
```

## Installation

```bash
git clone https://github.com/lucthienphong1120/wifi-hotspot
cd wifi-hotspot
make install
```

## Uninstall

```
make uninstall
```

## Usage

```
create_ap <interface> <interface-with-internet> <SSID> <passphrase>
```

### No passphrase (open network)

```
create_ap wlan0 eth0 HelloWorld
```

This will create an open network with SSID "HelloWorld" on wlan0.

### WPA/WPA2 passphrase

```
create_ap wlan0 eth0 HelloWorld 12345678
```

This will create a WPA/WPA2 network with SSID "HelloWorld" and passphrase "12345678" on wlan0.

### AP without Internet sharing

```
create_ap -n wlan0 HelloWorld 12345678
```

### Bridged Internet sharing

```
create_ap -m bridge wlan0 eth0 HelloWorld 12345678
```

### Choose a different WiFi adapter driver

```
create_ap --driver rtl871xdrv wlan0 eth0 HelloWorld 12345678
```

### Enable IEEE 802.11n

```
create_ap --ieee80211n --ht_capab '[HT40+]' wlan0 eth0 HelloWorld 12345678
```

### Client Isolation

```
create_ap --isolate-clients wlan0 eth0 HelloWorld 12345678
```


## Systemd service
Using the persistent [systemd](https://wiki.archlinux.org/index.php/systemd#Basic_systemctl_usage) service

### Start service immediately:

```
systemctl start create_ap
```

### Start on boot:

```
systemctl enable create_ap
```
