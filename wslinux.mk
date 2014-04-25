# vim: set ts=8 sts=8 sw=8 ft=make:
# CSIE workstation linux meta-package

# My name and my directories
NAME=                   wslinux
INDIR=                  $(NAME)
OUTDIR=                 $(NAME)/out

# Platform-independent settings
USE_MACRO=              cpp
WSPKG_IN_COMMON=        packages.h
WSPKG_IN_PLATFORM_PKG=  $(INDIR)/$(NAME).pkg
WSPKG_IN_PLATFORM_SED=  $(INDIR)/$(NAME).sed
WSPKG_OUT_LIST=         $(OUTDIR)/$(NAME).list

# Backend-specific settings
BACKEND=                debian
DEBIAN_IN_CONTROL_IN=   $(INDIR)/$(NAME).control.in
DEBIAN_OUT_CONTROL=     $(OUTDIR)/$(NAME).control
DEBIAN_OUT_PKGDIR=      $(OUTDIR)/217-meta
DEBIAN_OUT_PKG=         $(OUTDIR)/217-meta.deb

# Repository
DEBIAN_OUT_REPO=        $(OUTDIR)/repo

include $(WSPKGDIR)/$(WSPKG_MK)/packages.mk

clean:
	rm -rf $(OUTDIR)
