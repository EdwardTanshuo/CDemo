# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.3

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.3.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.3.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/shuotan/Desktop/Spider/Spider/src/json

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/shuotan/Desktop/Spider/Spider/src/json/build

# Include any dependencies generated for this target.
include tests/CMakeFiles/print_value.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/print_value.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/print_value.dir/flags.make

tests/CMakeFiles/print_value.dir/print_value.c.o: tests/CMakeFiles/print_value.dir/flags.make
tests/CMakeFiles/print_value.dir/print_value.c.o: ../tests/print_value.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/shuotan/Desktop/Spider/Spider/src/json/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/CMakeFiles/print_value.dir/print_value.c.o"
	cd /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/print_value.dir/print_value.c.o   -c /Users/shuotan/Desktop/Spider/Spider/src/json/tests/print_value.c

tests/CMakeFiles/print_value.dir/print_value.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/print_value.dir/print_value.c.i"
	cd /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/shuotan/Desktop/Spider/Spider/src/json/tests/print_value.c > CMakeFiles/print_value.dir/print_value.c.i

tests/CMakeFiles/print_value.dir/print_value.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/print_value.dir/print_value.c.s"
	cd /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/shuotan/Desktop/Spider/Spider/src/json/tests/print_value.c -o CMakeFiles/print_value.dir/print_value.c.s

tests/CMakeFiles/print_value.dir/print_value.c.o.requires:

.PHONY : tests/CMakeFiles/print_value.dir/print_value.c.o.requires

tests/CMakeFiles/print_value.dir/print_value.c.o.provides: tests/CMakeFiles/print_value.dir/print_value.c.o.requires
	$(MAKE) -f tests/CMakeFiles/print_value.dir/build.make tests/CMakeFiles/print_value.dir/print_value.c.o.provides.build
.PHONY : tests/CMakeFiles/print_value.dir/print_value.c.o.provides

tests/CMakeFiles/print_value.dir/print_value.c.o.provides.build: tests/CMakeFiles/print_value.dir/print_value.c.o


# Object files for target print_value
print_value_OBJECTS = \
"CMakeFiles/print_value.dir/print_value.c.o"

# External object files for target print_value
print_value_EXTERNAL_OBJECTS =

tests/print_value: tests/CMakeFiles/print_value.dir/print_value.c.o
tests/print_value: tests/CMakeFiles/print_value.dir/build.make
tests/print_value: libcjson.1.5.7.dylib
tests/print_value: tests/libunity.dylib
tests/print_value: tests/libtest-common.dylib
tests/print_value: tests/CMakeFiles/print_value.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/shuotan/Desktop/Spider/Spider/src/json/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable print_value"
	cd /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/print_value.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/print_value.dir/build: tests/print_value

.PHONY : tests/CMakeFiles/print_value.dir/build

tests/CMakeFiles/print_value.dir/requires: tests/CMakeFiles/print_value.dir/print_value.c.o.requires

.PHONY : tests/CMakeFiles/print_value.dir/requires

tests/CMakeFiles/print_value.dir/clean:
	cd /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/print_value.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/print_value.dir/clean

tests/CMakeFiles/print_value.dir/depend:
	cd /Users/shuotan/Desktop/Spider/Spider/src/json/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shuotan/Desktop/Spider/Spider/src/json /Users/shuotan/Desktop/Spider/Spider/src/json/tests /Users/shuotan/Desktop/Spider/Spider/src/json/build /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests/CMakeFiles/print_value.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/print_value.dir/depend

