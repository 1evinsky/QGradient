import QtQuick 2.15
import QtQuick.Templates as T

T.Button {
    id: root
    implicitHeight: 40
    implicitWidth: 100

//    property color color1: "#7F7FD5"
//    property color color2: "#86A8E7"
//    property color color3: "#91EAE4"

    property color color1: "#2193b0"
    property color color3: "#6dd5ed"

    property Gradient press: Gradient {
        GradientStop { position: 0.0; color: Qt.darker(color1, 1.1) }
//        GradientStop { position: 0.5; color: Qt.darker(color2, 1.1) }
        GradientStop { position: 1.0; color: Qt.darker(color3, 1.1) }
        orientation: Gradient.Horizontal
    }

    property Gradient notPress: Gradient {
        GradientStop { position: 0.0; color: color1 }
//        GradientStop { position: 0.5; color: color2 }
        GradientStop { position: 1.0; color: color3 }
        orientation: Gradient.Horizontal
    }

    states: [
        State {
            name: "down"
            when: root.down
            PropertyChanges {
                target: backgroundItem
                gradient: press
            }
        },
        State {
            name: "up"
            when: !root.down
            PropertyChanges {
                target: backgroundItem
                gradient: notPress
            }
        }
    ]

    background: GRectangle{
        id: backgroundItem
        implicitWidth: root.width
        implicitHeight: root.height
    }
    contentItem: Text{
        text: root.text
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }


}
