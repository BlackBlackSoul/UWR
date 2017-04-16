cmake_minimum_required(VERSION 3.6)
project(Piata)

set(CMAKE_CXX_STANDARD 14)

set(SOURCE_FILES main.cpp DoubleLinkedListh.h DoubleLinkedListsource.cpp)
add_executable(Piata ${SOURCE_FILES})