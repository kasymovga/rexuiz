.PHONY: all clean engine fetch-build-data stand-alone stand-alone-data stand-alone-engine update-qc gmqcc
PWD=$(shell pwd)

DATA_FILES_NEXUIZ=common-spog.pk3 data20091001.pk3
DPDIR=DarkPlacesRM

ifneq ($(CROSSPREFIX),)
CC=$(CROSSPREFIX)-gcc
CXX=$(CROSSPREFIX)-g++
AR=$(CROSSPREFIX)-ar
RANLIB=$(CROSSPREFIX)-ranlib
STRIP=$(CROSSPREFIX)-strip
else
CC=gcc
CXX=g++
AR=ar
RANLIB=ranlib
STRIP=strip
endif
LD=$(CC)

ifeq ($(shell uname -s),Linux)
ifeq ($(shell uname -m),x86_64)
DPTARGET=linux64
else
DPTARGET=linux32
endif
else
ifeq ($(shell uname -s),Darwin)
ifeq ($(shell uname -m),x86_64)
DPTARGET=mac64
else
DPTARGET=mac32
endif
else
ifeq ($(shell uname -m),x86_64)
DPTARGET=win64
else
DPTARGET=win32
endif
endif
endif

LIBDIR=$(PWD)/libs/$(DPTARGET)/
LIBSAMPLERATEDIR=libsamplerate-0.1.9
LIBSAMPLERATETARGZ=libsamplerate-0.1.9.tar.gz
LIBSAMPLERATEFILES=$(LIBDIR)/lib/libsamplerate.a
LIBPNGDIR=libpng-1.6.36
LIBPNGTARGZ=$(LIBPNGDIR).tar.gz
LIBPNGFILES=$(LIBDIR)/lib/libpng.a $(LIBDIR)/lib/libpng16.a
ZLIBDIR=zlib-1.2.11
ZLIBTARGZ=$(ZLIBDIR).tar.gz
ZLIBFILES=$(LIBDIR)/lib/libz.a
JPEGTARGZ=jpegsrc.v9d.tar.gz
JPEGDIR=jpeg-9d
JPEGFILES=$(LIBDIR)/lib/libjpeg.a
SDLDIR=SDL2-2.0.16
SDLTARGZ=$(SDLDIR).tar.gz
SDLFILES=$(LIBDIR)/bin/sdl2-config
LIBMICROHTTPDFILES=$(LIBDIR)/lib/libmicrohttpd.a
FREETYPEDIR=freetype-2.7
FREETYPETARGZ=$(FREETYPEDIR).tar.gz
CURLDIR=curl-7.68.0
CURLTARGZ=$(CURLDIR).tar.gz
LIBOGGDIR=libogg-1.3.2
LIBOGGTARGZ=$(LIBOGGDIR).tar.gz
LIBOGGFILES=$(LIBDIR)/lib/libogg.a
LIBVORBISDIR=libvorbis-1.3.5
LIBVORBISTARGZ=$(LIBVORBISDIR).tar.gz
LIBVORBISFILES=$(LIBDIR)/lib/libvorbis.a $(LIBDIR)/lib/libvorbisenc.a $(LIBDIR)/lib/libvorbisfile.a
LIBTHEORADIR=libtheora-1.1.1
LIBTHEORATARGZ=$(LIBTHEORADIR).tar.gz
LIBTHEORAFILES=$(LIBDIR)/lib/libtheora.a $(LIBDIR)/lib/libtheoraenc.a
LIBMICROHTTPDDIR=libmicrohttpd-0.9.55
LIBMICROHTTPDTARGZ=$(LIBMICROHTTPDDIR).tar.gz
DPMAKEOPTS=CC='$(CC) -I$(LIBDIR)/include/SDL2 -I$(LIBDIR)/include -L$(LIBDIR)/lib' LD='$(CC) -L$(LIBDIR)/lib' STRIP=$(STRIP) DP_LINK_ZLIB=shared DP_LINK_JPEG=shared DP_LINK_PNG=shared SDL_CONFIG='$(LIBDIR)/bin/sdl2-config' DP_SDL_STATIC=yes DP_LIBMICROHTTPD=static DP_LINK_OGGVORBIS=static DP_LINK_ZLIB=static DP_LINK_JPEG=static DP_LINK_PNG=static $(DPMAKEOPTS_EXTRA)

