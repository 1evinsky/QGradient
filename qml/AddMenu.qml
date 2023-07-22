import QtQuick
import QtQuick.Controls 2.15

import Garno 1.0

Page {
    id: root

    property color color1: "orange"
    property color color2: "green"

    contentItem:  Column{

    Button{
        id: first
        width: parent.width
        height: parent.height/3
        color1: root.color1
        color2: root.color1
        radius: 0
        onClicked: load_page("Page 3", {"color": root.color1})
    }
    Button{
        id: second
        width: parent.width
        height: parent.height/3
        color1: root.color2
        color2: root.color2
        radius: 0
        onClicked: load_page("Page 3", {"color": root.color2})
    }
    Button{
        width: parent.width
        height: parent.height/3
        color1: first.color1
        color2: second.color1
        radius: 0
        onClicked: orientation = !orientation
    }

    }
    footer: Rectangle{
        anchors.bottom: parent.bottom
        width: parent.width
        height: addButton.height
        color: "black"
        Row{
            anchors.centerIn: parent
            spacing: (parent.width - addButton.width - cancelButton.width)/2
        Button{
            id: addButton
            text: "Add"
            onClicked: mainStack.pop()
        }
        Button{
            id: cancelButton
            text: "Cancel"
            onClicked: mainStack.pop()
        }
        }
    }
}
