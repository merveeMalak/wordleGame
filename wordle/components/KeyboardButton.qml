import QtQuick 2.15

Rectangle {
    id : keyboardButton
    width: letter.width + 30
    height: 50
    color: "lightGray"
    signal buttonClicked
    Text {
        id : letter
        anchors.centerIn: parent
        text: modelData
        font.pointSize: 20
    }
    MouseArea {
        anchors.fill: parent
        onClicked: keyboardButton.buttonClicked()

    }
}
