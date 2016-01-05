#!/bin/sh

write_string_to_fd () {
	fd="$1"
	shift
	echo "$@" 1>&"$fd"
}

write_stdin_to_fd () {
	fd="$1"
	shift
	cat 1>&"$fd"
}

echo_cmd () {
	printf "\033[1;33mRunning command => \033[m"
	echo "$@"
	"$@"
	echo
}

export WRKDIR="/tmp/wspkg-build"
export WSPKGDIR="${WRKDIR}/wspkg"
export REPODIR="/usr/local/git/repositories"
export PORTSDIR="/usr/local/poudriere/ports/default"
unset  GIT_DIR

# Update sources
for repo in wspkg wspkg-data; do
	if [ '!' -d "${WRKDIR}/${repo}" ]; then
		echo_cmd git clone "${REPODIR}/${repo}.git" "${WRKDIR}/${repo}"
	else
		echo_cmd cd "${WRKDIR}/${repo}"
		echo_cmd git pull "${REPODIR}/${repo}.git"
	fi
done


# Fetch new index file
cd "${PORTSDIR}"
[ -z "${DEBUG}" ] && echo_cmd make fetchindex


# Setup wspkg
cd "${WRKDIR}/wspkg"
echo_cmd make ASCIIDOC=true PANDOC=true


# Generate lists from wslinux
cd "${WRKDIR}/wspkg-data"
echo_cmd ./build.sh wslinux wslinux/out/wslinux.list

exec 3< "wslinux/out/wslinux.list"
exec 4> "${WRKDIR}/wslinux.html"

while read pkg 0<&3; do
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
cd "${WRKDIR}/wspkg-data"
echo_cmd ./build.sh wsbsd wsbsd/out/wsbsd.ports

exec 3< "wsbsd/out/wsbsd.ports"
exec 4> "${WRKDIR}/wsbsd.html"

while read pkg origin 0<&3; do
	write_string_to_fd 4 "<li><a target='_blank' href='https://www.freshports.org/${origin}'>${pkg}</a></li>"
done

exec 3<&-
exec 4>&-


# Generate lists from pclab
cd "${WRKDIR}/wspkg-data"
echo_cmd ./build.sh pclab pclab/out/pclab.list

exec 3< "pclab/out/pclab.list"
exec 4> "${WRKDIR}/pclab.html"

while read pkg 0<&3; do
	write_string_to_fd 4 "<li><a target='_blank' href='http://packages.ubuntu.com/trusty/${pkg}'>${pkg}</a></li>"
done

exec 3<&-
exec 4>&-


# Copy to mrtg.csie.ntu.edu.tw
echo_cmd scp -i /usr/local/git/ssh-keys/to-mrtg \
	"${WRKDIR}/wslinux.html" \
	pkgbuild@mrtg.csie.ntu.edu.tw:/var/www/wslinux.html

echo_cmd scp -i /usr/local/git/ssh-keys/to-mrtg \
	"${WRKDIR}/wsbsd.html" \
	pkgbuild@mrtg.csie.ntu.edu.tw:/var/www/wsbsd.html

echo_cmd scp -i /usr/local/git/ssh-keys/to-mrtg \
	"${WRKDIR}/pclab.html" \
	pkgbuild@mrtg.csie.ntu.edu.tw:/var/www/pclab.html
