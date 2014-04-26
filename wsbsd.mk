# vim: set ts=8 sts=8 sw=8 ft=make:
# CSIE workstation bsd meta-package

# My name and my directories
NAME=                   wsbsd
INDIR=                  $(NAME)
OUTDIR=                 $(NAME)/out

# Platform-independent settings
USE_MACRO=              cpp
WSPKG_IN_COMMON=        packages.h
WSPKG_IN_PLATFORM_PKG=  $(INDIR)/$(NAME).pkg
WSPKG_IN_PLATFORM_SED=  $(INDIR)/$(NAME).sed
WSPKG_OUT_LIST=         $(OUTDIR)/$(NAME).list

# Backend-specific settings
BACKEND=                freebsd
FREEBSD_OUT_PORTS=      $(OUTDIR)/$(NAME).ports
FREEBSD_IN_MAKEFILE_IN= $(INDIR)/$(NAME).makefile.in
FREEBSD_OUT_MAKEFILE=   $(OUTDIR)/$(NAME).makefile

FREEBSD_IN_PKGDESC=     $(INDIR)/$(NAME).local.217.pkg-descr
FREEBSD_OUT_PKGDIR=     $(OUTDIR)/217
FREEBSD_OUT_PKGDESC=    $(FREEBSD_OUT_PKGDIR)/pkg-descr
FREEBSD_OUT_PKG=        $(FREEBSD_OUT_PKGDIR)/Makefile

# Update the ports tree
FREEBSD_OUT_PORTS_CATEGORY_MAKEFILE=     $(INDIR)/$(NAME).local.Makefile
FREEBSD_OUT_PORTS_CATEGORY_MAKEFILE_INC= $(INDIR)/$(NAME).local.Makefile.inc
FREEBSD_OUT_PORTS_CATEGORY=              local

include $(WSPKGDIR)/wspkg-mk/packages.mk

clean:
	rm -rf $(OUTDIR)

