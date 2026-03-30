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

.PHONY: install uninstall update update-submodules
