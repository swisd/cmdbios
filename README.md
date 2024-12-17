# CMDBIOS
A BIOS written in Batchscript

[CMDBIOS]: https://github.com/swisd/cmdbios/
![release](https://img.shields.io/badge/release-none-red)
![latest](https://img.shields.io/badge/latest-v3.31-blue)

**CMDBIOS is based off of multiple different versions and differences of AMIBIOS, PhoenixBIOS, and AwardBIOS**

> Note: CMDBIOS only represents a BIOS interface with limited capabilities.
> CMDBIOS DOES NOT CHANGE ANY DEVICE OR BIOS SETTINGS

---

## Overview

CMDBIOS is a BIOS simulation, designed to run from one file, directly in a command prompt window.
CMDBIOS is not real BIOS firmware and does not interact with system hardware or modify any system settings.

---
## Table of Contents

<!-- TOC -->
* [CMDBIOS](#cmdbios)
  * [Overview](#overview)
  * [Table of Contents](#table-of-contents)
  * [Features](#features)
  * [Limitations](#limitations)
  * [Setup](#setup)
    * [File/Folder Structure](#filefolder-structure)
    * [CMD Window Requirements](#cmd-window-requirements)
  * [Planned Updates](#planned-updates)
  * [FAQ](#faq)
  * [License](#license)
  * [Acknowledgments](#acknowledgments)
  * [Screenshots](#screenshots)
<!-- TOC -->

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

## FAQ

**Q: Does CMDBIOS actually modify my system's BIOS?**  
A: No, CMDBIOS does not interact with or change any hardware or BIOS settings on your system. It is purely a simulation for educational or demonstration purposes.

**Q: Can I use CMDBIOS to configure my computer's BIOS?**  
A: No, CMDBIOS is a mock interface. It cannot modify any hardware settings, such as boot order or device configurations.

**Q: Is CMDBIOS compatible with all versions of Windows?**  
A: CMDBIOS is designed for use with Windows operating systems, specifically those that support Batch scripts (Windows XP, 7, 8, 10, and 11).

**Q: How can I contribute to CMDBIOS?**  
A: You can contribute by forking the repository on GitHub and submitting pull requests with any improvements or fixes you make.


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

<div class="footer">
  <strong>CMDBIOS 3.31</strong><br>
  <strong>2025 nitrogen-12</strong>
</div>
