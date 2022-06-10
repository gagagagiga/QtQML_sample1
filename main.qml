import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
//import UriAAA 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    Row {
        spacing: 10

        Label {
            text: aaa.count
            color: "red"
            font.pixelSize: 24
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            background: Rectangle{
                color: "darkgrey"
            }

            width: 100
            height: 40
        }

        Button {
            text:"+1"
            onClicked: aaa.count++;
        }

        Button {
            text: "+10"
            onClicked: aaa.add10();
        }

        Button {
            text:"reset"
            onClicked: aaa.resetCount();
        }
    }
}
