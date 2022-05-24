# roguehostapd
Roguehostapd is a fork of hostapd, the famous user space software access point. It provides Python ctypes bindings and a number of additional attack features. It was primarily developed for use in the Wifiphisher project.

## Installation


### Requirements

```
apt-get install libnl-3-dev libnl-genl-3-dev
apt-get install libssl-dev
```

#### Build the repo

```
git clone https://github.com/wifiphisher/roguehostapd.git # Download the latest version
cd roguehostapd # Switch to the roguehostapd directory
python setup.py install # Build the shared library of hostapd
```

## Usage

***

```shell
python run.py -i wlan0 -ssid Haha
```

Use wlan0 for spawning the OPEN rogue AP on channel 6 and the ssid is "Haha".

***

```shell
python run.py -i wlan0 -ssid Haha -pW 12345678
```

Use wlan0 for spawning the WPA2/WPA rogue AP with passhrase 12345678

***

```shell
python run.py -i wlan0 -ssid Haha -kA
```

Use wlan0 for spawning the OPEN rogue AP supporting the KARMA attack.

***

```python
HOSTAPD_CONFIG_DICT = {
    'ssid': 'Haha',
    'interface': 'wlan0',
    'karma_enable': 1}
HOSTAPD_OPTION_DICT = {
    'debug_level': hostapd_constants.HOSTAPD_DEBUG_OFF
}
HOSTAPD_OBJ = Hostapd()
HOSTAPD_OBJ.start(HOSTAPD_CONFIG_DICT, HOSTAPD_OPTION_DICT)
```

The above configuration will perform the KARMA attack.

Following are all the options along with their descriptions (also available with `python run.py -h`)


| Short form | Long form | Explanation |
| :----------: | :---------: | :-----------: |
|-h | --help| show this help message and exit |
|-ssid SSID| --ssid SSID| Select the ssid for the spawn rogue AP|
|-c CHANNEL| --channel CHANNEL| Select the channel number for the spawn rogue AP|
|-bI BEACON_INT| --beacon_int BEACON_INT| Define the beacon interval in milliseconds for the spawn rogue AP|
|-i INTERFACE| --interface INTERFACE| Select the interface for the spawn rogue AP. Example: -i wlan0|
|-pW WPA_PASSPHRASE| --wpa_passphrase WPA_PASSPHRASE| Define the password for the spawn rogue AP.|
|-kA|| Enabling the KARMA attack|
|-dV|--debug-verbose| Enabling the verbose debug log|
|-K|--key_data|Include key data in debug messages|
|-t|--timestamp|Include timestamps in some debug messages|
|-v|--version|Show hostapd version|

Project from [wifiphisher](https://github.com/wifiphisher/roguehostapd)