.PHONY: all clean engine fetch-build-data stand-alone stand-alone-data stand-alone-engine update-qc linux-package rmqcc
PWD=$(shell pwd)
LIBDIR=$(PWD)/libs

DATA_FILES_NEXUIZ=common-spog.pk3 data20091001.pk3

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

LIBPNGDIR=libpng-1.6.32
LIBPNGTARGZ=$(LIBPNGDIR).tar.gz
LIBPNGFILES=$(LIBDIR)/lib/libpng.a $(LIBDIR)/lib/libpng16.a
ZLIBDIR=zlib-1.2.11
ZLIBTARGZ=$(ZLIBDIR).tar.gz
ZLIBFILES=$(LIBDIR)/lib/libz.a
JPEGTARGZ=jpegsrc.v8d.tar.gz
JPEGDIR=jpeg-8d
JPEGFILES=$(LIBDIR)/lib/libjpeg.a
SDLDIR=SDL2-2.0.5
SDLTARGZ=$(SDLDIR).tar.gz
SDLFILES=$(LIBDIR)/bin/sdl2-config
SDL1DIR=SDL-1.2.15
SDL1TARGZ=$(SDL1DIR).tar.gz
SDL1FILES=$(LIBDIR)/bin/sdl-config
LIBMICROHTTPDFILES=$(LIBDIR)/lib/libmicrohttpd.a
FREETYPEDIR=freetype-2.7
FREETYPETARGZ=$(FREETYPEDIR).tar.gz
CURLDIR=curl-7.50.3
CURLTARGZ=$(CURLDIR).tar.gz
LIBOGGDIR=libogg-1.3.2
LIBOGGTARGZ=$(LIBOGGDIR).tar.gz
LIBVORBISDIR=libvorbis-1.3.5
LIBVORBISTARGZ=$(LIBVORBISDIR).tar.gz
LIBTHEORADIR=libtheora-1.1.1
LIBTHEORATARGZ=$(LIBTHEORADIR).tar.gz
LIBMICROHTTPDDIR=libmicrohttpd-0.9.55
LIBMICROHTTPDTARGZ=$(LIBMICROHTTPDDIR).tar.gz

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
DPMAKEOPTS=CC='$(CC) -I$(LIBDIR)/include/SDL2 -I$(LIBDIR)/include -L$(LIBDIR)/lib' LD='$(CC) -L$(LIBDIR)/lib' STRIP=$(STRIP) DP_LINK_ZLIB=shared DP_LINK_JPEG=shared DP_JPEG_VERSION=80 LIB_JPEG=-ljpeg CFLAGS_LIBJPEG=-DLINK_TO_LIBJPEG DP_LINK_PNG=shared LIB_PNG='-lpng' CFLAGS_LIBPNG='-I$(LIBDIR) -DLINK_TO_LIBPNG' SDL_CONFIG='$(LIBDIR)/bin/sdl2-config' DP_LIBMICROHTTPD=yes
DPMAKEOPTS_SDL1=CC='$(CC) -I$(LIBDIR)/include/SDL -I$(LIBDIR)/include -L$(LIBDIR)/lib' LD='$(CC) -L$(LIBDIR)/lib' STRIP=$(STRIP) DP_LINK_ZLIB=shared DP_LINK_JPEG=shared DP_JPEG_VERSION=80 LIB_JPEG=-ljpeg CFLAGS_LIBJPEG=-DLINK_TO_LIBJPEG DP_LINK_PNG=shared LIB_PNG='-lpng' CFLAGS_LIBPNG='-I$(LIBDIR) -DLINK_TO_LIBPNG' SDL_CONFIG='$(LIBDIR)/bin/sdl-config' DP_LIBMICROHTTPD=yes

