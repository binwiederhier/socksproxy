all:
	@echo "Usage: make (clean|install|uninstall|deb)"

clean:
	rm -rf build
	
install:
	@test `id -u` = 0 || (echo "make install: Need to be root" && exit 1)
	cp -a files/etc/init.d/socksproxy /etc/init.d/socksproxy
	cp -a files/sbin/socksproxy /sbin/socksproxy
	cp -a files/etc/socksproxy.conf /etc/socksproxy.conf
	debian/postinst configure

uninstall:
	@test `id -u` = 0 || (echo "make install: Need to be root" && exit 1)
	debian/prerm remove
	rm /etc/init.d/socksproxy 2> /dev/null || true
	rm /sbin/socksproxy 2> /dev/null || true
	cp -a /etc/socksproxy.conf /etc/socksproxy.conf.`date +%s` || true
	debian/postrm remove
	
deb: 
	mkdir -p build/debian 2> /dev/null || true
	cp -a files build/debian/files
	cp -a debian build/debian/debian
	cd build/debian; debuild -us -uc -i	