ifeq ($(DPTARGET),linux32)
ARCHSUFFIX=i686
DPTARGET_LINUX=y
DPMAKEOPTS:=$(DPMAKEOPTS) DP_MAKE_TARGET=linux
endif
ifeq ($(DPTARGET),linux64)
ARCHSUFFIX=x86_64
DPTARGET_LINUX=y
DPMAKEOPTS:=$(DPMAKEOPTS) DP_MAKE_TARGET=linux
endif
ifeq ($(DPTARGET),win32)
DPMAKEOPTS:=$(DPMAKEOPTS) DP_MAKE_TARGET=mingw TARGET=$(CROSSPREFIX) LIB_LIBMICROHTTPD='-lmicrohttpd -lws2_32' OBJ_ICON=rexuiz.o
DPTARGET_WIN=y
ARCHSUFFIX=i686
endif
ifeq ($(DPTARGET),win64)
DPMAKEOPTS:=$(DPMAKEOPTS) DP_MAKE_TARGET=mingw TARGET=$(CROSSPREFIX) MINGWARCH=x86_64 LIB_LIBMICROHTTPD='-lmicrohttpd -lws2_32' OBJ_ICON=rexuiz.o
DPTARGET_WIN=y
ARCHSUFFIX=x86_64
endif
ifeq ($(DPTARGET),mac32)
ARCHSUFFIX=i686
DPTARGET_MAC=y
endif
ifeq ($(DPTARGET),mac64)
ARCHSUFFIX=x86_64
DPTARGET_MAC=y
endif
ifeq ($(DPTARGET),android)
EXTRALIBS_LINKONLY=$(LIBOGGFILES) $(LIBVORBISFILES)
SDLDEPS=
else
EXTRALIBS_LINKONLY=$(LIBOGGFILES) $(LIBVORBISFILES) $(LIBTHEORAFILES)
SDLDEPS=$(LIBSAMPLERATEFILES)
endif
ifeq ($(DPTARGET_WIN),y)
FREETYPEFILES=$(LIBDIR)/bin/libfreetype-6.dll
CURLFILES=$(LIBDIR)/bin/libcurl-4.dll
EXTRALIBS=$(FREETYPEFILES) $(CURLFILES)
else
ifeq ($(DPTARGET_MAC),y)
DPMAKEOPTS:=$(DPMAKEOPTS) DP_MAKE_TARGET=macosx
FREETYPEFILES=$(LIBDIR)/lib/libfreetype.dylib
CURLFILES=$(LIBDIR)/lib/libcurl.dylib
EXTRALIBS=
else
ifeq ($(DPTARGET),android)
DPMAKEOPTS:=$(DPMAKEOPTS) DP_FS_BASEDIR=/sdcard/Rexuiz/ DP_MAKE_TARGET=android DP_VIDEO_CAPTURE=disabled
EXTRALIBS=
else
DPMAKEOPTS:=$(DPMAKEOPTS) DP_FS_BASEDIR=/usr/share/rexuiz/
FREETYPEFILES=$(LIBDIR)/lib/libfreetype.so
CURLFILES=$(LIBDIR)/lib/libcurl.so
EXTRALIBS=$(CURLFILES)
endif
endif
endif

SDLFILES_FORDP=$(SDLFILES)


all: stand-alone

nexuiz-252.zip:
	wget -O temp_$@ "http://downloads.sourceforge.net/project/nexuiz/NexuizRelease/Nexuiz%202.5.2/$@"
	mv temp_$@ $@

$(CURLTARGZ):
	wget -O temp_$@ https://curl.haxx.se/download/$@
	mv temp_$@ $@

$(LIBOGGTARGZ):
	wget -O temp_$@ http://downloads.xiph.org/releases/ogg/$@
	mv temp_$@ $@

$(LIBVORBISTARGZ):
	wget -O temp_$@ http://downloads.xiph.org/releases/vorbis/$@
	mv temp_$@ $@

$(LIBTHEORATARGZ):
	wget -O temp_$@ http://downloads.xiph.org/releases/theora/$@
	mv temp_$@ $@

$(FREETYPETARGZ):
	wget -O temp_$@ http://download.savannah.gnu.org/releases/freetype/$@
	mv temp_$@ $@

$(SDLTARGZ):
	wget -O temp_$@ https://www.libsdl.org/release/$@
	mv temp_$@ $@

