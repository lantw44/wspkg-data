#!/bin/sh

write_string_to_fd () {
	printf '%s\n' "$2" 1>&"$1"
}

write_stdin_to_fd () {
	cat 1>&"$1"
}

echo_cmd () {
	printf '\033[1;33mRunning command =>\033[m'
	for arg in "$@"; do
		printf ' %s' "${arg}"
	done
	printf '\n'
	"$@"
	printf '\n'
}

cleanup () {
	rm -r -- "${WRKDIR}"
}

# Create a workspace
WRKDIR="$(mktemp -d)"
trap cleanup EXIT

export WSPKGDIR="${WRKDIR}/wspkg"
export REPODIR="/usr/local/git/repositories"
export PORTSDIR="/usr/local/poudriere/ports/default"
unset  GIT_DIR

# Fetch sources
for repo in wspkg wspkg-data; do
	echo_cmd git clone -- "${REPODIR}/${repo}.git" "${WRKDIR}/${repo}"
done


# Fetch new index file
cd "${PORTSDIR}" || exit
[ -z "${DEBUG}" ] && echo_cmd make fetchindex


# Setup wspkg
cd "${WRKDIR}/wspkg" || exit
echo_cmd make ASCIIDOC=true PANDOC=true


# Generate lists from wslinux
cd "${WRKDIR}/wspkg-data" || exit
echo_cmd ./build.sh wslinux wslinux/out/wslinux.list

exec 3< "wslinux/out/wslinux.list"
exec 4> "${WRKDIR}/wslinux.html"

while read -r pkg 0<&3; do
	case "${pkg}" in
		tigervnc*)
			write_string_to_fd 4 "<li><a target='_blank' href='http://neuro.debian.net/pkgs/${pkg}.html'>${pkg}</a></li>"
			;;
		python-jieba)
			write_string_to_fd 4 "<li><a target='_blank' href='https://github.com/fxsjy/jieba'>${pkg}</a></li>"
			;;
		*)
			write_string_to_fd 4 "<li><a target='_blank' href='https://packages.debian.org/testing/${pkg}'>${pkg}</a></li>"
			;;
	esac
done

exec 3<&-
exec 4>&-


# Generate pages for wsbsd
cd "${WRKDIR}/wspkg-data" || exit
echo_cmd ./build.sh wsbsd wsbsd/out/wsbsd.ports

exec 3< "wsbsd/out/wsbsd.ports"
exec 4> "${WRKDIR}/wsbsd.html"

while read -r pkg origin _ 0<&3; do
	write_string_to_fd 4 "<li><a target='_blank' href='https://www.freshports.org/${origin}'>${pkg}</a></li>"
done

exec 3<&-
exec 4>&-


# Generate lists from pclab
cd "${WRKDIR}/wspkg-data" || exit
echo_cmd ./build.sh pclab pclab/out/pclab.list

exec 3< "pclab/out/pclab.list"
exec 4> "${WRKDIR}/pclab.html"

while read -r pkg 0<&3; do
	write_string_to_fd 4 "<li><a target='_blank' href='http://packages.ubuntu.com/trusty/${pkg}'>${pkg}</a></li>"
done

exec 3<&-
exec 4>&-


# Copy to mrtg.csie.ntu.edu.tw
echo_cmd scp -i /usr/local/git/ssh-keys/to-mrtg -- \
	"${WRKDIR}/wslinux.html" \
	pkgbuild@mrtg.csie.ntu.edu.tw:/var/www/wslinux.html

echo_cmd scp -i /usr/local/git/ssh-keys/to-mrtg -- \
	"${WRKDIR}/wsbsd.html" \
	pkgbuild@mrtg.csie.ntu.edu.tw:/var/www/wsbsd.html

echo_cmd scp -i /usr/local/git/ssh-keys/to-mrtg -- \
	"${WRKDIR}/pclab.html" \
	pkgbuild@mrtg.csie.ntu.edu.tw:/var/www/pclab.html
