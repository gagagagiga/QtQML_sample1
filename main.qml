import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

//import UriAAA 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Column {
        spacing: 10
        Row {
            spacing: 10

            Label {
                id: label1
                text: aaa.count
                color: "red"
                font.pixelSize: 24
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                background: Rectangle{
                    color: "black"
                }

                width: 100
                height: 40
            }

            Label {
                id: label2
                text: "N/A"
                color: "lightgreen"
                font.pixelSize: 24
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                background: Rectangle{
                    color: "black"
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

            Button {
                text:"test1"
                onClicked: {
                    label1.text = "test" // 會解除綁定
                    label2.text = "test"
                }
            }
            Button {
                text:"test2"
                onClicked: {
                    // 並不會重新綁定
                    label1.text = aaa.count
                    label2.text = aaa.count
                }

            }
        }

        ScrollView {
            background: Rectangle{
                color: "lightcyan"
            }
            height: 300
            width: 300

            ListView {
                id: listView
                model: ListModel {
                    id: listModel
                }
                clip: true
                spacing: 10

                delegate: RowLayout {
                    Item {
                        Layout.preferredWidth: 50
                    }

                    Label {
                        text: model.number
                        Layout.preferredWidth: 50
                    }

                    Label {
                        text: model.text
                        Layout.preferredWidth: 100
                    }
                }

                function createItems(n) {
                    listModel.clear()

                    for(var i =0; i<n; i++) {
                        listModel.append({ number: i+1, text: "text "+i })
                    }
                }
            }
        }
    }

    Connections {
        target: aaa

        // Qt 5.15.x, 6.x
        //function onCountValueChanged(value) {
        //    label2.text = value
        //}

        // Qt 5.12.x
        onCountValueChanged: {
            label2.text = value
            listView.createItems(aaa.count)
        }
    }
}
