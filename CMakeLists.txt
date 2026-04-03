cmake_minimum_required(VERSION 3.31.11)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# The UUID depends on the CMake version. Each version has a unique UUID.
#
# To check your current CMake version, run the command `cmake --version`.
# 
# To find the UUID, go to the CMake source repository, switch to the tag which is your version,
# open `Help/dev/experimental.rst`, and read the section `C++ import std support`.
#
# For v3.31.11:
# https://github.com/Kitware/CMake/blob/v3.31.11/Help/dev/experimental.rst#c-import-std-support
set(CMAKE_EXPERIMENTAL_CXX_IMPORT_STD d0edc3af-4c50-42ea-a356-e2862fe7a444)
set(CMAKE_CXX_MODULE_STD ON)

project(HELLO_STD_MODULE LANGUAGES CXX)

add_executable(${PROJECT_NAME})
target_sources(${PROJECT_NAME} PRIVATE
    main.cpp
)
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_23)