$(JPEGTARGZ):
	wget -O temp_$@ http://www.ijg.org/files/$@
	mv temp_$@ $@

$(ZLIBTARGZ):
	wget -O temp_$@ http://zlib.net/$@
	mv temp_$@ $@

$(LIBPNGTARGZ):
	wget -O temp_$@ http://prdownloads.sourceforge.net/libpng/libpng-1.6.36.tar.gz?download
	mv temp_$@ $@

$(LIBSAMPLERATETARGZ):
	wget -O temp_$@ http://www.mega-nerd.com/SRC/$@
	mv temp_$@ $@

$(LIBMICROHTTPDTARGZ):
	wget -O temp_$@ http://ftp.gnu.org/gnu/libmicrohttpd/$@
	mv temp_$@ $@

$(LIBPNGFILES): $(LIBPNGTARGZ) $(ZLIBFILES)
	tar xzf $(LIBPNGTARGZ)
	cd $(LIBPNGDIR) && CC="$(CC) -I$(LIBDIR)/include -L$(LIBDIR)/lib" CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib" ./configure --host=$(CROSSPREFIX) --disable-shared --enable-static --prefix=$(LIBDIR) && make && make install

$(LIBSAMPLERATEFILES): $(LIBSAMPLERATETARGZ)
	tar xzf $(LIBSAMPLERATETARGZ)
	cd $(LIBSAMPLERATEDIR) && ./configure --host=$(CROSSPREFIX) --disable-shared --enable-static --prefix=$(LIBDIR) && make && make install

$(ZLIBFILES): $(ZLIBTARGZ)
	tar xzf $(ZLIBTARGZ)
	cd $(ZLIBDIR) && CC="$(CC)" AR="$(AR)" RANLIB="$(RANLIB)" ./configure --static --prefix=$(LIBDIR)
	cd $(ZLIBDIR) && make && make install
	$(RANLIB) $(LIBDIR)/lib/libz.a

$(JPEGFILES): $(JPEGTARGZ)
	tar xzf $(JPEGTARGZ)
	cd $(JPEGDIR) && CC="$(CC)" ./configure --disable-shared --host=$(CROSSPREFIX) --enable-static --prefix=$(LIBDIR) && make && make install

$(FREETYPEFILES): $(FREETYPETARGZ)
	tar xzf $(FREETYPETARGZ)
	cd $(FREETYPEDIR) && CC="$(CC)" ./configure --enable-shared --host=$(CROSSPREFIX) --disable-static --prefix=$(LIBDIR) && make && make install

$(CURLFILES): $(CURLTARGZ)
	tar xzf $(CURLTARGZ)
ifeq ($(DPTARGET_WIN),y)
	cd $(CURLDIR) && CC="$(CC) -static-libgcc" ./configure --without-zlib --enable-shared --host=$(CROSSPREFIX) --disable-static --prefix=$(LIBDIR) --disable-pthreads && make && make install
else
	cd $(CURLDIR) && CC="$(CC)" ./configure --without-ssl --without-gnutls --without-zlib --enable-shared --host=$(CROSSPREFIX) --disable-static --prefix=$(LIBDIR) && make && make install
endif

$(LIBOGGFILES): $(LIBOGGTARGZ)
	tar xzf $(LIBOGGTARGZ)
	cd $(LIBOGGDIR) && CC="$(CC)" ./configure --disable-shared --host=$(CROSSPREFIX) --enable-static --prefix=$(LIBDIR) && make && make install

$(LIBVORBISFILES): $(LIBVORBISTARGZ) $(LIBOGGFILES)
	tar xzf $(LIBVORBISTARGZ)
ifeq ($(DPTARGET),android)
	sed -i 's/-mno-ieee-fp//' $(LIBVORBISDIR)/configure
endif
	cd $(LIBVORBISDIR) && PKG_CONFIG_PATH="$(LIBDIR)/lib/pkgconfig" CC="$(CC)" CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib" ./configure --disable-shared --host=$(CROSSPREFIX) --enable-static --prefix=$(LIBDIR) && make && make install

