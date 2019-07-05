SCRIPT_NAME = stars
SCRIPT = stars.sh
PREFIX = /usr/local
DESTDIR =
INSTDIR = $(DESTDIR)$(PREFIX)
INSTBIN = $(INSTDIR)/bin
INSTMAN = $(INSTDIR)/share/man/man6

.PHONY: install
install:
	test -d $(INSTDIR) || mkdir -p $(INSTDIR)
	test -d $(INSTBIN) || mkdir -p $(INSTBIN)
	
	install -m 0755 $(SCRIPT) $(INSTBIN)/$(SCRIPT_NAME)

.PHONY: uninstall
uninstall:
	$(RM) $(INSTBIN)/$(SCRIPT_NAME)
