# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [3.4.0] - 2025-02-06
### Added
- Raspberry Pi bootloader version info
- Raspberry Pi GPU memory allocation

## [3.3.0] - 2024-09-20
### Fixed
- added extra condition when detecting when OS is a WSL distro to remove some false positive results
- moved logic of whether to display WSL information into `00_wsl.sh` itself

## [3.2.0] - 2024-08-13
### Added
- extra system info if your system happens to be [WSL](https://learn.microsoft.com/en-us/windows/wsl/about)

## [3.1.1] - 2024-08-12
### Fixed
- first checks for existence of `tuned-adm` before RHEL scripts are installed

## [3.1.0] - 2024-06-24
### Fixed
- querying AWS EC2 metadata now requires a temporary token

## [3.0.1] - 2024-02-29
### Added
- uninstall script

## [3.0.0] - 2023-08-07
### Added
- Tuned active profile for RHEL only
### Changed
- reorganized/renamed files

## [2.0.9] - 2022-02-19
### Fixed
- adding a check for presence of `/etc/rpi-issue` as newer versions of Raspbian OS no longer reports as Raspbian in `/etc/os-release`

## [2.0.8] - 2022-01-14
### Added
- external IP from GCP compute engine metadata (if exists)
- external IP from AWS EC2 metadata (if exists)
- external IP from Azure VM (if exists)

## [2.0.7] - 2021-11-13
### Added
- VPC name from GCP compute engine metadata

## [2.0.6] - 2021-04-21
### Deprecated
- I founds that more often than not, I didn't want my external IP to be shown so openly (i.e. when I want to use my server to show some demos), so I'm commenting out the `EXT_IP` that was added in v1.1.11

## [2.0.5] - 2021-04-01
### Changed
- obtaining CPU info from `lscpu` rather than from `/proc/cpuinfo` as info for non-standard CPU types (i.e. Graviton2) won't necessarily show up in `/proc/cpuinfo`
- CPU info includes chip vendor

## [2.0.4] - 2021-03-05
### Added
- added verbostiy to the install script
### Fixed
- added `--max-time 1` to the curl command when checking the internal metadata IP address as some would not give a valid response right away and would have to wait for a long timeout

## [2.0.3] - 2021-03-03
### Added
- detects Oracle Linux as a distro
### Changed
- source for external IP info via *ipinfo.me/ip* instead of *ifconfig.me*

## [2.0.2] - 2021-03-01
### Changed
- hostname obtained thru `hostname -s` rather than `uname -n`
### Fixed
- added extra checks as ensure the VM is a cloud instance

## [2.0.1] - 2021-02-28
### Added
- extra metadata for GCP
### Changed
- `jq` no longer a requirement
- in Azure, the "Zone" metadata has been replaced with "Location"
- suppressed some errors with installs

## [2.0.0] - 2021-02-27
### Added
- requirement for `jq`
- added scripts to pull some instance metadata info for GCP, AWS and Azure if it detects that VM is a cloud VM instance

## [1.1.11] - 2021-02-20
### Added
- outputs the external/public IP (if any -- shows "None" otherwise)

## [1.1.10] - 2020-06-09
### Added
- install script now adds a symlink `dm` to the `dynmotd` script (easier to type when using this outside of just for its MOTD functionality)

## [1.1.9] - 2020-05-23
### Added
- extra system info if your system happens to be a [Raspberry Pi](https://www.raspberrypi.org/)

## [1.1.8] - 2019-09-25
### Changed
- redid the way the interal/private IP is obtained via the `hostname` command (as newer versions produces more output than one would need)
### Added
- extra (commented out) lines of optional commands to gather AWS-specific metadata such as public IP or public DNS name

## [1.1.7] - 2019-08-13
### Changed
- redid the way AWS EC2 instance metadata is gathered (for instance id & instance type) 

## [1.1.6] - 2019-08-11
### Changed
- OS distribution now auto-detected
### Added
- Reports CPU model & speed

## [1.1.5] - 2019-07-26
### Added
- A simple `install.sh` script that installs `dynmotd`

## [1.1.4] - 2019-07-19
### Changed
- Default OS string is for Debian-based rather than RHEL/CentOS
### Added
- Instance ID of your AWS EC2 instance

## [1.1.3] - 2018-10-15
### Added
- banner.txt to hold banners.  Currently unused.
### Removed
- "RHEL 7" banner & `tuned profile` in the output as I want to keep it concise & useful

## [1.1.2] - 2018-09-25
### Removed
- `Current user` in the output as I want to keep it concise & useful

## [1.1.1] - 2018-08-10
### Added
- CoreOS find version (PRETTY_NAME)
- Another option to obtain the IPv4 address via `getent hosts` as certain distributions will return the IPv6 address when using `hostname -i`

## [1.1.0] - 2018-07-19
### Changed
- Some of the way some commands were run so shellcheck won't warn (i.e. [SC2002], [SC2046], [SC2086], etc.)
### Added
- Will now look for a directory (default `/etc/dynmotd.d`) with custom scripts for addtional things you would like to check on that server.  See [examples](https://github.com/Neutrollized/dynmotd/tree/master/example/dynmotd.d)

## [1.0.1] - 2018-07-12
### Changed
- Reorganized the variables to the order which they appear
### Added
- `OS_RHEL` and `OS_DEB` variables that contain the OS name for RHEL-based and Debian-based distributions respectively
- this! (CHANGELOG.md)

## [1.0.0] - 2017-12-11
### Added
- Initial release
