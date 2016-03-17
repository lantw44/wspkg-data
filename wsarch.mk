# vim: set ts=8 sts=8 sw=8 ft=make:
# CSIE workstation Arch Linux meta-package

NAME=                   wsarch
USE_MACRO=              cpp
WSPKG_IN_COMMON=        wscommon.h
BACKEND=                arch
PKGNAME=                217

include $(WSPKGDIR)/wspkg-mk/defaults.mk
include $(WSPKGDIR)/wspkg-mk/packages.mk
