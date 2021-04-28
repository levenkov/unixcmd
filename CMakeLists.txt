cmake_minimum_required(VERSION 3.17)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_BINARY_DIR})

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

project(unixcmd)

set (CMAKE_CXX_STANDARD 17)

if(USE_CONAN)
    include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    conan_basic_setup(KEEP_RPATHS)
endif()

find_package(Qt5 COMPONENTS Widgets Qml Quick Core Network REQUIRED)

set(SOURCES main.cpp qml/main.qml)

qt5_add_resources(SOURCES qml.qrc)

add_executable(unixcmd ${SOURCES})

target_link_libraries(unixcmd Qt::Widgets Qt::Quick Qt::Core Qt::Qml)

target_link_libraries(unixcmd "-framework SystemConfiguration")
target_link_libraries(unixcmd "-framework GSS")