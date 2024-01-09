pragma Singleton
import QtQuick 2.15

QtObject{

    property color backgroundColor : "#F1EFEF"
    property color cellBorderColor : "#7D7C7C"
    property color closeLetterColor : "black"
    property color openLetterColor :  "white"
    property color correctSpotColor : "#ACDB86"
    property color wrongSpotColor : "#7D7C7C"
    property color anySpotColor : "#E9B824"

    property int letterSize : 24
    property int wordleTextSize : 30
    property int letterBoxSize : 50
    property int  popupRadius : 20

    property int keyboardSpacing : 5
    property int letterBoxSpacing: 10
    property int wordListViewSize : 350
    property int wordListViewMargin : 30
    property int keyboardHeight : 160

    property string wordleText : "Wordle"
    property string playGameText : "Get 6 chances to guess a 5-letter word."
    property string playText : "Play"
    property string editedText : "Original game edited by Tracy Bennett\n Edited by Merve Malak"
    property string successMessage :  "Congratulations, you find the word"
    property string wrongLastMessage : "Unfortunately, you didn't know the word in six guesses."
    property string noWord : "Not in word List"
    property string noEnoughLetter : "No enough letters"

    property var wordList : ["ABOUT" , "ALERT" , "ARGUE", "BEACH",
    "BEGIN", "BELOW", "APPLY", "CHART", "ENTRY", "EQUAL", "GLASS"]

}