ifeq ($(DPTARGET),linux32)
ARCHSUFFIX=i686
DPTARGET_LINUX=y
endif
ifeq ($(DPTARGET),linux64)
ARCHSUFFIX=x86_64
DPTARGET_LINUX=y
endif
ifeq ($(DPTARGET),win32)
DPMAKEOPTS:=$(DPMAKEOPTS_SDL1) DP_MAKE_TARGET=mingw TARGET=$(CROSSPREFIX) DP_FS_FORCE_NOHOME=y SDLCONFIG_LIBS="`$(LIBDIR)/bin/sdl-config --libs`" LIB_LIBMICROHTTPD='-lmicrohttpd -lws2_32'
DPTARGET_WIN=y
ARCHSUFFIX=i686
endif
ifeq ($(DPTARGET),win64)
DPMAKEOPTS:=$(DPMAKEOPTS) DP_MAKE_TARGET=mingw TARGET=$(CROSSPREFIX) DP_FS_FORCE_NOHOME=y MINGWARCH=x86_64 SDLCONFIG_LIBS="`$(LIBDIR)/bin/sdl2-config --libs`" LIB_LIBMICROHTTPD='-lmicrohttpd -lws2_32'
DPTARGET_WIN=y
ARCHSUFFIX=x86_64
endif
ifeq ($(DPTARGET),mac32)
ARCHSUFFIX=i686
DPMAKEOPTS:=$(DPMAKEOPTS) DP_MAKE_TARGET=macosx SDLCONFIG_LIBS="`$(LIBDIR)/bin/sdl2-config --libs`" SDLCONFIG_MACOSXCFLAGS="`$(LIBDIR)/bin/sdl2-config --cflags`" SDLCONFIG_MACOSXLIBS="`$(LIBDIR)/bin/sdl2-config --libs`" SDLCONFIG_MACOSXSTATICLIBS="`$(LIBDIR)/bin/sdl2-config --libs`" DP_LINK_OGGVORBIS=shared LIB_OGGVORBIS='`pkg-config --libs --static vorbis vorbisfile`'
DPTARGET_MAC=y
endif
ifeq ($(DPTARGET),mac64)
ARCHSUFFIX=x86_64
DPMAKEOPTS:=$(DPMAKEOPTS) DP_MAKE_TARGET=macosx SDLCONFIG_LIBS="`$(LIBDIR)/bin/sdl2-config --libs`" SDLCONFIG_MACOSXCFLAGS="`$(LIBDIR)/bin/sdl2-config --cflags`" SDLCONFIG_MACOSXLIBS="`$(LIBDIR)/bin/sdl2-config --libs`" SDLCONFIG_MACOSXSTATICLIBS="`$(LIBDIR)/bin/sdl2-config --libs`" DP_LINK_OGGVORBIS=shared LIB_OGGVORBIS='`pkg-config --libs --static vorbis vorbisfile`'
DPTARGET_MAC=y
endif
ifeq ($(DPTARGET_WIN),y)
FREETYPEFILES=$(LIBDIR)/bin/libfreetype-6.dll
CURLFILES=$(LIBDIR)/bin/libcurl-4.dll
LIBOGGFILES=$(LIBDIR)/bin/libogg-0.dll
LIBVORBISFILES=$(LIBDIR)/bin/libvorbis-0.dll $(LIBDIR)/bin/libvorbisenc-2.dll $(LIBDIR)/bin/libvorbisfile-3.dll
LIBTHEORAFILES=$(LIBDIR)/bin/libtheora-0.dll
EXTRALIBS=$(FREETYPEFILES) $(CURLFILES) $(LIBOGGFILES) $(LIBVORBISFILES) $(LIBTHEORAFILES)
else
ifeq ($(DPTARGET_MAC),y)
FREETYPEFILES=$(LIBDIR)/lib/libfreetype.dylib
CURLFILES=$(LIBDIR)/lib/libcurl.dylib
LIBOGGFILES=$(LIBDIR)/lib/libogg.a
LIBVORBISFILES=$(LIBDIR)/lib/libvorbis.a $(LIBDIR)/lib/libvorbisenc.a $(LIBDIR)/lib/libvorbisfile.a
LIBTHEORAFILES=$(LIBDIR)/lib/libtheora.dylib
EXTRALIBS=
EXTRALIBS_LINKONLY=$(LIBOGGFILES) $(LIBVORBISFILES)
else
DPMAKEOPTS:=$(DPMAKEOPTS) DP_FS_BASEDIR=/usr/share/rexuiz/
FREETYPEFILES=$(LIBDIR)/lib/libfreetype.so
CURLFILES=$(LIBDIR)/lib/libcurl.so
LIBOGGFILES=$(LIBDIR)/lib/libogg.so
LIBVORBISFILES=$(LIBDIR)/lib/libvorbis.so $(LIBDIR)/lib/libvorbisenc.so $(LIBDIR)/lib/libvorbisfile.so
LIBTHEORAFILES=$(LIBDIR)/lib/libtheora.so
EXTRALIBS=$(LIBOGGFILES) $(LIBVORBISFILES)
ifeq ($(SDL1ENABLE),y)
EXTRALIBS_LINKONLY=$(SDL1FILES)
endif
endif
endif

