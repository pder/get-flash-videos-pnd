VER ?= $(shell git describe)
PND_MAKE=$(HOME)/pandora-dev/sdk_utils/pnd_make.sh
STRIP=$(HOME)/pandora-dev/arm-2011.03/bin/arm-none-linux-gnueabi-strip

pnd: rtmpdump
	rm -rf pnd
	./extract.sh
	mkdir -p pnd/lib
	cp -r perl5 pnd/lib
	cp -r get-flash-videos/lib/FlashVideo pnd/lib/perl5
	cp rtmpdump/librtmp/librtmp.so.0 pnd/lib
	mkdir -p pnd/defaults/plugins
	cp gfv-plugins/Hulu.pm pnd/defaults/plugins
	mkdir -p pnd/bin
	cp get-flash-videos/get_flash_videos pnd/bin
	cp rtmpdump/rtmpdump pnd/bin
	$(STRIP) pnd/lib/librtmp.so.0
	$(STRIP) pnd/bin/rtmpdump
	cp pandora/* pnd
	pod2text get-flash-videos/doc/get_flash_videos.pod pnd/get_flash_videos.txt
	$(PND_MAKE) -p get-flash-videos_$(VER).pnd -d pnd -x pnd/PXML.xml -i pandora/icon.png -c

rtmpdump: 
	$(MAKE) -C rtmpdump \
	    CROSS_COMPILE=$(HOME)/pandora-dev/arm-2011.03/bin/arm-none-linux-gnueabi- \
	    INC=-I$(HOME)/pandora-dev/arm-2011.03/usr/include \
	    XLDFLAGS=-L$(HOME)/pandora-dev/arm-2011.03/usr/lib

clean:
	make -C rtmpdump clean
	rm -rf pnd

.PHONY: rtmpdump
