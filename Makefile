.PHONY: all clean engine fetch-build-data stand-alone stand-alone-data stand-alone-engine
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

LIBPNGDIR=libpng-1.6.25
LIBPNGTARGZ=$(LIBPNGDIR).tar.gz
LIBPNGFILES=$(LIBDIR)/lib/libpng.a $(LIBDIR)/lib/libpng16.a
ZLIBDIR=zlib-1.2.8
ZLIBTARGZ=$(ZLIBDIR).tar.gz
ZLIBFILES=$(LIBDIR)/lib/libz.a
JPEGTARGZ=jpegsrc.v8d.tar.gz
JPEGDIR=jpeg-8d
JPEGFILES=$(LIBDIR)/lib/libjpeg.a
SDLDIR=SDL2-2.0.4
SDLTARGZ=$(SDLDIR).tar.gz
SDLFILES=$(LIBDIR)/bin/sdl2-config
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
DPMAKEOPTS=CC='$(CC) -I$(LIBDIR)/include/SDL2 -I$(LIBDIR)/include -L$(LIBDIR)/lib' LD='$(CC) -L$(LIBDIR)/lib' STRIP=$(STRIP) DP_LINK_ZLIB=shared DP_LINK_JPEG=shared DP_JPEG_VERSION=80 LIB_JPEG=-ljpeg CFLAGS_LIBJPEG=-DLINK_TO_LIBJPEG DP_LINK_PNG=shared LIB_PNG='-lpng' CFLAGS_LIBPNG='-I$(LIBDIR) -DLINK_TO_LIBPNG' SDL_CONFIG='$(LIBDIR)/bin/sdl2-config'

ifeq ($(DPTARGET),linux32)
ARCHSUFFIX=i686
DPTARGET_LINUX=y
endif
ifeq ($(DPTARGET),linux64)
ARCHSUFFIX=x86_64
DPTARGET_LINUX=y
endif
ifeq ($(DPTARGET),win32)
DPMAKEOPTS:=$(DPMAKEOPTS) DP_MAKE_TARGET=mingw DP_FS_FORCE_NOHOME=y SDLCONFIG_LIBS="`$(LIBDIR)/bin/sdl2-config --libs`"
DPTARGET_WIN=y
ARCHSUFFIX=i686
endif
ifeq ($(DPTARGET),win64)
DPMAKEOPTS:=$(DPMAKEOPTS) DP_MAKE_TARGET=mingw DP_FS_FORCE_NOHOME=y MINGWARCH=x86_64 SDLCONFIG_LIBS="`$(LIBDIR)/bin/sdl2-config --libs`"
DPTARGET_WIN=y
ARCHSUFFIX=x86_64
endif
ifeq ($(DPTARGET),mac32)
ARCHSUFFIX=i686
DPMAKEOPTS:=$(DPMAKEOPTS) DP_MAKE_TARGET=macosx SDLCONFIG_LIBS="`$(LIBDIR)/bin/sdl2-config --libs`" SDLCONFIG_MACOSXCFLAGS="`$(LIBDIR)/bin/sdl2-config --cflags`" SDLCONFIG_MACOSXLIBS="`$(LIBDIR)/bin/sdl2-config --libs`" SDLCONFIG_MACOSXSTATICLIBS="`$(LIBDIR)/bin/sdl2-config --libs`"
DPTARGET_MAC=y
endif
ifeq ($(DPTARGET),mac64)
ARCHSUFFIX=x86_64
DPMAKEOPTS:=$(DPMAKEOPTS) DP_MAKE_TARGET=macosx SDLCONFIG_LIBS="`$(LIBDIR)/bin/sdl2-config --libs`" SDLCONFIG_MACOSXCFLAGS="`$(LIBDIR)/bin/sdl2-config --cflags`" SDLCONFIG_MACOSXLIBS="`$(LIBDIR)/bin/sdl2-config --libs`" SDLCONFIG_MACOSXSTATICLIBS="`$(LIBDIR)/bin/sdl2-config --libs`"
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
LIBOGGFILES=$(LIBDIR)/lib/libogg.dylib
LIBVORBISFILES=$(LIBDIR)/lib/libvorbis.dylib $(LIBDIR)/lib/libvorbisenc.dylib $(LIBDIR)/lib/libvorbisfile.dylib
LIBTHEORAFILES=$(LIBDIR)/lib/libtheora.dylib
EXTRALIBS=$(LIBOGGFILES) $(LIBVORBISFILES) $(LIBTHEORAFILES)
else
FREETYPEFILES=$(LIBDIR)/lib/libfreetype.so
CURLFILES=$(LIBDIR)/lib/libcurl.so
LIBOGGFILES=$(LIBDIR)/lib/libogg.so
LIBVORBISFILES=$(LIBDIR)/lib/libvorbis.so $(LIBDIR)/lib/libvorbisenc.so $(LIBDIR)/lib/libvorbisfile.so
LIBTHEORAFILES=$(LIBDIR)/lib/libtheora.so
EXTRALIBS=$(LIBOGGFILES) $(LIBVORBISFILES)
endif
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