ifeq ($(DPTARGET),win32)
SDLFILES_FORDP=$(SDL1FILES)
else
SDLFILES_FORDP=$(SDLFILES)
endif


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

$(SDL1TARGZ):
	wget -O temp_$@ https://www.libsdl.org/release/$@
	mv temp_$@ $@

$(JPEGTARGZ):
	wget -O temp_$@ http://www.ijg.org/files/$@
	mv temp_$@ $@

$(ZLIBTARGZ):
	wget -O temp_$@ http://zlib.net/$@
	mv temp_$@ $@

$(LIBPNGTARGZ):
	wget -O temp_$@ ftp://ftp.simplesystems.org/pub/libpng/png/src/libpng16/$@
	mv temp_$@ $@

$(LIBMICROHTTPDTARGZ):
	wget -O temp_$@ http://ftp.gnu.org/gnu/libmicrohttpd/$@
	mv temp_$@ $@

$(LIBPNGFILES): $(LIBPNGTARGZ) $(ZLIBFILES)
	tar xzf $(LIBPNGTARGZ)
	cd $(LIBPNGDIR) && CC="$(CC) -I$(LIBDIR)/include -L$(LIBDIR)/lib" CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib" ./configure --host=$(CROSSPREFIX) --disable-shared --enable-static --prefix=$(LIBDIR) && make && make install

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
	cd $(CURLDIR) && CC="$(CC) -static-libgcc" ./configure --without-zlib --enable-shared --host=$(CROSSPREFIX) --disable-static --prefix=$(LIBDIR) && make && make install
else
	cd $(CURLDIR) && CC="$(CC)" ./configure --without-zlib --enable-shared --host=$(CROSSPREFIX) --disable-static --prefix=$(LIBDIR) && make && make install
endif

$(LIBOGGFILES): $(LIBOGGTARGZ)
	tar xzf $(LIBOGGTARGZ)
ifeq ($(DPTARGET_MAC),y)
	cd $(LIBOGGDIR) && CC="$(CC)" ./configure --disable-shared --host=$(CROSSPREFIX) --enable-static --prefix=$(LIBDIR) && make && make install
else
	cd $(LIBOGGDIR) && CC="$(CC)" ./configure --enable-shared --host=$(CROSSPREFIX) --disable-static --prefix=$(LIBDIR) && make && make install
endif

$(LIBVORBISFILES): $(LIBVORBISTARGZ) $(LIBOGGFILES)
	tar xzf $(LIBVORBISTARGZ)
ifeq ($(DPTARGET_MAC),y)
	cd $(LIBVORBISDIR) && PKG_CONFIG_PATH="$(LIBDIR)/lib/pkgconfig" CC="$(CC)" CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib" ./configure --disable-shared --host=$(CROSSPREFIX) --enable-static --prefix=$(LIBDIR) && make && make install
else
	cd $(LIBVORBISDIR) && PKG_CONFIG_PATH="$(LIBDIR)/lib/pkgconfig" CC="$(CC)" CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib" ./configure --enable-shared --host=$(CROSSPREFIX) --disable-static --prefix=$(LIBDIR) && make && make install
