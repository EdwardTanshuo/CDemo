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
include tests/CMakeFiles/unity.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/unity.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/unity.dir/flags.make

tests/CMakeFiles/unity.dir/unity/src/unity.c.o: tests/CMakeFiles/unity.dir/flags.make
tests/CMakeFiles/unity.dir/unity/src/unity.c.o: ../tests/unity/src/unity.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/shuotan/Desktop/Spider/Spider/src/json/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/CMakeFiles/unity.dir/unity/src/unity.c.o"
	cd /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/unity.dir/unity/src/unity.c.o   -c /Users/shuotan/Desktop/Spider/Spider/src/json/tests/unity/src/unity.c

tests/CMakeFiles/unity.dir/unity/src/unity.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/unity.dir/unity/src/unity.c.i"
	cd /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/shuotan/Desktop/Spider/Spider/src/json/tests/unity/src/unity.c > CMakeFiles/unity.dir/unity/src/unity.c.i

tests/CMakeFiles/unity.dir/unity/src/unity.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/unity.dir/unity/src/unity.c.s"
	cd /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/shuotan/Desktop/Spider/Spider/src/json/tests/unity/src/unity.c -o CMakeFiles/unity.dir/unity/src/unity.c.s

tests/CMakeFiles/unity.dir/unity/src/unity.c.o.requires:

.PHONY : tests/CMakeFiles/unity.dir/unity/src/unity.c.o.requires

tests/CMakeFiles/unity.dir/unity/src/unity.c.o.provides: tests/CMakeFiles/unity.dir/unity/src/unity.c.o.requires
	$(MAKE) -f tests/CMakeFiles/unity.dir/build.make tests/CMakeFiles/unity.dir/unity/src/unity.c.o.provides.build
.PHONY : tests/CMakeFiles/unity.dir/unity/src/unity.c.o.provides

tests/CMakeFiles/unity.dir/unity/src/unity.c.o.provides.build: tests/CMakeFiles/unity.dir/unity/src/unity.c.o


# Object files for target unity
unity_OBJECTS = \
"CMakeFiles/unity.dir/unity/src/unity.c.o"

# External object files for target unity
unity_EXTERNAL_OBJECTS =

tests/libunity.dylib: tests/CMakeFiles/unity.dir/unity/src/unity.c.o
tests/libunity.dylib: tests/CMakeFiles/unity.dir/build.make
tests/libunity.dylib: tests/CMakeFiles/unity.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/shuotan/Desktop/Spider/Spider/src/json/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library libunity.dylib"
	cd /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/unity.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/unity.dir/build: tests/libunity.dylib

.PHONY : tests/CMakeFiles/unity.dir/build

tests/CMakeFiles/unity.dir/requires: tests/CMakeFiles/unity.dir/unity/src/unity.c.o.requires

.PHONY : tests/CMakeFiles/unity.dir/requires

tests/CMakeFiles/unity.dir/clean:
	cd /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/unity.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/unity.dir/clean

tests/CMakeFiles/unity.dir/depend:
	cd /Users/shuotan/Desktop/Spider/Spider/src/json/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shuotan/Desktop/Spider/Spider/src/json /Users/shuotan/Desktop/Spider/Spider/src/json/tests /Users/shuotan/Desktop/Spider/Spider/src/json/build /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests /Users/shuotan/Desktop/Spider/Spider/src/json/build/tests/CMakeFiles/unity.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/unity.dir/depend

