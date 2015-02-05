# vim: set ts=8 sts=8 sw=8 ft=make:
# CSIE workstation linux meta-package

NAME=                   wslinux
USE_MACRO=              cpp
WSPKG_IN_COMMON=        wscommon.h
BACKEND=                debian
PKGNAME=                217-meta

include $(WSPKGDIR)/wspkg-mk/defaults.mk

DEBIAN_SIGN=            yes
DEBIAN_KEY_PKGSIGN=     DF9831FA

include $(WSPKGDIR)/wspkg-mk/packages.mk
