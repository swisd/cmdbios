# CMDBIOS
A BIOS written in Batchscript

![release](https://img.shields.io/badge/release-none-blue)
![latest](https://img.shields.io/badge/latest-v3.31-blue)

**CMDBIOS is based off of multiple different versions and differences of AMIBIOS, PhoenixBIOS, and AwardBIOS**

> Note: CMDBIOS only represents a BIOS interface with limited capabilities.
> CMDBIOS DOES NOT CHANGE ANY DEVICE OR BIOS SETTINGS

---

## Overview

CMDBIOS is a BIOS simulation, designed to run from one file, directly in a command prompt window.
CMDBIOS is not real BIOS firmware and does not interact with system hardware or modify any system settings.

---

## Features

- **Simulated BIOS Interface:** CMDBIOS has a legacy style-interface, with some modern touches and color schemes.
- **Unified BIOS:** CMDBIOS replicates many commonly found settings and configurations within AMIBIOS, PhoenixBIOS, and AwardBIOS.
- **Keyboard Navigation:** Navigation similar to that of most BIOS.
- **Non-invasive:** CMDBIOS **does not alter any hardware settings or configurations**.
- **Setting Persistance:** Settings changed in the session will be saved and loaded

---

## Limitations

- **No HW Integration:** CMDBIOS only simulates a BIOS

---

## Setup

### File/Folder Structure

```
bios
  /batbox.exe
  /bios.bat
  /cinderblock-small-notext.bat
```

### CMD Window Requirements

If you are using Windows 10, you can skip this section.

If you are using Windows 11:
1. Open **PowerShell**
2. Right-Click on the tab bar and select **Settings**
3. Select **Default Terminal Application** and set to **Windows Console Host**
4. Save settings

---

## Planned Updates

>User and Admin PW saving to be added in a later update

---

## License

CMDBIOS is released under the [license_unavailable]()

---

## Acknowledgments

CMDBIOS would not be possible without the inspiration and concepts taken from the following BIOS systems:
- AMIBIOS
- PhoenixBIOS
- AwardBIOS

---

## Screenshots
![Image](./doc/img/bios-1.png)

![Image](./doc/img/bios-4.png)

![Image](./doc/img/bios-7.png)

---