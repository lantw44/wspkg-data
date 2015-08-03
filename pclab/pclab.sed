# newer clang packages break the default clang version
/^clang-3\.5$/d
/^clang-3\.6$/d
# denyhosts not available
/^denyhosts$/d
# gcc 5 not available
/^g++-5$/d
/^gcc-5$/d
/^gfortran-5$/d
# gnome packages that cannot be found
/^gdm3$/d
/^gnome-themes$/d
# pocl not available
/^pocl/d
# openjdk 8 not available
/^openjdk-8-jdk$/d
# we use firefox on ubuntu
/^iceweasel/d
# fix linux-tools package name
s/^linux-tools$/linux-tools-generic/
# no such package
/^metamail$/d
/^xlockmore$/d
