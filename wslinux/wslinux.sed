# denyhosts is dropped by Debian 8 (jessie) because its upstream is dead
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=732712
/^denyhosts$/d
# only available in unstable
/^metamail$/d
/^xlockmore$/d
# not available in testing
/^ns2$/d
/^xserver-xspice$/d