$(LIBTHEORAFILES): $(LIBTHEORATARGZ) $(LIBOGGFILES)
	tar xzf $(LIBTHEORATARGZ)
	tr -d '\015' < $(LIBTHEORADIR)/win32/xmingw32/libtheoradec-all.def > $(LIBTHEORADIR)/win32/xmingw32/libtheoradec-all.def.fixed
	mv $(LIBTHEORADIR)/win32/xmingw32/libtheoradec-all.def.fixed $(LIBTHEORADIR)/win32/xmingw32/libtheoradec-all.def
	tr -d '\015' < $(LIBTHEORADIR)/win32/xmingw32/libtheoraenc-all.def > $(LIBTHEORADIR)/win32/xmingw32/libtheoraenc-all.def.fixed
	mv $(LIBTHEORADIR)/win32/xmingw32/libtheoraenc-all.def.fixed $(LIBTHEORADIR)/win32/xmingw32/libtheoraenc-all.def
ifeq ($(DPTARGET_WIN),y)
	cd $(LIBTHEORADIR) && CC="$(CC) -static-libgcc" CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib -static-libgcc" ./configure --disable-examples --disable-shared --host=$(CROSSPREFIX) --enable-static --prefix=$(LIBDIR) --disable-examples && make && make install
else
ifeq ($(ARCHSUFFIX),x86_64)
	cd $(LIBTHEORADIR) && CC="$(CC)" CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib" ./configure --disable-shared --host=$(CROSSPREFIX) --disable-examples --enable-static --prefix=$(LIBDIR) && make && make install
else
	cd $(LIBTHEORADIR) && CC="$(CC)" CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib" ./configure --disable-shared --host=$(CROSSPREFIX) --disable-examples --enable-static --prefix=$(LIBDIR) --disable-asm && make && make install
endif
endif

$(LIBMICROHTTPDFILES): $(LIBMICROHTTPDTARGZ)
	tar xzf $(LIBMICROHTTPDTARGZ)
	cd $(LIBMICROHTTPDDIR) && CC="$(CC)" CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib" ./configure --disable-shared --host=$(CROSSPREFIX) --enable-static --disable-https --prefix=$(LIBDIR) && make && make install

$(SDLFILES): $(SDLTARGZ) $(SDLDEPS)
	tar xzf $(SDLTARGZ)
ifeq ($(DPTARGET_WIN),y)
	cd $(SDLDIR) && CC="$(CC)" CXX="$(CXX)" host_os=mingw CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib" ./configure --host=$(CROSSPREFIX) --target=$(CROSSPREFIX) --enable-static --disable-shared --enable-libsamplerate --disable-libsamplerate-shared --prefix=$(LIBDIR)
	cd $(SDLDIR) && make
	cd $(SDLDIR) && make install
else
ifeq ($(DPTARGET_MAC),y)
	cd $(SDLDIR) && CC="$(CC)" CXX="$(CXX)" CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib" ./configure --host=$(CROSSPREFIX) --target=$(CROSSPREFIX) --x-includes=$(MAC_OS_SDK)/usr/include --disable-cpuinfo --disable-video-x11 --enable-static --disable-shared --prefix=$(LIBDIR) && make && make install
else
ifeq ($(DPTARGET),android)
	cd $(SDLDIR) && CC="$(CC)" CXX="$(CXX)" CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib" ./configure --oldincludedir=$(LIBDIR)/include --host=$(CROSSPREFIX) --target=$(CROSSPREFIX) --enable-static --disable-shared --prefix=$(LIBDIR) --disable-libsamplerate --disable-pulseaudio --disable-video-x11 --disable-video-wayland && make && make install
	sed -i 's/-I\/usr\/include//' $(LIBDIR)/bin/sdl2-config
else
	cd $(SDLDIR) && CC="$(CC)" CXX="$(CXX)" CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib" ./configure --host=$(CROSSPREFIX) --target=$(CROSSPREFIX) --enable-static --disable-shared --prefix=$(LIBDIR) && make && make install
endif
endif
endif

clean:
	rm -rf $(ZLIBDIR) $(JPEGDIR) $(LIBPNGDIR) $(SDLDIR) $(LIBDIR) $(LIBOGGDIR) $(LIBVORBISDIR) $(LIBTHEORADIR) $(CURLDIR) $(FREETYPEDIR) $(LIBMICROHTTPDDIR) $(LIBSAMPLERATEDIR) package
	cd $(DPDIR) && make clean

