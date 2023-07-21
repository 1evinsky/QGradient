qt_add_library(GarnoLib STATIC)

set_target_properties(GarnoLib PROPERTIES AUTOMOC ON)
target_link_libraries(GarnoLib PRIVATE Qt6::Quick)

list(APPEND MODULE_QML_FILES
    GRectangle.qml
    Button.qml
)

list(APPEND MODULE_QML_SINGELTON_FILES
    Style.qml)

set_source_files_properties(${MODULE_QML_SINGELTON_FILES} PROPERTIES
    QT_QML_SINGLETON_TYPE  TRUE
)

qt_add_qml_module(GarnoLib
    URI Garno
    VERSION 1.0
    RESOURCE_PREFIX /garno.com/import
    QML_FILES
        ${MODULE_QML_FILES} ${MODULE_QML_SINGELTON_FILES}
)
