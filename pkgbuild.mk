# vim: set ts=8 sts=8 sw=8 ft=make:
# CSIE package builder

NAME=                   pkgbuild
USE_MACRO=              cpp
WSPKG_IN_COMMON=        pkgbuild.h
BACKEND=                freebsd
PKGNAME=                pkgbuild

include $(WSPKGDIR)/wspkg-mk/defaults.mk

# Put overrides here
FREEBSD_OUT_PORTS_CATEGORY_MAKEFILE=     /dev/null
FREEBSD_OUT_PORTS_CATEGORY_MAKEFILE_INC= /dev/null

include $(WSPKGDIR)/wspkg-mk/packages.mk
