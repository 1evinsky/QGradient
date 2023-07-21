pragma Singleton
import QtQuick

QtObject {
    enum Theme {
        Light
    }
    property int theme: Style.Theme.Dark
}
