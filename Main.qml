import QtQuick
import QtQuick.Window 2.2
import QtQuick.Controls 2.15

import Garno 1.0

Window {
    id: root
    width: 384
    height: 853
    visible: true
    title: qsTr("Hello World")

    flags: Qt.Window | Qt.WindowFullscreenButtonHint

    visibility: Qt.platform.os === "windows" ? Window.Windowed : Window.FullScreen

    Component.onCompleted: {
        console.log(Style.theme)
    }

    Rectangle{
        id: rect
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: 100
        height: 100
        color: "black"
    }

    Button{
        id: button
        anchors.centerIn: parent
        text: "Add"
    }
}
