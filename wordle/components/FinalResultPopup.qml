import QtQuick 2.15
import QtQuick.Controls 2.15
import "../constants"

Popup {
    id:  finalResultPopup
    property alias message: message.text
    property alias color : popupbackground.color
    implicitWidth: 300
    implicitHeight : 300
    background: Rectangle {
        id: popupbackground
        radius: AppConstants.popupRadius
    }
    visible: false
    contentItem : Text {
        id: message
        width : parent.width
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.pixelSize: AppConstants.letterSize
        anchors.centerIn : parent
    }
    onOpened: popupClose.start()

    Timer{
        id : popupClose
        interval: 2000
        onTriggered: {
            finalResultPopup.close()
        }
    }


}


