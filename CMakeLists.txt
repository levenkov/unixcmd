cmake_minimum_required(VERSION 3.17)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_BINARY_DIR})

project(unixcmd)

set (CMAKE_CXX_STANDARD 17)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup(KEEP_RPATHS)

find_package(Qt6 COMPONENTS Widgets Quick Core Network)

set(SOURCES main.cpp qml/main.qml)

qt6_add_resources(SOURCES qml.qrc)

add_executable(unixcmd ${SOURCES})

target_link_libraries(unixcmd Qt6::Widgets Qt6::Quick Qt6::Core Qt6::Network)

target_link_libraries(unixcmd "-framework SystemConfiguration")
target_link_libraries(unixcmd "-framework GSS")

set_target_properties(unixcmd PROPERTIES QUL_DEFAULT_FONT_FAMILY "Arial")