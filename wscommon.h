// vim: ft=c: et

#define NULL
#undef linux

// Include platform-specific mapping files
#if   (defined LIST)
#elif (defined WSLINUX)
# include "wslinux/wslinux.pkg"
#elif (defined WSBSD)
# include "wsbsd/wsbsd.pkg"
#elif (defined WSARCH)
# include "wsarch/wsarch.pkg"
#else
# define WSPKG_NO_DEFAULT
# error "Neither WSLINUX nor WSBSD is defined!"
#endif

#ifndef WSPKG_NO_DEFAULT
# define WSPKG_KEYRING
# define WSPKG_STANDARD
# define WSPKG_SHELL
# define WSPKG_ADMIN
# define WSPKG_DATABASE
# define WSPKG_DEVEL
# define WSPKG_DOC
# define WSPKG_EDITORS
# define WSPKG_ELECTRONICS
# define WSPKG_FONTS
# define WSPKG_GNOME
# define WSPKG_GRAPHICS
# define WSPKG_HASKELL
# define WSPKG_INTERPRETERS
# define WSPKG_KDE
# define WSPKG_LIB
# define WSPKG_LISP
# define WSPKG_LUA
# define WSPKG_MACHINE_LEARNING
# define WSPKG_MAIL
# define WSPKG_MATH
# define WSPKG_MISC
# define WSPKG_NET
# define WSPKG_PARALLEL
# define WSPKG_PERL
# define WSPKG_PHP
# define WSPKG_PYTHON
# define WSPKG_RUBY
# define WSPKG_SCIENCE
# define WSPKG_SOUND
# define WSPKG_TEX
# define WSPKG_TEXT
# define WSPKG_UTILS
# define WSPKG_VIDEO
# define WSPKG_WAYLAND
# define WSPKG_WEB
# define WSPKG_WINDOWMAKER
# define WSPKG_X11
#endif

// ===========================================================================
// Packages definition started from here
// ===========================================================================

// Keyring
#ifdef WSPKG_KEYRING
#endif

// Standard
#ifdef WSPKG_STANDARD
ACL             ATTR            BC              BIND            CAP
FILE            FINGER          FTP             INETD           ISPELL
LESS            LOCATE          lsof            m4              MIME_SUPPORT
NCURSES_TERM    PATCH           PCI             PERL            PYTHON2
PYTHON3         SHARUTILS       SSH             STRACE          sudo
TELNET          texinfo         TIME            USB             WAMERICAN
wget            WHOIS
#endif

// Shell
#ifdef WSPKG_SHELL
bash            bash-completion KSH             TCSH            zsh
#endif

// Admin
#ifdef WSPKG_ADMIN
ACPI            CPUFREQ         CUPS            IOTOP           MENU
mcelog          MUNIN           PARTED          PAM_LDAPD       SYSSTAT
DEBSUMS
// freebsd local-217
PKG_MGMT        NET_SNMP        nagios-plugins  nsca-client
FDISK           GDISK           // added by b01902062@csie.ntu.edu.tw
#endif

// Database
#ifdef WSPKG_DATABASE
MYSQL_CLIENT    sqlite3
// required by 林俊宏 d01922030
PYMONGO
#endif

// Devel
#ifdef WSPKG_DEVEL
// debian 217-meta
ANT             autoconf        automake        bison           ccache
CLANG           cmake           cvs             ddd             f2c
flex            GCC             GDB             GOLANG          gperf
GIT             gprolog         INDENT          libtool         MAKE
MINGW           nasm            NODEJS          OPENJDK         scala
scons           SUBVERSION      TCL             TK              valgrind
// added by b01902104@csie.ntu.edu.tw
AARCH64_GCC     GDB_MULTIARCH
// freebsd local-217
ECLIPSE         expect          JIKES           mit-scheme
spim // 計算機結構
sdcc // 微算機實驗? (8051)
BIOJAVA         NCBI_TOOLKIT    doxygen         ocaml
// required by Wei-Sheng Chin d01944006
MONO
// requested by b01902066
julia
// added by b01902062@csie.ntu.edu.tw
ANDROID_TOOLS   bzr             mercurial       intltool        LLVM
ltrace          OPENCL          POCL
#endif

