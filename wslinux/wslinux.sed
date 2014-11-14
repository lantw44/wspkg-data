# denyhosts is dropped by Debian 8 (jessie) because its upstream is dead
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=732712
/^denyhosts$/d
# Remove libc6-prof package as it's broken for years
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=760450
/^libc6-prof$/d
# only available in unstable
/^metamail$/d
/^xlockmore$/d
# not available in testing
/^xserver-xspice$/d
/^swfdec-mozilla/d
