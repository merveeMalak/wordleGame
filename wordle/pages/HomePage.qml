import QtQuick 2.15
import QtQuick.Controls 2.15
import "../constants"

Page{
    id : homePage
    background: Rectangle{
        color : AppConstants.backgroundColor
        anchors.fill: parent
    }
    Column {
        id : column
        spacing: 20
        anchors.centerIn: parent

        Image {
            id : img
            source: "../constants/assets/grid.png"
            width : AppConstants.letterBoxSize
            height: AppConstants.letterBoxSize
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id : wordleText
            text : qsTr(AppConstants.wordleText)
            font {
                pixelSize: AppConstants.wordleTextSize
                bold: true
            }
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            id : playGameText
            text : qsTr(AppConstants.playGameText)
            anchors.horizontalCenter: parent.horizontalCenter
            font {
                pixelSize : AppConstants.letterSize
            }
        }
        Rectangle {
            id : playButton
            anchors.horizontalCenter: parent.horizontalCenter
            width: 150
            height: 50
            color: "black"
            radius: AppConstants.popupRadius
            Text {
                id : playText
                text : qsTr(AppConstants.playText)
                color : "white"
                anchors.centerIn: parent
                font {
                    pixelSize: 16
                }
            }
            MouseArea {
                id : playButtonMouseArea
                anchors.fill : parent
                onClicked: {
                    stackView.push("PuzzlePage.qml")
                }

            }
        }
        Text {
            id : editedtext
            text : qsTr(AppConstants.editedText)
            anchors.horizontalCenter: parent.horizontalCenter
        }

    }
}

