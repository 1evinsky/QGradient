pragma Singleton
import QtQuick

QtObject {
    enum Theme {
        Light,
        Dark
    }
    property int theme: Style.Theme.Dark
}
