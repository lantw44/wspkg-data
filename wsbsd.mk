# vim: set ts=8 sts=8 sw=8 ft=make:
# CSIE workstation bsd meta-package

NAME=                   wsbsd
USE_MACRO=              cpp
WSPKG_IN_COMMON=        wscommon.h
BACKEND=                freebsd
PKGNAME=                217

include $(WSPKGDIR)/wspkg-mk/defaults.mk
include $(WSPKGDIR)/wspkg-mk/packages.mk
