cmake_minimum_required(VERSION 3.31.11)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(CXX-STD-MODULE LANGUAGES CXX)

set(LIBCXX_MODULE_DIR "/usr/share/libc++/v1")

add_library(std)
target_sources(std PUBLIC
    FILE_SET CXX_MODULES
    BASE_DIRS ${LIBCXX_MODULE_DIR}
    FILES ${LIBCXX_MODULE_DIR}/std.cppm
)
target_compile_features(std PUBLIC cxx_std_23)
target_compile_options(std PUBLIC
    $<$<CXX_COMPILER_ID:Clang>:-stdlib=libc++>
    -Wno-reserved-module-identifier
)
target_link_options(std PUBLIC
    $<$<CXX_COMPILER_ID:Clang>:-stdlib=libc++>
)

add_executable(${PROJECT_NAME})
target_sources(${PROJECT_NAME} PRIVATE
    main.cpp
)
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_23)
target_compile_options(${PROJECT_NAME} PRIVATE
    $<$<CXX_COMPILER_ID:Clang>:-stdlib=libc++>
    -Wno-reserved-module-identifier
)
target_link_libraries(${PROJECT_NAME} PRIVATE std)
target_link_options(${PROJECT_NAME} PRIVATE
    $<$<CXX_COMPILER_ID:Clang>:-stdlib=libc++>
)
