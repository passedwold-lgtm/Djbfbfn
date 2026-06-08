# Default Makefile Template
export TARGET = iphone:latest
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Menu
Menu_FILES = Tweak.xm MenuViewController.m
Menu_FRAMEWORKS = UIKit
Menu_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-error

include $(THEOS_MAKE_PATH)/tweak.mk
