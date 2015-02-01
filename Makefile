all: clean deb

clean:
	rm -rf build

deb: 
	mkdir -p build/debian 2> /dev/null || true
	cp -a files build/debian/files
	cp -a debian build/debian/debian
	cd build/debian; debuild -us -uc -i
