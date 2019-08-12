# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


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
