import QtQuick 2.15

Rectangle {
    id: root
    implicitWidth: 100
    implicitHeight: 100
    gradient: Gradient {
            GradientStop { position: 0.0; color: "#2980B9" }
            GradientStop { position: 0.5; color: "#6DD5FA" }
            GradientStop { position: 1.0; color: "#FFFFFF" }
            orientation: Gradient.Horizontal
        }
    border.width: 1
    border.color: "black"
    radius: 5
}
