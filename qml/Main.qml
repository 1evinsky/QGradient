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

    onClosing:{
        if(mainStack.depth > 1){
            close.accepted = false
            mainStack.pop()
        }
    }
    
    StackView{
        id: mainStack
        anchors.fill: parent
        initialItem: listPage
    }

    Component{
        id: listPage
        ListPage{

        }
    }

    Component{
        id: addPage
        AddMenu{

        }
    }

    Component{
        id: addColorMenu
        AddColorMenu{

        }
    }

    function load_page(page, params) {
        switch (page) {
        case 'Page 1':
            mainStack.push(listPage);
            break;
        case 'Page 2':
            mainStack.push(addPage, params);
            break;
        case 'Page 3':
            mainStack.push(addColorMenu, params);
            break;
        }
    }
}
