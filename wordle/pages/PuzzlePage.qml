import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../constants"
import "../components"
Page {
    id : puzzlePage
    property string word : AppConstants.wordList[Math.ceil(Math.random() * AppConstants.wordList.length-1)]
    property bool isRowFull : false
    property string  currentRowLetters : ""
    property var cellList : []

    Column {
        anchors.verticalCenter: parent.verticalCenter
        anchors.topMargin: AppConstants.wordListViewMargin
        anchors.bottomMargin: AppConstants.wordListViewMargin
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter
        spacing : AppConstants.letterBoxSpacing
        ListView {
            id : listView
            width : AppConstants.wordListViewSize
            height : AppConstants.wordListViewSize
            spacing : AppConstants.letterBoxSpacing
            anchors.horizontalCenter: parent.horizontalCenter
            model: 6
            delegate: Row {
                spacing: AppConstants.letterBoxSpacing
                Repeater {
                    model: 5
                    LetterBox{
                        id : letterBox
                    }
                }
            }
            clip: true
            interactive: false
        }

        Column {
            width: parent.width
            height: AppConstants.keyboardHeight
            spacing : AppConstants.keyboardSpacing
            Row {
                spacing: AppConstants.keyboardSpacing
                anchors.horizontalCenter: parent.horizontalCenter
                Repeater {
                    model: ["Q","W","E","R","T","Y","U","I","O","P"]
                    KeyboardButton{
                        id : keyboardButton1
                        onButtonClicked: {
                            if (isRowFull){
                                return;
                            }
                            placedLetterInBox(modelData)
                        }
                    }
                }
            }
            Row {
                spacing: AppConstants.keyboardSpacing
                anchors.horizontalCenter: parent.horizontalCenter
                Repeater {
                    model: ["A","S","D","F","G","H","J","K","L"]
                    KeyboardButton{
                        id : keyboardButton2
                        onButtonClicked: {
                            if (isRowFull){
                                return;
                            }
                            placedLetterInBox(modelData)
                        }
                    }
                }
            }
            Row {
                spacing:  AppConstants.keyboardSpacing
                anchors.horizontalCenter: parent.horizontalCenter
                Repeater {
                    model: ["ENTER","Z","X","C","V","B","N","M","BACK"]
                    KeyboardButton{
                        id : keyboardButton3
                        onButtonClicked: checkSpecialLetter(modelData)
                    }
                }
            }
        }
    }

    Keys.onPressed: {
        if (isRowFull) {
            return; // Key presses disabled for the current row
        }
        var letter = String.fromCharCode(event.text.charCodeAt(0)).toUpperCase();
        if (/^[a-zA-Z]+$/.test(letter)) {
            placedLetterInBox(letter)
        } else {
            event.accepted = false;
        }
    }

    function placedLetterInBox(letter){
        if (letter === "ENTER"){
            finalResultPopup.message = AppConstants.noEnoughLetter
            finalResultPopup.open()
            return;
        }
        for (var i = 0; i < listView.model; i++) {
            for (var j = 0; j < 5; j++) {
                var cell = listView.itemAtIndex(i).children[j];
                if (cell.cellText === "") {
                    if (letter === "BACK"){
                        if (j !== 0){
                            currentRowLetters = currentRowLetters.substring(0, currentRowLetters.length -1)
                            var previousCell = listView.itemAtIndex(i).children[j-1];
                            previousCell.cellText = ""
                            cellList.pop()
                        }else if (currentRowLetters.length === 5 && j === 0) {
                            currentRowLetters = currentRowLetters.substring(0, currentRowLetters.length -1)
                            var previousRowCell = listView.itemAtIndex(i-1).children[4];
                            previousRowCell.cellText = ""
                            cellList.pop()
                        }
                        return;
                    }
                    else{
                        cell.cellText = letter;
                        cellList.push(cell);
                        currentRowLetters += letter;
                        if (currentRowLetters.length === 5) {
                            isRowFull = true;
                        }
                        return;
                    }
                }
            }
        }
    }

    function openLetterBox(){
        if (!AppConstants.wordList.includes(currentRowLetters)){
            finalResultPopup.message = AppConstants.noWord
            finalResultPopup.open()
            return;
        }

        for (let i = 0; i < currentRowLetters.length; i++){
            if (currentRowLetters.charAt(i) === word.charAt(i)){
                cellList[i].color = AppConstants.correctSpotColor
                cellList[i].cellTextColor = AppConstants.openLetterColor
            }
            else if (word.search(currentRowLetters.charAt(i)) !== -1){
                cellList[i].color = AppConstants.anySpotColor;
                cellList[i].cellTextColor = AppConstants.openLetterColor
            }
            else {
                cellList[i].color = AppConstants.wrongSpotColor
                cellList[i].cellTextColor = AppConstants.openLetterColor
            }
        }
        if (currentRowLetters === word) {
            return true;
        }else if (listView.itemAtIndex(5).children[4].cellText !== ""){
            finalResultPopup.message = AppConstants.wrongLastMessage
            finalResultPopup.open()
            stackView.pop(null)
        }
        else {
            currentRowLetters = ""
            isRowFull = false
            cellList = []
            return false;
        }
    }

    function checkSpecialLetter(modelData){
        if (isRowFull && modelData === "ENTER"){
            if (openLetterBox()){
                finalResultPopup.message = AppConstants.successMessage
                finalResultPopup.open()
                stackView.pop(null)
            }
        }else if (isRowFull && modelData === "BACK"){
            isRowFull = false
            placedLetterInBox(modelData)
        }else if (isRowFull){
            return;
        }
        else{
            placedLetterInBox(modelData)
        }
    }

    FinalResultPopup {
        id : finalResultPopup
        height : parent.height * 0.4
        width : parent.width * 0.4
        anchors.centerIn: parent
        modal: true
    }
}
