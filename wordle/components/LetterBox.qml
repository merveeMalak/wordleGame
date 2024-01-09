import QtQuick 2.15
import "../constants"

Rectangle {
    id : letterBox
    property alias cellText : cellText.text
    property color cellTextColor : AppConstants.closeLetterColor
    width: AppConstants.letterBoxSize
    height: AppConstants.letterBoxSize
    border.color: AppConstants.cellBorderColor

    Text {
        id: cellText
        text: "" // Initial empty text
        anchors.centerIn: parent
        color : cellTextColor
    }

}
