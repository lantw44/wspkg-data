#!/bin/sh

: "${PORTSDIR:="/usr/ports"}"
[ ! -d "${PORTSDIR}/.git" ] && \
    printf '%s is not a git checkout\n' "${PORTSDIR}" && exit 1

shdir="$(realpath "$(dirname "$0")")"
: "${shdir:="."}"

patchdir="${shdir}/patches"

cd "${PORTSDIR}" || exit
echo '==> Running git status ...'
git status -s | sed -e '/^?/d' -e 's#^[A-Z ]* *\([^/]*/[^/]*\)\(/.*\)*$#\1#' | \
    sort | uniq | (
    while read -r oneline; do
        printf '==> Generating patch for %s\n' "${oneline}"
        patch_name="$(printf '%s\n' "${oneline}" | tr '/' '_')"
        git diff -- "${oneline}" > "${patchdir}/${patch_name}.patch"
    done )
