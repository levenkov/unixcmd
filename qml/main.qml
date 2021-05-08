import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15

ApplicationWindow
{
    visible: true
    title: "UnixCMD 111"
    width: 400
    height: 400

    //menuBar: MenuBar {
    //    Menu {
    //        title: qsTr("&File")
    //        Action { text: qsTr("&New...") }
    //        Action { text: qsTr("&Open...") }
    //        Action { text: qsTr("&Save") }
    //        Action { text: qsTr("Save &As...") }
    //        MenuSeparator { }
    //        Action { text: qsTr("&Quit") }
    //    }
    //    Menu {
    //        title: qsTr("&Edit")
    //        Action { text: qsTr("Cu&t") }
    //        Action { text: qsTr("&Copy") }
    //        Action { text: qsTr("&Paste") }
    //    }
    //    Menu {
    //        title: qsTr("&Help")
    //        Action { text: qsTr("&About") }
    //    }
    //}

    //header: ToolBar {
    //}

    //footer: ToolBar {
    //    RowLayout {
    //        anchors.fill: parent

    //        ToolButton {
    //            text: qsTr("‹")
    //        }

    //        Label {
    //            text: "Title"
    //            font.family: "Arial"
    //            font.pointSize: 13
    //            elide: Label.ElideRight
    //            horizontalAlignment: Qt.AlignHCenter
    //            verticalAlignment: Qt.AlignVCenter
    //            Layout.fillWidth: true
    //        }

    //        ToolButton {
    //            text: "⋮"
    //        }
    //    }
    //}

    //StackView {
    //    id: stack
    //    anchors.fill: parent

    //    Text {
    //        text: "Fancy font"
    //    }
    //}

    Label {
        anchors.centerIn: parent
        text: qsTr("Hello World!")
        font.pixelSize: 14
    }
}