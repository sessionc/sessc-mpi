#
# src/Makefile
#

ROOT := ..
include $(ROOT)/Common.mk

all: sharedlib objs

objs: $(BUILD_DIR)/session.o $(BUILD_DIR)/primitives.o

sharedlib: $(BUILD_DIR)/sc_session.so $(BUILD_DIR)/sc_primitives.so

include $(ROOT)/Rules.mk
