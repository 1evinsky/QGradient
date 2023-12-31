cmake_minimum_required(VERSION 3.16)

project(QGradient VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS VirtualKeyboard)

qt_standard_project_setup()

qt_add_executable(appQGradient
    main.cpp
    src/UILogic.hpp src/UILogic.cpp
)

qt_add_qml_module(appQGradient
    URI QGradient
    VERSION 1.0
    QML_FILES qml/Main.qml
    qml/ListPage.qml
    qml/AddMenu.qml
    qml/AddColorMenu.qml
)


add_subdirectory(Garno)

set_target_properties(appQGradient PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQGradient
    PRIVATE Qt6::Quick GarnoLibplugin
)
target_link_libraries(appQGradient PRIVATE Qt6::VirtualKeyboard)

install(TARGETS appQGradient
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