// Doc
#ifdef WSPKG_DOC
LIBC_DOC        MAKE_DOC        MANPAGES        MANPAGES_POSIX  PERL_DOC
PYTHON2_DOC     PYTHON3_DOC     TCL_DOC         TK_DOC
GCC_DOC         // added by b01902062@csie.ntu.edu.tw
#endif

// Editors
#ifdef WSPKG_EDITORS
CTAGS           EMACS           joe             LIBREOFFICE     nano
vim             VIM_GTK
cscope          global          // added by b01902062@csie.ntu.edu.tw
#endif

// Electronics
#ifdef WSPKG_ELECTRONICS
iverilog
#endif

// Fonts
#ifdef WSPKG_FONTS
// debian 217-meta
ARPHIC          BAEKMUK         CJKUNIFONTS     LIBERATION      IPAFONT
WQY             XFONTS_CYRILLIC XFONTS_INTL_CHINESE             XFONTS_WQY
// freebsd local-217
TERMINUS        URWFONTS        NONFREE_FONTS   KCFONTS         FIREFLYTTF
// added by b01902062@csie.ntu.edu.tw
NOTO            SOURCESANSPRO   SOURCECODEPRO
#endif

// GNOME
#ifdef WSPKG_GNOME
// debian 217-meta
ALACARTE        evince          file-roller     GDM             gnome-backgrounds
gnome-calculator                gnome-keyring   gnome-nettool
GNOME_USER_DOCS GTK2_ENGINES    GVFS            REMMINA
seahorse        xdg-user-dirs   zenity          MUTTER
// freebsd local-217
GNOME_META_PKG
// added by b01902062@linux5.csie.ntu.edu.tw
BAOBAB          devhelp         epiphany        eog             eog-plugins
gedit           ghex            GLADE
GTK2            GTK3            GTK2_THEMES     GTK3_THEMES
gnome-terminal  GNOME_SCREENSHOT                gnome-tweak-tool
gnome-system-monitor            gucharmap       nautilus        vinagre
#endif

// Graphics
#ifdef WSPKG_GRAPHICS
// debian 217-meta
gimp            IMAGEMAGICK     JPEG            graphviz
// freebsd local-217
BMEPS           XGRAPH          xloadimage
#endif

// Haskell
#ifdef WSPKG_HASKELL
ghc             HUGS            HASKELL_PLATFORM                HASKELL_OPENGL
#endif

// Interpreters
#ifdef WSPKG_INTERPRETERS
gawk            SWIG
#endif

// KDE
#ifdef WSPKG_KDE
// freebsd local-217
KDE_META_PKG
KDE_GTK_CONFIG  kchmviewer      OKULAR          // added by b01902062@csie.ntu.edu.tw
ADWAITA_QT      QT4_QTCONFIG    QT5_QTCT        // added by b01902062@csie.ntu.edu.tw
#endif

// Lib
#ifdef WSPKG_LIB
LIBC_DEV        LIBEVENT_DEV    FFTW_DEV        GSL_DEV         JPEG_DEV
LTDL_DEV        NCURSES_DEV     QT4_DEV         QT5_DEV         PERL_DEV
MYSQLXX_DEV     OPENMPI_DEV     GFLAGS_DEV      BOOST_DEV       IMLIB2_DEV
EXOSIP2_DEV     // voip
OPENCV_DEV      // opencv suite
FFMPEG_DEV      // ffmpeg suite
SDL_DEV
POPPLER_DEV
PWQUALITY_DEV   // check password quality on workstations
// requested by b01902082@csie.ntu.edu.tw
LEVELDB_DEV     SNAPPY_DEV      HDF5_DEV        GOOGLE_GLOG_DEV LMDB_DEV
// required by d97024@csie.ntu.edu.tw
LIBSQLITE3_DEV
// added by b01902066@csie.ntu.edu.tw
ZMQ_DEV         LIBXML2_DEV
// added by r03922099@csie.ntu.edu.tw
LIBDB_CXX_DEV
#endif

// Lisp
#ifdef WSPKG_LISP
CLISP
#endif

// Lua
#ifdef WSPKG_LUA
LUA51           LUA52           LUA53
#endif

// Machine Learning
#ifdef WSPKG_MACHINE_LEARNING
weka
LIBSVM          LIBLINEAR // requested by b01902066
LIBOPENBLAS     // requested by b01902082
#endif

