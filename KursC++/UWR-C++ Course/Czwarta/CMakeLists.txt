cmake_minimum_required(VERSION 3.6)
project(Czwarta)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES main.cpp Wielomian.h source.cpp)
add_executable(Czwarta ${SOURCE_FILES})