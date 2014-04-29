# denyhosts is dropped by Debian 8 (jessie) because its upstream is dead
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=732712
/^denyhosts$/d
# only available in unstable
/^metamail$/d
/^xlockmore$/d
# not available in testing
/^ns2$/d
/^tcl8.4-dev$/d
/^tk8.4-dev$/d
/^xserver-xspice$/d