$(JPEGTARGZ):
	wget -O temp_$@ http://www.ijg.org/files/$@
	mv temp_$@ $@

$(ZLIBTARGZ):
	wget -O temp_$@ http://zlib.net/$@
	mv temp_$@ $@

$(LIBPNGTARGZ):
	wget -O temp_$@ ftp://ftp.simplesystems.org/pub/libpng/png/src/libpng16/$@
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
	cd $(CURLDIR) && CC="$(CC) -static-libgcc" ./configure --enable-shared --host=$(CROSSPREFIX) --disable-static --prefix=$(LIBDIR) && make && make install
else
	cd $(CURLDIR) && CC="$(CC)" ./configure --enable-shared --host=$(CROSSPREFIX) --disable-static --prefix=$(LIBDIR) && make && make install
endif

$(LIBOGGFILES): $(LIBOGGTARGZ)
	tar xzf $(LIBOGGTARGZ)
	cd $(LIBOGGDIR) && CC="$(CC)" ./configure --enable-shared --host=$(CROSSPREFIX) --disable-static --prefix=$(LIBDIR) && make && make install

$(LIBVORBISFILES): $(LIBVORBISTARGZ) $(LIBOGGFILES)
	tar xzf $(LIBVORBISTARGZ)
	cd $(LIBVORBISDIR) && PKG_CONFIG_PATH="$(LIBDIR)/lib/pkgconfig" CC="$(CC)" CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib" ./configure --enable-shared --host=$(CROSSPREFIX) --disable-static --prefix=$(LIBDIR) && make && make install

$(LIBTHEORAFILES): $(LIBTHEORATARGZ) $(LIBOGGFILES)
	tar xzf $(LIBTHEORATARGZ)
	tr -d '\015' < $(LIBTHEORADIR)/win32/xmingw32/libtheoradec-all.def > $(LIBTHEORADIR)/win32/xmingw32/libtheoradec-all.def.fixed
	mv $(LIBTHEORADIR)/win32/xmingw32/libtheoradec-all.def.fixed $(LIBTHEORADIR)/win32/xmingw32/libtheoradec-all.def
	tr -d '\015' < $(LIBTHEORADIR)/win32/xmingw32/libtheoraenc-all.def > $(LIBTHEORADIR)/win32/xmingw32/libtheoraenc-all.def.fixed
	mv $(LIBTHEORADIR)/win32/xmingw32/libtheoraenc-all.def.fixed $(LIBTHEORADIR)/win32/xmingw32/libtheoraenc-all.def
ifeq ($(DPTARGET_WIN),y)
	cd $(LIBTHEORADIR) && CC="$(CC) -static-libgcc" CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib -static-libgcc" ./configure --enable-shared --host=$(CROSSPREFIX) --disable-static --prefix=$(LIBDIR) && make && make install
else
	cd $(LIBTHEORADIR) && CC="$(CC)" CFLAGS="-I$(LIBDIR)/include" LDFLAGS="-L$(LIBDIR)/lib" ./configure --enable-shared --host=$(CROSSPREFIX) --disable-static --prefix=$(LIBDIR) && make && make install
endif

$(SDLFILES): $(SDLTARGZ)
	tar xzf $(SDLTARGZ)
	echo sed -i s/-fpascal-strings// $(SDLDIR)/configure
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

clean:
	rm -rf $(ZLIBDIR) $(JPEGDIR) $(LIBPNGDIR) $(SDLDIR) $(LIBDIR) $(LIBOGGDIR) $(LIBVORBISDIR) $(LIBTHEORADIR) $(CURLDIR) $(FREETYPEDIR)
	cd DarkPlacesRM && make clean

engine: $(LIBPNGFILES) $(JPEGFILES) $(ZLIBFILES) $(SDLFILES)
ifeq ($(DPTARGET_MAC),y)
	cd DarkPlacesRM && make sdl-nexuiz $(DPMAKEOPTS)
else
	cd DarkPlacesRM && make sdl-nexuiz cl-nexuiz sv-nexuiz $(DPMAKEOPTS)
endif

fetch-build-data: nexuiz-252.zip $(LIBPNGTARGZ) $(JPEGTARGZ) $(SDLTARGZ) $(ZLIBTARGZ) $(FREETYPETARGZ) $(CURLTARGZ) $(LIBOGGTARGZ) $(LIBVORBISTARGZ) $(LIBTHEORATARGZ)

stand-alone: stand-alone-data stand-alone-engine

stand-alone-data:
	mkdir -m 755 -p Rexuiz/sources
	mkdir -m 755 -p Rexuiz/data/dlcache
	cd rexuiz.pk3 && zip -r ../Rexuiz/data/rexuiz.pk3 *
	unzip -j nexuiz-252.zip Nexuiz/data/common-spog.pk3 Nexuiz/data/data20091001.pk3 -d Rexuiz/data
	unzip -j nexuiz-252.zip Nexuiz/gpl.txt -d Rexuiz
	unzip -j nexuiz-252.zip Nexuiz/sources/fteqcc-binaries-and-source-rev1253299209-bb8ceb9870af06104b67ae4cc2ec29552dce705b.zip Nexuiz/sources/gamesource20091001.zip -d Rexuiz/sources
	unzip -j Rexuiz/data/data20091001.pk3 csprogs.dat
	mv csprogs.dat Rexuiz/data/dlcache/csprogs.dat.408476.61283
	cd 1vs1 && git archive --format=zip --prefix=rexuiz-qcsrc/ HEAD -o ../Rexuiz/sources/rexuiz-qcsrc.zip