// Mail and News
#ifdef WSPKG_MAIL
// debian 217-meta
alpine          fetchmail       mpack           mutt            MAILX
// freebsd local-217
tin             METAMAIL
VM              // requested by cj
abook           // added by b01902062@csie.ntu.edu.tw
#endif

// Math
#ifdef WSPKG_MATH
GSL             gnuplot         octave          OCTAVE_DEV      QHULL
R_BASE
SYMPY           // added by b01902066
LAPACKE         // added by b01902066
#endif

// Misc
#ifdef WSPKG_MISC
BIG5WIDTH       GNUPG           KERNEL_PACKAGE  poppler-data    screen
tmux            XSLTPROC        PROTOBUF
LINUXTOOL       // 計算機結構
#endif

// Net
#ifdef WSPKG_NET
DENYHOSTS       filezilla       iftop           irssi           lftp
MTR             ncftp           nmap            oidentd         rsync
STUNNEL         tcpdump         VNCVIEWER       curl            aria2
mosh            NS2             ns3
// freebsd local-217
BSDFTPD_SSL     lrzsz           OMNITTY         pidgin          rdesktop
rrdtool         tcptraceroute   TRAFSHOW        urlview
// added by b01902062@csie.ntu.edu.tw
x11vnc          SPICE_CLIENT    XSPICE          ldapvi          GNUTLS_CLI
PCMANX
LOUDMOUTH       // requested by b01902109
#endif

// Parallel Programming
#ifdef WSPKG_PARALLEL
mpich2
#endif

// Perl
#ifdef WSPKG_PERL
PERL_BDB        PERL_DATA_SERIALIZER            PERL_DBD_MYSQL  PERL_DBD_SQLITE3
PERL_IO_ALL     PERL_JSON       PERL_LIBWWW
// freebsd local-217
PERL_ARRAY_INTSPAN              PERL_BIOPERL
PERL_DBI        PERL_MAIL_SENDER
PERL_SET_INTSPAN                PERL_SET_WINDOW PERL_SET_INFINITE
PERL_PAR                        PERL_PERL_TIDY  PERL_WWW_MECHANIZE
PERL_WWW_MECHANIZE_SHELL        PERL_WWW_ROBOT  PERL_XML_SAX_EXPAT
PERL_SWITCH     // required by /root/wsmon
#endif

// PHP
#ifdef WSPKG_PHP
PHP_CLI         PHP_MYSQL       // request by b92093@csie.ntu.edu.tw
#endif

// Python
#ifdef WSPKG_PYTHON
IPYTHON         // PYTHON2 and PYTHON3 are included in standard section
PYPY            PYTHON_PIP      // added by b01902062@csie.ntu.edu.tw
PYTHON_BSDDB3   PYTHON_IMAGING  PYTHON_NUMPY    PYTHON_SETUPTOOLS
PYTHON_GSL      PYTHON_SCIPY
// request by d97009@csie.ntu.edu.tw
PYTHON_MARKDOWN PYTHON_MEMPROF  PYTHON_PSUTIL   PYTHONTRACER
// by request
PYTHON_MYSQLDB  PYTHON_CJSON    PYTHON_SQLITE   PYTHON_BEAUTIFULSOUP
PYTHON_TK       PYTHON_SIMPLEJSON               PYTHON_MATPLOTLIB
PYTHON_LXML     PYTHON_OPENCV   PYTHON_COGENT   PYTHON_REDIS    PYTHON_YAML
PYTHON_GDATA    PYTHON_CURL     PYTHON_LDAP     PYTHON_SMBPASSWD
PYTHON_SPHINX   PYTHON_SCIKITS_LEARN            PYTHON_IGRAPH
PYTHON_PSYCOPG2 PYTHON_NETWORKX PYTHON_VIRTUALENV
// request by puffer
PYTHON_NUMERIC
// kdd
PYTHON_PANDAS
// request by b00902104@csie.ntu.edu.tw
PYTHON_PYQUERY
// request by d01922030@csie.ntu.edu.tw
PYTHON_NLTK PYTHON_JIEBA
// request by d05922014@csie.ntu.edu.tw
PYTHON_CRYPTO
#endif

