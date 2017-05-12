cmake_minimum_required(VERSION 3.6)
project(Siodma)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES main.cpp LiczbyWymierne.h LiczbyWymierne.cpp)
add_executable(Siodma ${SOURCE_FILES})