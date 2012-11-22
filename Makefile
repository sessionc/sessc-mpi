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

install: libsc-mpi libsc-mpi.a
	$(MKDIR) $(DESTDIR)/usr/include/sc
	$(MKDIR) $(DESTDIR)/usr/lib
	$(INSTALL) $(INCLUDE_DIR)/sc/*.h $(DESTDIR)/usr/include/sc
	$(INSTALL) $(BUILD_DIR)/*.so $(DESTDIR)/usr/lib
	$(INSTALL) $(LIB_DIR)/*.a $(DESTDIR)/usr/lib

pkg-deb: all
	dpkg-buildpackage -us -uc -rfakeroot

include $(ROOT)/Rules.mk
