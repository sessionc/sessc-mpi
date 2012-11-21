# Global rules
#

.PHONY: all clean clean-all

$(BUILD_DIR)/%.o: %.c $(INCLUDE_DIR)/sc/%-mpi.h
	$(MPICC) $(CFLAGS) -c $*.c \
	  -o $(BUILD_DIR)/$*.o

$(BUILD_DIR)/sc_%.so: $(BUILD_DIR)/%.o
	$(CC) $(CFLAGS) -shared $(BUILD_DIR)/$*.o \
	  -o $(BUILD_DIR)/sc_$*.so

clean:
	$(RM) -r $(BUILD_DIR)/*
	$(RM) -r $(BIN_DIR)/*

clean-all: clean
	$(RM) $(LIB_DIR)/lib*.a