stand-alone-engine: engine $(EXTRALIBS)
	mkdir -m 755 -p Rexuiz/sources
	cd DarkPlacesRM && git archive --format=zip --prefix=DarkPlacesRM/ HEAD -o ../Rexuiz/sources/DarkPlacesRM.zip
	install -m644 $(LIBPNGTARGZ) $(JPEGTARGZ) $(SDLTARGZ) $(ZLIBTARGZ) Rexuiz/sources/
ifeq ($(DPTARGET_WIN),y)
	install -m644 DarkPlacesRM/nexuiz-dprm-sdl-$(ARCHSUFFIX).exe Rexuiz/rexuiz-sdl-$(ARCHSUFFIX).exe
	install -m644 DarkPlacesRM/nexuiz-dprm-$(ARCHSUFFIX).exe Rexuiz/rexuiz-$(ARCHSUFFIX).exe
	install -m644 DarkPlacesRM/nexuiz-dprm-dedicated-$(ARCHSUFFIX).exe Rexuiz/rexuiz-dedicated-$(ARCHSUFFIX).exe
	install -m644 $(FREETYPETARGZ) $(CURLTARGZ) $(LIBOGGTARGZ) $(LIBVORBISTARGZ) $(LIBTHEORATARGZ) Rexuiz/sources/
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
	install -m 755 DarkPlacesRM/nexuiz-dprm-sdl Rexuiz/linux-bins/$(ARCHSUFFIX)/rexuiz-dprm-sdl
	install -m 755 DarkPlacesRM/nexuiz-dprm-glx Rexuiz/linux-bins/$(ARCHSUFFIX)/rexuiz-dprm-glx
	install -m644 $(EXTRALIBS) Rexuiz/linux-bins/$(ARCHSUFFIX)/
	install -m 755 DarkPlacesRM/nexuiz-dprm-dedicated Rexuiz/linux-bins/$(ARCHSUFFIX)/rexuiz-dprm-dedicated
	cat scripts/run_script_template | sed 's/@@ARCH@@/$(ARCHSUFFIX)/g' | sed 's/@@BINARY_NAME@@/rexuiz-dprm-sdl/g' > Rexuiz/rexuiz-linux-sdl-$(ARCHSUFFIX)
	chmod 755 Rexuiz/rexuiz-linux-sdl-$(ARCHSUFFIX)
	cat scripts/run_script_template | sed 's/@@ARCH@@/$(ARCHSUFFIX)/g' | sed 's/@@BINARY_NAME@@/rexuiz-dprm-glx/g' > Rexuiz/rexuiz-linux-glx-$(ARCHSUFFIX)
	chmod 755 Rexuiz/rexuiz-linux-glx-$(ARCHSUFFIX)
	cat scripts/run_script_template | sed 's/@@ARCH@@/$(ARCHSUFFIX)/g' | sed 's/@@BINARY_NAME@@/rexuiz-dprm-dedicated/g' > Rexuiz/rexuiz-linux-dedicated-$(ARCHSUFFIX)
	chmod 755 Rexuiz/rexuiz-linux-dedicated-$(ARCHSUFFIX)
endif
ifeq ($(DPTARGET_MAC),y)
	mkdir -m755 -p Rexuiz/Rexuiz.app/Contents/MacOS
	mkdir -m755 -p Rexuiz/Rexuiz.app/Contents/Resources/English.lproj
	install -m 755 scripts/Rexuiz.app/Contents/MacOS/rexuiz-dprm-sdl Rexuiz/Rexuiz.app/Contents/MacOS/
	install -m 755 scripts/Rexuiz.app/Contents/PkgInfo Rexuiz/Rexuiz.app/Contents/
	install -m 755 scripts/Rexuiz.app/Contents/Resources/English.lproj/InfoPlist.strings Rexuiz/Rexuiz.app/Contents/Resources/English.lproj/
	install -m 755 scripts/Rexuiz.app/Contents/Resources/Rexuiz.icns Rexuiz/Rexuiz.app/Contents/Resources/
	install -m 755 scripts/Rexuiz.app/Contents/Info.plist Rexuiz/Rexuiz.app/Contents/
	install -m 755 DarkPlacesRM/nexuiz-dprm-sdl Rexuiz/Rexuiz.app/Contents/MacOS/rexuiz-dprm-sdl-bin
	install -m 755 $(EXTRALIBS) Rexuiz/Rexuiz.app/Contents/MacOS/
	install -m644 $(LIBOGGTARGZ) $(LIBVORBISTARGZ) $(LIBTHEORATARGZ) Rexuiz/sources/
endif

stand-alone: stand-alone-engine stand-alone-data
