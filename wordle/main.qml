import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "pages"

Window {
    width: 640
    height: 600
    visible: true
    title: qsTr("Wordle")

    StackView{
        id: stackView
        focus: true
        initialItem: HomePage{}
        anchors.fill: parent
    }

}
