# dynmotd

### [CHANGELOG](https://github.com/Neutrollized/dynmotd/blob/master/CHANGELOG.md)

Dynamic MOTD for RHEL/Debian-based Linux distros

I got the template for this off someone's repo many years ago, long before I got a GitHub account.  It was initially created for RHEL6, but I've made changes to it for RHEL7 as well as added my own banner on top.  I tried looking for the original so I could do a proper fork and give credit where credit is due, but there are now so many dynmotd repos on GitHub that it's honestly hard to figure out who I got it from.  In any case, you have my thanks and here's a *hat tip* to you, stranger.


## Requirements:
For some of the data to be pulled and filtered successfully, make sure you have the following tools on your VM instance (should be standard on most Linux distributions, unless you have an insanely hardened image or something):
- `curl`
- `awk`
- `xargs`
- `basename`
- `tr`


## Installation:

You can run the `install.sh` script as root/with sudo or if you prefer manually:

```
 1.   vi /etc/ssh/sshd_config  (this is optional; if you have `PrintMotd yes`, then you'll get the static motd as well as the `dynmotd` output)
      PrintMotd no

 2.   vi /etc/pam.d/login  (if applicable)
      # session optional pam_motd.so

 3.   vi /etc/profile.d/dynmotd.sh (mode: 0644)
      /usr/local/bin/dynmotd

 4.   Then of course drop this file in:
      /usr/local/bin/

 5.   Create an optional folder (default: /etc/dynmotd.d) in which you can place custom scripts for checking additional items (file system, services, ports, etc. -- this is optional)
```


## Sample outputs:

```
==============================================================================
 -- Hostname...........:  myhostname (123.45.67.89)
 -- OS version.........:  Ubuntu 20.04.2 LTS
 -- Kernel release.....:  5.4.0-1040-gcp
 -- Users..............:  Currently 2 user(s) logged on
==============================================================================
 -- CPUs...............:  1 x GenuineIntel/Intel(R) Xeon(R) CPU @ 2.30GHz
 -- Load average.......:  0.00 - 0.00 - 0.00 (1-5-15 min)
 -- Memory.............:  577Mi - 132Mi - 65Mi (total-used-free)
 -- Swap...............:  0B - 0B - 0B (total-used-free)
 -- Processes..........:  109 running - 0 zombies
 -- System uptime......:  0 days 8 hours 0 minutes 6 seconds
===== GCP INSTANCE METADATA ==================================================
 -- Project ID.........:  myproject-12345
 -- Machine Type.......:  f1-micro
 -- Preemptible........:  TRUE
 -- VPC................:  default
 -- Zone...............:  us-east1-a
===== SERVICES ===============================================================
 -- docker.............:  active (running) since Mon 2020-07-20 02:08:09 UTC
 -- jenkins............:  active (exited) since Mon 2020-07-20 02:08:09 UTC
==============================================================================
```

```
==============================================================================
 -- Hostname...........:  raspberrypi (12.34.56.78)
 -- OS version.........:  Raspbian GNU/Linux 10 (buster)
 -- Kernel release.....:  5.10.11-v7l+
 -- Users..............:  Currently 3 user(s) logged on
==============================================================================
 -- CPUs...............:  4 x ARM/Cortex-A72
 -- Load average.......:  0.04 - 0.05 - 0.09 (1-5-15 min)
 -- Memory.............:  3.8Gi - 178Mi - 3.0Gi (total-used-free)
 -- Swap...............:  99Mi - 0B - 99Mi (total-used-free)
 -- Processes..........:  131 running - 0 zombies
 -- System uptime......:  0 days 2 hours 9 minutes 21 seconds
===== PI INFO ================================================================
 -- Revision...........:  Raspberry Pi 4 Model B Rev 1.2
 -- Temperature........:  45.0'C
===== SERVICES ===============================================================
 -- k3s................:  inactive (dead)
 -- docker.............:  active (running) since Sat 2020-05-23 13:44:56 EDT
==============================================================================
```

```
==============================================================================
 -- Hostname...........:  ip-172-12-34-56 (172.12.34.56)
 -- OS version.........:  Ubuntu 20.04.2 LTS
 -- Kernel release.....:  5.4.0-1041-aws
 -- Users..............:  Currently 4 user(s) logged on
==============================================================================
 -- CPUs...............:  2 x ARM/Neoverse-N1
 -- Load average.......:  0.00 - 0.00 - 0.00 (1-5-15 min)
 -- Memory.............:  952Mi - 167Mi - 486Mi (total-used-free)
 -- Swap...............:  0B - 0B - 0B (total-used-free)
 -- Processes..........:  143 running - 0 zombies
 -- System uptime......:  0 days 5 hours 33 minutes 14 seconds
===== AWS INSTANCE METADATA ==================================================
 -- Instance ID........:  i-0123456789abcdef
 -- Instance Type......:  t4g.micro
 -- Zone...............:  ca-central-1d
==============================================================================
```
