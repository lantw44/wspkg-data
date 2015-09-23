# newer clang packages break the default clang version
/^clang-3\.5$/d
/^clang-3\.6$/d
# clang versions not available
/^clang-3\.7$/d
/^clang-3\.8$/d
/^llvm-3\.7-dev$/d
/^llvm-3\.8-dev$/d
/^llvm-3\.7-runtime$/d
/^llvm-3\.8-runtime$/d
/^libclang-3\.7-dev$/d
/^libclang-3\.8-dev$/d
# denyhosts not available
/^denyhosts$/d
# gcc 5 not available
/^g++-5$/d
/^gcc-5$/d
/^gfortran-5$/d
# gnome packages that cannot be found
/^gdm3$/d
# lua 5.3 not available
/^lua5\.3$/d
/^liblua5\.3-dev$/d
# pocl not available
/^pocl/d
# openjdk 8 not available
/^openjdk-8-jdk$/d
# tasks not available
/^task-/d
# we use firefox on ubuntu
/^iceweasel/d
# fix linux-tools package name
s/^linux-tools$/linux-tools-generic/
# not available for x86_64
/^mit-scheme$/d
# no such package
/^metamail$/d
/^patchelf$/d
/^xlockmore$/d
