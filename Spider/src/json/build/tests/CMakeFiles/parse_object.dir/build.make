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
include tests/CMakeFiles/parse_object.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/parse_object.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/parse_object.dir/flags.make

tests/CMakeFiles/parse_object.dir/parse_object.c.o: tests/CMakeFiles/parse_object.dir/flags.make
tests/CMakeFiles/parse_object.dir/parse_object.c.o: ../tests/parse_object.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/shuotan/Desktop/Spider/Spider/src/json/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/CMakeFiles/parse_object.dir/parse_object.c.o"
	cd /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/parse_object.dir/parse_object.c.o   -c /Users/shuotan/Desktop/Spider/Spider/src/json/tests/parse_object.c

tests/CMakeFiles/parse_object.dir/parse_object.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/parse_object.dir/parse_object.c.i"
	cd /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/shuotan/Desktop/Spider/Spider/src/json/tests/parse_object.c > CMakeFiles/parse_object.dir/parse_object.c.i

tests/CMakeFiles/parse_object.dir/parse_object.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/parse_object.dir/parse_object.c.s"
	cd /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/shuotan/Desktop/Spider/Spider/src/json/tests/parse_object.c -o CMakeFiles/parse_object.dir/parse_object.c.s

tests/CMakeFiles/parse_object.dir/parse_object.c.o.requires:

.PHONY : tests/CMakeFiles/parse_object.dir/parse_object.c.o.requires

tests/CMakeFiles/parse_object.dir/parse_object.c.o.provides: tests/CMakeFiles/parse_object.dir/parse_object.c.o.requires
	$(MAKE) -f tests/CMakeFiles/parse_object.dir/build.make tests/CMakeFiles/parse_object.dir/parse_object.c.o.provides.build
.PHONY : tests/CMakeFiles/parse_object.dir/parse_object.c.o.provides

tests/CMakeFiles/parse_object.dir/parse_object.c.o.provides.build: tests/CMakeFiles/parse_object.dir/parse_object.c.o


# Object files for target parse_object
parse_object_OBJECTS = \
"CMakeFiles/parse_object.dir/parse_object.c.o"

# External object files for target parse_object
parse_object_EXTERNAL_OBJECTS =

tests/parse_object: tests/CMakeFiles/parse_object.dir/parse_object.c.o
tests/parse_object: tests/CMakeFiles/parse_object.dir/build.make
tests/parse_object: libcjson.1.5.7.dylib
tests/parse_object: tests/libunity.dylib
tests/parse_object: tests/libtest-common.dylib
tests/parse_object: tests/CMakeFiles/parse_object.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/shuotan/Desktop/Spider/Spider/src/json/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable parse_object"
	cd /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/parse_object.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/parse_object.dir/build: tests/parse_object

.PHONY : tests/CMakeFiles/parse_object.dir/build

tests/CMakeFiles/parse_object.dir/requires: tests/CMakeFiles/parse_object.dir/parse_object.c.o.requires

.PHONY : tests/CMakeFiles/parse_object.dir/requires

tests/CMakeFiles/parse_object.dir/clean:
	cd /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/parse_object.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/parse_object.dir/clean

tests/CMakeFiles/parse_object.dir/depend:
	cd /Users/shuotan/Desktop/Spider/Spider/src/json/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shuotan/Desktop/Spider/Spider/src/json /Users/shuotan/Desktop/Spider/Spider/src/json/tests /Users/shuotan/Desktop/Spider/Spider/src/json/build /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests/CMakeFiles/parse_object.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/parse_object.dir/depend

