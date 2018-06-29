# dynmotd
Dynamic MOTD for Centos/RHEL (can be adapted for other distros too!)

I got the template for this off someone's repo many years ago, long before I got a GitHub account.  It was initially created for RHEL6, but I've made changes to it for RHEL7 as well as added my own banner on top.  I tried looking for the original so I could do a proper fork and give credit where credit is due, but there are now so many dynmotd repos on GitHub that it's honestly hard to figure out who I got it from.  In any case, you have my thanks and here's a *hat tip* to you, stranger.


## Installation:

```
 1.   vim /etc/ssh/sshd_config  (this is optional; if you have `PrintMotd yes`, then you'll get the static motd as well as the `dynmotd` output)
      PrintMotd no

 2.   vim /etc/pam.d/login
      # session optional pam_motd.so

 3.   vim /etc/profile
      /usr/local/bin/dynmotd # Place at the bottom

 4.   Then of course drop this file at
      /usr/local/bin/dynmotd
```