// Ruby
#ifdef WSPKG_RUBY
RUBY            RUBY_BUNDLER    RUBY_MYSQL      RUBY_RAKE       RUBY_RAILS
#endif

// Science
#ifdef WSPKG_SCIENCE
BLAST2          BLITZ
#endif

// Sound
#ifdef WSPKG_SOUND
ALSA            alsa-utils      audacity
#endif

// TeX
#ifdef WSPKG_TEX
// debian 217-meta
AUCTEX          bibtool         LATEX_CJK       latex2html      BIBER
TEXLIVE
TEXLIVE_FULL    // Added by Artoo on 2008.12.14, requested by cjlin@csie.ntu.edu.tw
// freebsd local-217
BG5PS           HYPERLATEX      ipe             transfig
#endif

// Text
#ifdef WSPKG_TEXT
// debian 217-meta
a2ps            ASPELL_EN       DICT            poppler-data    gv
MPAGE           POPPLER_UTILS   psutils         recode          SPELL
xpdf            html2ps         zh-autoconvert
// freebsd local-217
C2PS            DJVULIBRE       ENSCRIPT        pstotext        wv
XPDF_ZH_FONTS
pdftk           // Added by lydian on 2011/8/3, requested by cjlin
// added by b01902062@csie.ntu.edu.tw
asciidoc        MARKDOWN        PANDOC
#endif

// Utils
#ifdef WSPKG_UTILS
// debian 217-meta
BZIP2           fakeroot        GPW             geeqie          LM_SENSORS
PROCINFO        scim            SCIM_CHEWING    pv              rar
tree            TOFRODOS        unrar           unzip           xdg-utils
zip
// freebsd local-217
GCIN            GKRELLM         GNULS           keychain        mc
netpbm          OXIM            SCIM_PINYIN     SCIM_TABLES     TIDY
// added by b01902062@csie.ntu.edu.tw
BSDCPIO         BSDTAR          bochs           CDIALOG         cgdb
chrpath         convmv          DEV86           diffstat        FAKECHROOT
fdupes          HTE             htop            meld            MENUMAKER
MKISOFS         ncdu            patchelf        pax-utils       PSTREE
QEMU            RANGER          rpm2cpio        socat           tig
UIM_FEP         UNAR            UNIX2DOS        upx             WATCH
// added by b01902062@csie.ntu.edu.tw
IBUS_CHEWING    parallel
// added by b01902062@csie.ntu.edu.tw - several compressing utilities
pigz            pbzip2          pxz
lzip            lrzip           RZIP
squashfs-tools
// added by b01902104@csie.ntu.edu.tw
rlwrap
//added by b03902074@csie.ntu.edu.tw
SHELLCHECK
//added by b03902074@csie.ntu.edu.tw
ACK             SILVER_SEARCHER
#endif

// Video
#ifdef WSPKG_VIDEO
MPLAYER         xmms2           GXMMS2          X264
#endif

// Wayland
#ifdef WSPKG_WAYLAND
// added by b01902062@csie.ntu.edu.tw
IBUS_WAYLAND    WESTON          XWAYLAND
#endif

// Web
#ifdef WSPKG_WEB
FLASH_PLUGIN    FIREFOX         lynx            w3m             W3M_EL
JAVA_PLUGIN     // added by b01902062@csie.ntu.edu.tw
#endif

// WindowMaker
#ifdef WSPKG_WINDOWMAKER
PCLOCK          WINDOWMAKER     wmbiff          wmweather+      wmnd
wmcpuload       wmmemload       wmtop           WMCALCLOCK      wmclock
wmclockmon      wmtime          WMTIMER         wmcliphist      TEMPERATURE_APP
ASBUTTON
#endif

// X11
#ifdef WSPKG_X11
// debian 217-meta
afterstep       DESKTOP_BASE    fvwm            IM_SWITCH       mlterm
MLTERM_TOOLS    rxvt            RXVT_ML         VNCSERVER       xchm
xorg            xscreensaver    xterm           XVFB
// freebsd local-217
ENLIGHTENMENT   icewm           synergy         wdm             xfig
xlockmore
// added by b01902062@csie.ntu.edu.tw
fbpanel         obconf          openbox         XEPHYR          xrestop
// added by b03902048@csie.ntu.edu.tw
LXDE
#endif
