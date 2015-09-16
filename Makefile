CC      = gcc
CFLAGS  = -c -Wall
LDFLAGS = 

all: write-magic bubba-buttond

write-magic: write-magic.o
	$(CC) $(LDFLAGS) write-magic.o -o write-magic

bubba-buttond: bubba-buttond.o
	$(CC) $(LDFLAGS) bubba-buttond.o -o bubba-buttond

%.o: %.c
	$(CC) $(CFLAGS) $< -o $@

distclean: clean

clean:
	rm -f *.o write-magic bubba-buttond

install: all
	install -d -m 0755 $(DESTDIR)/usr/sbin
	install -m 0755 bubba-buttond $(DESTDIR)/usr/sbin
	install -m 0755 write-magic $(DESTDIR)/usr/sbin
	install -m 0755 b3-set-led $(DESTDIR)/usr/sbin

uninstall:
	rm -f $(DESTDIR)/usr/sbin/bubba-buttond $(DESTDIR)/usr/sbin/write-magic
	rmdir --ignore-fail-on-non-empty -p $(DESTDIR)/usr/sbin

