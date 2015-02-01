socksproxy
----------

sockproxy is a simple script to run a SSH powered SOCKS proxy on your own server. It is merely a wrapper script to orchestrate `ssh` and `iptables` properly to make it easier in everyday use.

Installation
------------
Dependencies are *SSHd* and *iptables*, so be sure to have those installed.

On Debian-based systems: Either download a `.deb`-file from the [release page](https://github.com/binwiederhier/socksproxy/releases) or compile it yourself:
```bash
$ make
$ sudo dpkg -i build/*.deb
```

Manually:
```bash
$ sudo cp files/sbin/* /sbin
$ sudo cp files/etc/* /etc
```

Usage
-----
Edit the config file at `/etc/socksproxy.conf` and add the allowed IP addresses and (if you like) the port on which the proxy should run on:

```bash
# Sets the port on which the proxy can be accessed on.
proxyport=1337

# Defines the IP addresses allowed to use the proxy. 
allowedips=1.2.3.4 5.6.7.8
```

Then start the SOCKS proxy by running:

```bash
$ socksproxy start
Starting socksproxy on port 1337 ... Started with PID 15761.
```

You can now add it to your browser / operating system config and you are ready to surf via your proxy host!

