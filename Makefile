# Compiler and flags
CXX := g++-14
CXXFLAGS :=  -Wall -Wextra -O2

# Source files
SRCS := avl.cpp hashtable.cpp heap.cpp server.cpp thread_pool.cpp zset.cpp

# Header files
HEADERS := avl.h common.h hashtable.h heap.h list.h thread_pool.h zset.h

# Object files
OBJS := $(SRCS:.cpp=.o)

# Executable name
TARGET := server

# Default rule
all: $(TARGET)

# Linking the executable
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compiling .cpp files to .o files
%.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up object files and the executable
clean:
	rm -f $(OBJS) $(TARGET)

# Phony targets
.PHONY: all clean
