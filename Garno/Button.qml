import QtQuick 2.15
import QtQuick.Templates as T

T.Button {
    id: root
    implicitHeight: 40
    implicitWidth: 100

    property alias radius: backgroundItem.radius

    property color color1: "#2193b0"
    property color color2: "#6dd5ed"
    property bool orientation: false

    property Gradient press: Gradient {
        GradientStop { position: 0.0; color: Qt.darker(color1, 1.1) }
        GradientStop { position: 1.0; color: Qt.darker(color2, 1.1) }
        orientation: root.orientation ? Gradient.Vertical : Gradient.Horizontal
    }

    property Gradient notPress: Gradient {
        GradientStop { position: 0.0; color: color1 }
        GradientStop { position: 1.0; color: color2 }
        orientation: root.orientation ? Gradient.Vertical : Gradient.Horizontal
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
