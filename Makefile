# 
# Makefile
#

ROOT := .
include $(ROOT)/Common.mk

all: libsc-mpi libsc-mpi.a

libsc-mpi:
	$(MAKE) --dir=src

libsc-mpi.a:
	$(RM) $(LIB_DIR)/$@
	$(MAKE) --dir=src
	$(AR) $(ARFLAGS) $(BUILD_DIR)/$@ $(BUILD_DIR)/*.o
	$(CP) -v $(BUILD_DIR)/$@ $(LIB_DIR)/$@

include $(ROOT)/Rules.mk
