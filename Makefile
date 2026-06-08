# Default Makefile Template
include $(THEOS)/makefiles/common.mk
TWEAK_NAME = ClonedUI
ClonedUI_FILES = Tweak.xm MenuViewController.m
ClonedUI_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk
