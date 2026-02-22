include MANIFEST

TARGETS=$(dotfiles:%=$(HOME)/.%)
CWD=$(shell pwd)

$(HOME)/.%: %
	@if [ -e $@ ]; then mv $@ $@.bak; fi
	@echo "Installing $<"
	@ln -sf $(CWD)/$< $@

install: $(TARGETS)
	git submodule update --init --recursive
	vim +PlugInstall +qall
	@bash osx

uninstall:
	rm -f $(TARGETS)

update:
	git pull
	git submodule sync
	git submodule update --init --recursive
	vim +PlugUpdate +qall

# Update submodules (including vim-plug) to latest from upstream
update-submodules:
	git submodule update --init --recursive --remote
	vim +PlugUpdate +qall

# macOS defaults - safe by default; set OSX_DESTRUCTIVE=1 for Time Machine disable, etc.
osx:
	@bash osx

.PHONY: install uninstall update update-submodules osx