endif

$(LIBTHEORAFILES): $(LIBTHEORATARGZ) $(LIBOGGFILES)
	tar xzf $(LIBTHEORATARGZ)
	tr -d '\015' < $(LIBTHEORADIR)/win32/xmingw32/libtheoradec-all.def > $(LIBTHEORADIR)/win32/xmingw32/libtheoradec-all.def.fixed
	mv $(LIBTHEORADIR)/win32/xmingw32/libtheoradec-all.def.fixed $(LIBTHEORADIR)/win32/xmingw32/libtheoradec-all.def
	tr -d '\015' < $(LIBTHEORADIR)/win32/xmingw32/libtheoraenc-all.def > $(LIBTHEORADIR)/win32/xmingw32/libtheoraenc-all.def.fixed
	mv $(LIBTHEORADIR)/win32/xmingw32/libtheoraenc-all.def.fixed $(LIBTHEORADIR)/win32/xmingw32/libtheoraenc-all.def
ifeq ($(DPTARGET_WIN),y)
	cd $(LIBTHEORADIR) && CC="$(CC) -static-libgcc" CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib -static-libgcc" ./configure --enable-shared --host=$(CROSSPREFIX) --disable-static --prefix=$(LIBDIR) --disable-examples && make && make install
else
	cd $(LIBTHEORADIR) && CC="$(CC)" CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib" ./configure --enable-shared --host=$(CROSSPREFIX) --disable-static --prefix=$(LIBDIR) && make && make install
endif

$(LIBMICROHTTPDFILES): $(LIBMICROHTTPDTARGZ)
	tar xzf $(LIBMICROHTTPDTARGZ)
	cd $(LIBMICROHTTPDDIR) && CC="$(CC)" CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib" ./configure --disable-shared --host=$(CROSSPREFIX) --enable-static --disable-https --prefix=$(LIBDIR) && make && make install

$(SDLFILES): $(SDLTARGZ)
	tar xzf $(SDLTARGZ)
