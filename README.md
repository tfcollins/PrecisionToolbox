# Analog Devices, Inc. Precision Toolbox

Toolbox created by ADI to be used with MATLAB and Simulink with ADI Precision products.

License : [![License](https://img.shields.io/badge/license-LGPL2-blue.svg)](https://github.com/analogdevicesinc/PrecisionToolbox/blob/master/LICENSE)
Latest Release : [![GitHub release](https://img.shields.io/github/release/analogdevicesinc/PrecisionToolbox.svg)](https://github.com/analogdevicesinc/PrecisionToolbox/releases/latest)
Downloads :  [![Github All Releases](https://img.shields.io/github/downloads/analogdevicesinc/PrecisionToolbox/total.svg)](https://github.com/analogdevicesinc/PrecisionToolbox/releases/latest)

As with many open-source packages, we use [GitHub](https://github.com/analogdevicesinc/PrecisionToolbox) to do development and maintain the source, and [Jenkins](https://jenkins.com/) for continuous integration.
  - If you want to just use PrecisionToolbox, we suggest using the [latest release](https://github.com/analogdevicesinc/PrecisionToolbox/releases/latest).
  - If you think you have found a bug in the release, or need a feature which isn't in the release, try the latest **untested** builds from the master branch.

| MATLAB Release |  Installer Package  |
|:--------------:|:-------------------:|
| R2021a         | <a href="http://swdownloads.analog.com/cse/toolboxes/trx/master/AnalogDevicesPrecisionToolbox_v21.1.1.mltbx"><img src="https://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png" data-canonical-src="https://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png" height="40" /></a>|

If you use it, and like it - please let us know. If you use it, and hate it - please let us know that too.

## Supported Tools and Releases

We provide support across two releases of MATLAB. This does not mean older releases will not work but they are not maintained. Currently supported tools are:
- Bug fixes and new features: MATLAB R2021a

## Support and Documentation

All support questions should be posted in our [EngineerZone](https://ez.analog.com/sw-interface-tools) forums. Documentation is included within the toolbox but additional documentation is available on the [ADI Wiki](https://wiki.analog.com/resources/tools-software/rfm-toolbox).

## Building & Installing

If you don't want to use the toolbox installers you can manually build the toolbox. Should be a quick matter of `make build`:

```
rgetz@pinky:~/PrecisionToolbox$ make -C CI/scripts/ build 
```