engine: $(LIBPNGFILES) $(JPEGFILES) $(ZLIBFILES) $(SDLFILES_FORDP) $(EXTRALIBS_LINKONLY) $(LIBMICROHTTPDFILES)
ifeq ($(DPTARGET),android)
	cd $(DPDIR) && PKG_CONFIG_PATH="$(LIBDIR)/lib/pkgconfig" make android-rexuiz $(DPMAKEOPTS)
else
	cd $(DPDIR) && PKG_CONFIG_PATH="$(LIBDIR)/lib/pkgconfig" make sdl-rexuiz sv-rexuiz $(DPMAKEOPTS)
endif

fetch-build-data: nexuiz-252.zip $(LIBPNGTARGZ) $(JPEGTARGZ) $(SDLTARGZ) $(ZLIBTARGZ) $(FREETYPETARGZ) $(CURLTARGZ) $(LIBOGGTARGZ) $(LIBVORBISTARGZ) $(LIBTHEORATARGZ)

stand-alone: stand-alone-data stand-alone-engine

stand-alone-data: nexuiz-252.zip
	make update-qc
	mkdir -m 755 -p Rexuiz/sources
	mkdir -m 755 -p Rexuiz/data/dlcache
	rm -f Rexuiz/data/rexuiz.pk3
	rm -f Rexuiz/data/rexuiz-data.pk3
	cd rexuiz.pk3 && zip -r ../Rexuiz/data/rexuiz.pk3 *
	cd rexuiz-data.pk3 && zip -r ../Rexuiz/data/rexuiz-data.pk3 *
	test -f Rexuiz/data/data20091001.pk3 || unzip -j nexuiz-252.zip Nexuiz/data/common-spog.pk3 Nexuiz/data/data20091001.pk3 -d Rexuiz/data
	test -f Rexuiz/gpl.txt || unzip -j nexuiz-252.zip Nexuiz/gpl.txt -d Rexuiz
	test -f Rexuiz/sources/gamesource20091001.zip || unzip -j nexuiz-252.zip Nexuiz/sources/fteqcc-binaries-and-source-rev1253299209-bb8ceb9870af06104b67ae4cc2ec29552dce705b.zip Nexuiz/sources/gamesource20091001.zip -d Rexuiz/sources
	test -f Rexuiz/data/dlcache/csprogs.dat.408476.61283 || (rm -f csprogs.dat && unzip -j Rexuiz/data/data20091001.pk3 csprogs.dat && mv csprogs.dat Rexuiz/data/dlcache/csprogs.dat.408476.61283)
	cd rexdlc && make essential
	cp rexdlc/*.pk3 Rexuiz/data/dlcache/
	cd 1vs1 && git archive --format=zip --prefix=rexuiz-qcsrc/ HEAD -o ../Rexuiz/sources/rexuiz-qcsrc.zip
	cd gmqcc && git archive --format=zip --prefix=gmqcc/ HEAD -o ../Rexuiz/sources/gmqcc.zip
	install -m644 scripts/server-example.cfg Rexuiz/data/server-example.cfg

stand-alone-engine: engine $(EXTRALIBS)
	mkdir -m 755 -p Rexuiz/sources
	rm -f Rexuiz/sources/$(DPDIR).zip
	cd $(DPDIR) && git archive --format=zip --prefix=$(DPDIR)/ HEAD -o ../Rexuiz/sources/$(DPDIR).zip
	install -m644 $(LIBPNGTARGZ) $(JPEGTARGZ) $(SDLTARGZ) $(ZLIBTARGZ) Rexuiz/sources/
ifeq ($(DPTARGET_WIN),y)
	install -m644 $(DPDIR)/rexuiz-sdl-$(ARCHSUFFIX).exe Rexuiz/rexuiz-sdl-$(ARCHSUFFIX).exe
ifeq ($(ARCHSUFFIX), x86_64)
	mkdir -p -m755 Rexuiz/bin64
	install -m644 $(DPDIR)/rexuiz-dedicated-$(ARCHSUFFIX).exe Rexuiz/bin64/rexuiz-dedicated.exe
	install -m644 scripts/run_server_win64.cmd Rexuiz/server/
endif
ifeq ($(ARCHSUFFIX),i686)
	mkdir -p -m755 Rexuiz/bin32
	install -m644 $(DPDIR)/rexuiz-dedicated-$(ARCHSUFFIX).exe Rexuiz/bin32/rexuiz-dedicated.exe
	install -m644 scripts/run_server_win32.cmd Rexuiz/server/
endif
	install -m644 $(FREETYPETARGZ) $(CURLTARGZ) $(LIBOGGTARGZ) $(LIBVORBISTARGZ) $(LIBTHEORATARGZ) $(LIBMICROHTTPDTARGZ) Rexuiz/sources/
ifeq ($(DPTARGET),win32)
	mkdir -m755 -p Rexuiz/bin32
	install -m644 $(EXTRALIBS) Rexuiz/bin32/
endif
ifeq ($(DPTARGET),win64)
	mkdir -m755 -p Rexuiz/bin64
	install -m644 $(EXTRALIBS) Rexuiz/bin64/
endif
endif
ifeq ($(DPTARGET_LINUX),y)
	mkdir -p Rexuiz/linux-bins/$(ARCHSUFFIX)
	mkdir -p Rexuiz/server
	install -m 755 $(DPDIR)/rexuiz-sdl Rexuiz/linux-bins/$(ARCHSUFFIX)/rexuiz-sdl
	install -m644 $(CURLFILES) Rexuiz/linux-bins/$(ARCHSUFFIX)/libcurl-fallback.so
	install -m 755 $(DPDIR)/rexuiz-dedicated Rexuiz/linux-bins/$(ARCHSUFFIX)/rexuiz-dedicated
	install -m644 $(LIBOGGTARGZ) $(LIBVORBISTARGZ) Rexuiz/sources/
	cat scripts/run_client | sed 's/@@ARCH@@/$(ARCHSUFFIX)/g' | sed 's/@@BINARY_NAME@@/rexuiz-sdl/g' > Rexuiz/rexuiz-linux-sdl-$(ARCHSUFFIX)
	chmod 755 Rexuiz/rexuiz-linux-sdl-$(ARCHSUFFIX)
	cat scripts/run_server | sed 's/@@ARCH@@/$(ARCHSUFFIX)/g' | sed 's/@@BINARY_NAME@@/rexuiz-dedicated/g' > Rexuiz/server/rexuiz-linux-dedicated-$(ARCHSUFFIX)
	chmod 755 Rexuiz/server/rexuiz-linux-dedicated-$(ARCHSUFFIX)
	install -m755 scripts/update.sh Rexuiz/server/update.sh
endif
ifeq ($(DPTARGET_MAC),y)
	mkdir -m755 -p Rexuiz/Rexuiz.app/Contents/MacOS
	mkdir -m755 -p Rexuiz/Rexuiz.app/Contents/Resources/English.lproj
	install -m 755 scripts/Rexuiz.app/Contents/MacOS/rexuiz-dprm-sdl Rexuiz/Rexuiz.app/Contents/MacOS/
	install -m 755 scripts/Rexuiz.app/Contents/PkgInfo Rexuiz/Rexuiz.app/Contents/
	install -m 755 scripts/Rexuiz.app/Contents/Resources/English.lproj/InfoPlist.strings Rexuiz/Rexuiz.app/Contents/Resources/English.lproj/
	install -m 755 scripts/Rexuiz.app/Contents/Resources/Rexuiz.icns Rexuiz/Rexuiz.app/Contents/Resources/
	install -m 755 scripts/Rexuiz.app/Contents/Info.plist Rexuiz/Rexuiz.app/Contents/
	install -m 755 $(DPDIR)/rexuiz-sdl Rexuiz/Rexuiz.app/Contents/MacOS/rexuiz-dprm-sdl-bin
	install -m644 $(LIBOGGTARGZ) $(LIBVORBISTARGZ) $(LIBTHEORATARGZ) Rexuiz/sources/
endif

stand-alone: stand-alone-engine stand-alone-data

gmqcc:
	cd gmqcc && cmake . && make

update-qc: gmqcc
	cd 1vs1 && make QCC=../../../gmqcc/gmqcc SV_PROGNAME=progs.dat CL_PROGNAME=csprogs.dat CFG_NAME=rexuiz-extra.cfg SET_CURL_PACKAGE=no
	install -m 644 1vs1/progs.dat 1vs1/csprogs.dat 1vs1/menu.dat 1vs1/rexuiz-extra.cfg rexuiz.pk3/
	install -m 644 1vs1/translations/*.po 1vs1/rexuiz-extra.cfg rexuiz-data.pk3/
