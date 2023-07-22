import QtQuick
import QtQuick.Controls 2.15
import QtQuick.VirtualKeyboard

import Garno 1.0

Page {
    id: root

    property color color: "black"

    contentItem: Column{
        Rectangle{
            id: resaultColor
            width: parent.width
            height: (parent.height/5)*3
            Component.onCompleted: resaultColor.color = root.color
            Text{
                id: input
                anchors.centerIn: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: resaultColor.color
                color: Qt.rgba((1-resaultColor.color.r), (1-resaultColor.color.g), (1-resaultColor.color.b), 1)
                font.pixelSize: parent.height/5
                font.bold: true
//                EnterKeyAction.enabled: true
//                EnterKeyAction.label: "OK"
//                EnterKeyAction.actionId: EnterKeyAction.Done
//                Keys.onReleased: {
//                    if (event.key === Qt.Key_Return) {
//                        console.log(">>>>>>>>>>>>>>> ", text, Qt.color(text))
//                        resaultColor.color = Qt.color(text)
//                        focus = false
//                    }
//                }
            }
        }

        Rectangle{
            id: control

            color: "gray"
            width: parent.width
            height: (parent.height/5)*2

            Column{
                anchors.centerIn: parent
                spacing: parent.height/10

                Row{
                    Text{
                        anchors.verticalCenter: sliderR.verticalCenter
                        text: "R: " + Math.ceil(sliderR.value)
                        color: "#E91E63"
                        font.pointSize: 20
                        font.bold: true
                    }
                    Slider{
                        id: sliderR
                        from: 0
                        to: 255
                        value: resaultColor.color.r*255
                        onValueChanged: {
                            resaultColor.color = Qt.rgba((value/255), resaultColor.color.g, resaultColor.color.b, 1)
                        }
                    }
                }

                Row{
                    Text{
                        anchors.verticalCenter: sliderG.verticalCenter
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        text: "G: " + Math.ceil(sliderG.value)
                        color: "#E91E63"
                        font.pointSize: 20
                        font.bold: true
                    }
                    Slider{
                        id: sliderG
                        from: 0
                        to: 255
                        value: resaultColor.color.g*255
                        onValueChanged: resaultColor.color = Qt.rgba(resaultColor.color.r, (value/255), resaultColor.color.b, 1)
                    }
                }
                Row{
                    Text{
                        anchors.verticalCenter: sliderB.verticalCenter
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        text: "B: " + Math.ceil(sliderB.value)
                        color: "#E91E63"
                        font.pointSize: 20
                        font.bold: true
                    }

                    Slider{
                        id: sliderB
                        from: 0
                        to: 255
                        value: resaultColor.color.b*255
                        onValueChanged: resaultColor.color = Qt.rgba(resaultColor.color.r, resaultColor.color.g, (value/255), 1)
                    }
                }

            }
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