ifeq ($(DPTARGET_WIN),y)
	cd $(SDLDIR) && CC="$(CC)" CXX="$(CXX)" host_os=mingw ./configure --host=$(CROSSPREFIX) --target=$(CROSSPREFIX) --enable-static --disable-shared --prefix=$(LIBDIR)
	cd $(SDLDIR) && make || cp build/.libs/*.o build/
	cd $(SDLDIR) && make || cp build/.libs/*.o build/
	cd $(SDLDIR) && make
	cd $(SDLDIR) && make install
else
ifeq ($(DPTARGET_MAC),y)
	cd $(SDLDIR) && CC="$(CC)" CXX="$(CXX)" ./configure --host=$(CROSSPREFIX) --target=$(CROSSPREFIX) --x-includes=$(MAC_OS_SDK)/usr/include --disable-cpuinfo --disable-video-x11 --enable-static --disable-shared --prefix=$(LIBDIR) && make && make install
else
	cd $(SDLDIR) && CC="$(CC)" CXX="$(CXX)" ./configure --host=$(CROSSPREFIX) --target=$(CROSSPREFIX) --enable-static --disable-shared --prefix=$(LIBDIR) && make && make install
endif
endif

$(SDL1FILES): $(SDL1TARGZ)
	tar xzf $(SDL1TARGZ)
	cd $(SDL1DIR) && patch -p1 < ../patches/sdl-1.2.patch
	cd $(SDL1DIR) && ./autogen.sh
ifeq ($(DPTARGET_WIN),y)
	cd $(SDL1DIR) && CC="$(CC)" CXX="$(CXX)" ./configure --host=$(CROSSPREFIX) --target=$(CROSSPREFIX) --enable-static --disable-shared --prefix=$(LIBDIR)
else
	cd $(SDL1DIR) && CC="$(CC)" CXX="$(CXX)" ./configure --host=$(CROSSPREFIX) --target=$(CROSSPREFIX) --disable-static --enable-shared --prefix=$(LIBDIR)
endif
	cd $(SDL1DIR) && make
	cd $(SDL1DIR) && make install

clean:
	rm -rf $(ZLIBDIR) $(JPEGDIR) $(LIBPNGDIR) $(SDLDIR) $(LIBDIR) $(LIBOGGDIR) $(LIBVORBISDIR) $(LIBTHEORADIR) $(CURLDIR) $(FREETYPEDIR) $(LIBMICROHTTPDDIR) package
	cd DarkPlacesRM && make clean

engine: $(LIBPNGFILES) $(JPEGFILES) $(ZLIBFILES) $(SDLFILES_FORDP) $(EXTRALIBS_LINKONLY) $(LIBMICROHTTPDFILES)
ifeq ($(SDL1ENABLE),y)
	cd DarkPlacesRM && make clean
	cd DarkPlacesRM && PKG_CONFIG_PATH="$(LIBDIR)/lib/pkgconfig" make sdl-rexuiz $(DPMAKEOPTS_SDL1)
	mv DarkPlacesRM/rexuiz-sdl DarkPlacesRM/rexuiz-sdl1
	cd DarkPlacesRM && make clean
endif
	cd DarkPlacesRM && PKG_CONFIG_PATH="$(LIBDIR)/lib/pkgconfig" make sdl-rexuiz sv-rexuiz $(DPMAKEOPTS)

fetch-build-data: nexuiz-252.zip $(LIBPNGTARGZ) $(JPEGTARGZ) $(SDLTARGZ) $(ZLIBTARGZ) $(FREETYPETARGZ) $(CURLTARGZ) $(LIBOGGTARGZ) $(LIBVORBISTARGZ) $(LIBTHEORATARGZ) $(SDL1TARGZ)

stand-alone: stand-alone-data stand-alone-engine

stand-alone-data:
	mkdir -m 755 -p Rexuiz/sources
	mkdir -m 755 -p Rexuiz/data/dlcache
	rm -f Rexuiz/data/rexuiz.pk3
	cd rexuiz.pk3 && zip -r ../Rexuiz/data/rexuiz.pk3 *
	unzip -j nexuiz-252.zip Nexuiz/data/common-spog.pk3 Nexuiz/data/data20091001.pk3 -d Rexuiz/data
	unzip -j nexuiz-252.zip Nexuiz/gpl.txt -d Rexuiz
	unzip -j nexuiz-252.zip Nexuiz/sources/fteqcc-binaries-and-source-rev1253299209-bb8ceb9870af06104b67ae4cc2ec29552dce705b.zip Nexuiz/sources/gamesource20091001.zip -d Rexuiz/sources
	unzip -j Rexuiz/data/data20091001.pk3 csprogs.dat
	mv csprogs.dat Rexuiz/data/dlcache/csprogs.dat.408476.61283
	cd rexdlc/pryaxe_balls && zip -r ../../Rexuiz/data/dlcache/zzz-rexdlc_pryaxe_balls.pk3 *
	cd rexdlc/rm_arc && zip -r ../../Rexuiz/data/dlcache/zzz-rexdlc_rm_arc.pk3 *
	cd rexdlc/rm_effects_v2 && zip -r ../../Rexuiz/data/dlcache/zzz-rexdlc_rm_effects_v2.pk3 *
	cd rexdlc/rspear && zip -r ../../Rexuiz/data/dlcache/zzz-rexdlc_rspear.pk3 *
	cd rexdlc/supershotgun && zip -r ../../Rexuiz/data/dlcache/zzz-rexdlc_supershotgun.pk3 *
	cd rexdlc/survival_campaign_v2 && zip -r ../../Rexuiz/data/dlcache/zzz-rexdlc_survival_campaign_v2.pk3 *
	cd rexdlc/survival_pack && zip -r ../../Rexuiz/data/dlcache/zzz-rexdlc_survival_pack.pk3 *
	cd rexdlc/survival_pack2 && zip -r ../../Rexuiz/data/dlcache/zzz-rexdlc_survival_pack2.pk3 *
	cd rexdlc/zapper_v2 && zip -r ../../Rexuiz/data/dlcache/zzz-rexdlc_zapper_v2.pk3 *
	cd 1vs1 && git archive --format=zip --prefix=rexuiz-qcsrc/ HEAD -o ../Rexuiz/sources/rexuiz-qcsrc.zip
	cd rmqcc && git archive --format=zip --prefix=rmqcc/ HEAD -o ../Rexuiz/sources/rmqcc.zip
	install -m644 scripts/server-example.cfg Rexuiz/data/server-example.cfg

stand-alone-engine: engine $(EXTRALIBS)
	mkdir -m 755 -p Rexuiz/sources
	rm -f Rexuiz/sources/DarkPlacesRM.zip
	cd DarkPlacesRM && git archive --format=zip --prefix=DarkPlacesRM/ HEAD -o ../Rexuiz/sources/DarkPlacesRM.zip
	install -m644 $(LIBPNGTARGZ) $(JPEGTARGZ) $(SDLTARGZ) $(ZLIBTARGZ) Rexuiz/sources/
ifeq ($(DPTARGET_WIN),y)
	install -m644 DarkPlacesRM/rexuiz-sdl-$(ARCHSUFFIX).exe Rexuiz/rexuiz-sdl-$(ARCHSUFFIX).exe
ifeq ($(ARCHSUFFIX), x86_64)
	mkdir -p -m755 Rexuiz/bin64
	install -m644 DarkPlacesRM/rexuiz-dedicated-$(ARCHSUFFIX).exe Rexuiz/bin64/rexuiz-dedicated.exe
	install -m644 scripts/run_server_win64.cmd Rexuiz/server/
endif
ifeq ($(ARCHSUFFIX),i686)
	mkdir -p -m755 Rexuiz/bin32
	install -m644 DarkPlacesRM/rexuiz-dedicated-$(ARCHSUFFIX).exe Rexuiz/bin32/rexuiz-dedicated.exe
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
	install -m 755 DarkPlacesRM/rexuiz-sdl Rexuiz/linux-bins/$(ARCHSUFFIX)/rexuiz-dprm-sdl
ifeq ($(SDL1ENABLE),y)
	install -m 755 DarkPlacesRM/rexuiz-sdl1 Rexuiz/linux-bins/$(ARCHSUFFIX)/rexuiz-dprm-sdl1
endif
	install -m644 $(EXTRALIBS) Rexuiz/linux-bins/$(ARCHSUFFIX)/
	install -m 755 DarkPlacesRM/rexuiz-dedicated Rexuiz/linux-bins/$(ARCHSUFFIX)/rexuiz-dprm-dedicated
	install -m644 $(LIBOGGTARGZ) $(LIBVORBISTARGZ) $(SDL1TARGZ) Rexuiz/sources/
	install -m644 patches/sdl-1.2.patch Rexuiz/sources/
	cat scripts/run_client | sed 's/@@ARCH@@/$(ARCHSUFFIX)/g' | sed 's/@@BINARY_NAME@@/rexuiz-dprm-sdl/g' > Rexuiz/rexuiz-linux-sdl-$(ARCHSUFFIX)
	chmod 755 Rexuiz/rexuiz-linux-sdl-$(ARCHSUFFIX)
	cat scripts/run_server | sed 's/@@ARCH@@/$(ARCHSUFFIX)/g' | sed 's/@@BINARY_NAME@@/rexuiz-dprm-dedicated/g' > Rexuiz/server/rexuiz-linux-dedicated-$(ARCHSUFFIX)
	chmod 755 Rexuiz/server/rexuiz-linux-dedicated-$(ARCHSUFFIX)
endif
ifeq ($(DPTARGET_MAC),y)
	mkdir -m755 -p Rexuiz/Rexuiz.app/Contents/MacOS
	mkdir -m755 -p Rexuiz/Rexuiz.app/Contents/Resources/English.lproj
	install -m 755 scripts/Rexuiz.app/Contents/MacOS/rexuiz-dprm-sdl Rexuiz/Rexuiz.app/Contents/MacOS/
	install -m 755 scripts/Rexuiz.app/Contents/PkgInfo Rexuiz/Rexuiz.app/Contents/
	install -m 755 scripts/Rexuiz.app/Contents/Resources/English.lproj/InfoPlist.strings Rexuiz/Rexuiz.app/Contents/Resources/English.lproj/
	install -m 755 scripts/Rexuiz.app/Contents/Resources/Rexuiz.icns Rexuiz/Rexuiz.app/Contents/Resources/
	install -m 755 scripts/Rexuiz.app/Contents/Info.plist Rexuiz/Rexuiz.app/Contents/
	install -m 755 DarkPlacesRM/rexuiz-sdl Rexuiz/Rexuiz.app/Contents/MacOS/rexuiz-dprm-sdl-bin
	install -m644 $(LIBOGGTARGZ) $(LIBVORBISTARGZ) $(LIBTHEORATARGZ) Rexuiz/sources/
endif

stand-alone: stand-alone-engine stand-alone-data

linux-package: engine nexuiz-252.zip
	mkdir -m 755 -p package/usr/bin
	install -m 755 DarkPlacesRM/rexuiz-sdl package/usr/bin/rexuiz
ifeq ($(SDL1ENABLE),y)
	install -m 755 DarkPlacesRM/rexuiz-sdl1 package/usr/bin/rexuiz-sdl1
endif
	install -m 755 DarkPlacesRM/rexuiz-dedicated package/usr/bin/rexuiz-dedicated
	mkdir -m 755 -p package/usr/share/applications
	install -m 644 scripts/rexuiz.desktop "package/usr/share/applications/rexuiz.desktop"
ifeq ($(SDL1ENABLE),y)
	install -m 644 scripts/rexuiz-sdl1.desktop "package/usr/share/applications/rexuiz.desktop"
endif
	cd DarkPlacesRM && install -TDm644 nexuiz.xpm "../package/usr/share/pixmaps/rexuiz.xpm"
	cd DarkPlacesRM && install -TDm644 nexuiz16x16.png "../package/usr/share/icons/hicolor/16x16/apps/rexuiz.png"
	cd DarkPlacesRM && install -TDm644 nexuiz24x24.png "../package/usr/share/icons/hicolor/24x24/apps/rexuiz.png"
	cd DarkPlacesRM && install -TDm644 nexuiz32x32.png "../package/usr/share/icons/hicolor/32x32/apps/rexuiz.png"
	cd DarkPlacesRM && install -TDm644 nexuiz48x48.png "../package/usr/share/icons/hicolor/48x48/apps/rexuiz.png"
	cd DarkPlacesRM && install -TDm644 nexuiz256x256.png "../package/usr/share/icons/hicolor/256x256/apps/rexuiz.png"
	mkdir -m 755 -p package/usr/share/rexuiz/data/dlcache
	cd rexuiz.pk3 && zip -r ../package/usr/share/rexuiz/data/rexuiz.pk3 *
	unzip -j nexuiz-252.zip Nexuiz/data/common-spog.pk3 Nexuiz/data/data20091001.pk3 -d package/usr/share/rexuiz/data
	unzip -j package/usr/share/rexuiz/data/data20091001.pk3 csprogs.dat
	mv csprogs.dat package/usr/share/rexuiz/data/dlcache/csprogs.dat.408476.61283

rmqcc:
	cd rmqcc && make

update-qc: rmqcc
	cd 1vs1 && make QCC=../../../rmqcc/rmqcc.bin SV_PROGNAME=progs.dat CL_PROGNAME=csprogs.dat CFG_NAME=rexuiz-extra.cfg SET_CURL_PACKAGE=no
	install -m 644 1vs1/progs.dat 1vs1/csprogs.dat 1vs1/menu.dat 1vs1/rexuiz-extra.cfg rexuiz.pk3/
