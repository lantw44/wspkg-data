#!/bin/sh

: ${PORTSDIR:="/usr/ports"}
[ '!' -d "${PORTSDIR}/.svn" ] && \
    printf '%s is not a svn checkout\n' "${PORTSDIR}" && exit 1

shdir="$(realpath "$(dirname "$0")")"
: ${shdir:="."}

patchdir="${shdir}/patches"

cd ${PORTSDIR}
echo '==> Running svn status ...'
svn status | sed -e '/^?/d' -e 's#^[A-Z]* *\([^/]*\/[^/]*\)\(/.*\)*$#\1#' | \
    sort | uniq | (
    while read oneline; do
        printf '==> Generating patch for %s\n' "${oneline}"
        patch_name="$(printf '%s\n' "${oneline}" | tr '/' '_')"
        svn diff --patch-compatible "${oneline}" \
            > "${patchdir}/${patch_name}.patch"
    done )
