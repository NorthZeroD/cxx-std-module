cmake_minimum_required(VERSION 3.31.11)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(HELLO_STD_MODULE LANGUAGES CXX)

set(CLANG_MODULE_DIR "/usr/share/libc++/v1")
set(GCC_MODULE_DIR "/usr/include/c++/15/bits")


add_library(STD_MODULE)
target_compile_features(STD_MODULE PUBLIC cxx_std_23)
target_compile_options(STD_MODULE PUBLIC
    $<$<CXX_COMPILER_ID:Clang>:-stdlib=libc++>
    $<$<CXX_COMPILER_ID:Clang>:-Wno-reserved-module-identifier>
)
target_link_options(STD_MODULE PUBLIC
    $<$<CXX_COMPILER_ID:Clang>:-stdlib=libc++>
)

if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    target_sources(STD_MODULE PUBLIC
        FILE_SET CXX_MODULES
        BASE_DIRS ${CLANG_MODULE_DIR}
        FILES ${CLANG_MODULE_DIR}/std.cppm
    )
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    target_sources(STD_MODULE PUBLIC
        FILE_SET CXX_MODULES
        BASE_DIRS ${GCC_MODULE_DIR}
        FILES ${GCC_MODULE_DIR}/std.cc
    )
else()
    message(FATAL_ERROR "This project requires Clang or GNU")
endif()


add_executable(${PROJECT_NAME})
target_sources(${PROJECT_NAME} PRIVATE
    main.cpp
)
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_23)
target_compile_options(${PROJECT_NAME} PRIVATE
    $<$<CXX_COMPILER_ID:Clang>:-stdlib=libc++>
    -Wno-reserved-module-identifier
)
target_link_libraries(${PROJECT_NAME} PRIVATE STD_MODULE)
target_link_options(${PROJECT_NAME} PRIVATE
    $<$<CXX_COMPILER_ID:Clang>:-stdlib=libc++>
)
