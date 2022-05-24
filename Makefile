PREFIX=/usr
MANDIR=$(PREFIX)/share/man
BINDIR=$(PREFIX)/bin

all:
	@echo "Run 'make install' for installation."
	@echo "Run 'make uninstall' for uninstallation."

install:
	install -CDm755 create_ap $(DESTDIR)$(BINDIR)/create_ap
	install -CDm644 create_ap.conf $(DESTDIR)/etc/create_ap.conf
	install -CDm644 create_ap.service $(DESTDIR)$(PREFIX)/lib/systemd/system/create_ap.service
	install -CDm644 bash_completion $(DESTDIR)$(PREFIX)/share/bash-completion/completions/create_ap

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/create_ap
	rm -f $(DESTDIR)/etc/create_ap.conf
	rm -f $(DESTDIR)$(PREFIX)/lib/systemd/system/create_ap.service
	rm -f $(DESTDIR)$(PREFIX)/share/bash-completion/completions/create_ap
