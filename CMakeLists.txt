cmake_minimum_required(VERSION 3.13)
project(asciifolding C)

set(CMAKE_C_STANDARD 99)

find_package(PostgreSQL REQUIRED)

include_directories(${PostgreSQL_INCLUDE_DIRS})

add_library(asciifolding SHARED asciifolding.c)
target_compile_options(
        asciifolding
        PRIVATE
        -Ofast
        -march=native
)