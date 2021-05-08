cmake_minimum_required(VERSION 3.17)

include(${CMAKE_BINARY_DIR}/conan_toolchain.cmake)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_BINARY_DIR})
set(CMAKE_CXX_STANDARD 17)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

project(unixcmd LANGUAGES CXX)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup(KEEP_RPATHS)

find_package(qt COMPONENTS Widgets Quick Core Network REQUIRED)

if(ANDROID)
    add_library(unixcmd SHARED)
else()
    add_executable(unixcmd)
endif()

set(SOURCES qml/main.qml)

qt5_add_resources(SOURCES qml.qrc)

set_target_properties(unixcmd PROPERTIES XCODE_ATTRIBUTE_ENABLE_BITCODE "NO")


target_sources(unixcmd PUBLIC main.cpp ${SOURCES})

#target_link_libraries(unixcmd Qt5Widgets_armeabi-v7a Qt5Qml_armeabi-v7a Qt5Quick_armeabi-v7a Qt5Gui_armeabi-v7a Qt5Core_armeabi-v7a Qt5Network_armeabi-v7a)
target_link_libraries(unixcmd Qt5Widgets Qt5Qml Qt5QmlModels Qt5QmlWorkerScript Qt5QuickTemplates2 Qt5QuickControls2 Qt5Quick Qt5Gui Qt5Core Qt5Network Qt5GraphicsSupport Qt5FontDatabaseSupport Qt5ClipboardSupport qtpcre2 qios)


set_property(TARGET unixcmd APPEND_STRING PROPERTY LINK_FLAGS " -Wl,-e,_qt_main_wrapper")

if(APPLE OR IOS)
    target_link_libraries(unixcmd "-framework SystemConfiguration")
    target_link_libraries(unixcmd "-framework Foundation")
    target_link_libraries(unixcmd "-framework ImageIO")
    target_link_libraries(unixcmd "-framework CoreText")
    target_link_libraries(unixcmd "-framework CoreGraphics")
    target_link_libraries(unixcmd "-framework AudioToolbox")
    target_link_libraries(unixcmd "-framework QuartzCore")
    target_link_libraries(unixcmd "-framework UIKit")
    target_link_libraries(unixcmd "-framework MobileCoreServices")
    target_link_libraries(unixcmd "-framework OpenGLES")
    target_link_libraries(unixcmd "-framework Metal")
    target_link_libraries(unixcmd "-framework GSS")
endif()

target_link_libraries(unixcmd crypto ssl z qtquick2plugin qmlplugin qtquickcontrols2plugin modelsplugin workerscriptplugin labsmodelsplugin qquicklayoutsplugin windowplugin qtquicktemplates2plugin)

target_link_directories(unixcmd PRIVATE
    ${CONAN_QT_ROOT}/bin/archdatadir/plugins/platforms
    ${CONAN_QT_ROOT}/bin/archdatadir/qml/QtQml
    ${CONAN_QT_ROOT}/bin/archdatadir/qml/QtQuick.2
    ${CONAN_QT_ROOT}/bin/archdatadir/qml/QtQml/Models.2
    ${CONAN_QT_ROOT}/bin/archdatadir/qml/QtQml/WorkerScript.2
    ${CONAN_QT_ROOT}/bin/archdatadir/qml/QtQuick/Controls.2
    ${CONAN_QT_ROOT}/bin/archdatadir/qml/QtQuick/Window.2
    ${CONAN_QT_ROOT}/bin/archdatadir/qml/QtQuick/Layouts
    ${CONAN_QT_ROOT}/bin/archdatadir/qml/QtQuick/Templates.2
    ${CONAN_QT_ROOT}/bin/archdatadir/qml/Qt/labs/qmlmodels
)

#set_property(TARGET unixcmd PROPERTY XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "Sign identity")
#set_property(TARGET unixcmd PROPERTY XCODE_ATTRIBUTE_DEVELOPMENT_TEAM "TeamID")

set_property(TARGET unixcmd PROPERTY XCODE_ATTRIBUTE_CODE_SIGNING_ALLOWED "NO")

set_target_properties(unixcmd PROPERTIES
        MACOSX_BUNDLE TRUE
        MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_LIST_DIR}/ios/Info.plist"
        XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES FALSE
        XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY "1,2"
        XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_APPICON_NAME "AppIcon"
)
