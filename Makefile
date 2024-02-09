# Makefile to build my custom keyboard firmware
#

SOURCES = keymaps/cooperwallace left right
QMK_PATH = qmk_firmware/keyboards/lily58/

all: lily58

.PHONY: lily58
lily58: $(SOURCES)
	git submodule update --init --recursive
	make -C qmk_firmware lily58/left:cooperwallace lily58/right:cooperwallace
	mv qmk_firmware/lily58_left_cooperwallace.hex .
	mv qmk_firmware/lily58_right_cooperwallace.hex .

.PHONY: $(SOURCES)
$(SOURCES):
	rm -rf $(QMK_PATH)/$@
	ln -sf $(PWD)/lily58/$@ $(QMK_PATH)$(dir $@)

clean:
	make -C qmk_firmware clean

