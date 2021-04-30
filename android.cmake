find_package(Qt6 COMPONENTS Widgets Quick Core Network)

set(SOURCES main.cpp qml/main.qml)

qt6_add_resources(SOURCES qml.qrc)

configure_file(android/deployment.json.in android/unixcmd-config.json.pre)

file(GENERATE OUTPUT android/unixcmd-config.json INPUT android/unixcmd-config.json.pre)

set(APK_DIR ${CMAKE_CURRENT_BINARY_DIR}/unixcmd-apk-build)

add_custom_target(
    unixcmd-apk
    COMMAND ${CMAKE_COMMAND} -E remove_directory ${APK_DIR}
    COMMAND ${CMAKE_COMMAND} -E make_directory ${APK_DIR}/libs/${CMAKE_ANDROID_ARCH_ABI}
    COMMAND ${CMAKE_COMMAND} -E copy ${APK_TARGET_OUTPUT_FILENAME} ${APK_DIR}/libs/${CMAKE_ANDROID_ARCH_ABI}
    COMMAND ${CONAN_QT_ROOT}/bin/androiddeployqt
        --verbose
        --output ${APK_DIR}
        --input ${CMAKE_CURRENT_BINARY_DIR}/unixcmd-config.json
        --deployment bundled
        --gradle
        --jdk ${JAVA_HOME}
)
