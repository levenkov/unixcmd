find_package(Qt6 COMPONENTS Widgets Quick Core Network)

set(SOURCES main.cpp qml/main.qml)

qt6_add_resources(SOURCES qml.qrc)

add_executable(unixcmd ${SOURCES})

target_link_libraries(unixcmd Qt6::Widgets Qt6::Quick Qt6::Core Qt6::Network)

if(APPLE)
    target_link_libraries(unixcmd "-framework SystemConfiguration")
    target_link_libraries(unixcmd "-framework GSS")
endif()
