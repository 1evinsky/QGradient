import QtQuick
import QtQuick.Controls 2.15

import Garno 1.0

Page {
    id: root


    footer: Rectangle{
        anchors.bottom: parent.bottom
        width: parent.width
        height: addButton.height
        color: "black"
        Button{
            id: addButton
            text: "+"
            anchors.centerIn: parent
            onClicked: load_page("Page 2", {"color1": "blue", "color2": "red"})
        }
    }
}
