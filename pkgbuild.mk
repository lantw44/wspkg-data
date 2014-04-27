# vim: set ts=8 sts=8 sw=8 ft=make:
# CSIE package builder

# My name and my directories
NAME=                   pkgbuild
INDIR=                  $(NAME)
OUTDIR=                 $(NAME)/out

# Platform-independent settings
USE_MACRO=              cpp
WSPKG_IN_COMMON=        pkgbuild.h
WSPKG_IN_PLATFORM_PKG=  $(INDIR)/$(NAME).pkg
WSPKG_IN_PLATFORM_SED=  $(INDIR)/$(NAME).sed
WSPKG_OUT_LIST=         $(OUTDIR)/$(NAME).list

# Backend-specific settings
BACKEND=                freebsd
FREEBSD_OUT_PORTS=      $(OUTDIR)/$(NAME).ports
FREEBSD_IN_MAKEFILE_IN= $(INDIR)/$(NAME).makefile.in
FREEBSD_OUT_MAKEFILE=   $(OUTDIR)/$(NAME).makefile

FREEBSD_IN_PKGDESC=     $(INDIR)/$(NAME).local.pkgbuild.pkg-descr
FREEBSD_OUT_PKGDIR=     $(OUTDIR)/pkgbuild
FREEBSD_OUT_PKGDESC=    $(FREEBSD_OUT_PKGDIR)/pkg-descr
FREEBSD_OUT_PKG=        $(FREEBSD_OUT_PKGDIR)/Makefile

# Update the ports tree
FREEBSD_OUT_PORTS_CATEGORY_MAKEFILE=     /dev/null
FREEBSD_OUT_PORTS_CATEGORY_MAKEFILE_INC= /dev/null
FREEBSD_OUT_PORTS_CATEGORY=              local

include $(WSPKGDIR)/wspkg-mk/packages.mk

clean:
	rm -rf $(OUTDIR)

