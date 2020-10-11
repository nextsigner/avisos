import QtQuick 2.0
import QtQuick 2.12
import QtGraphicalEffects 1.12

Item {
    id: r
    anchors.fill: parent
    Rectangle{
        id: bg
        width: parent.width*2
        height: parent.height
        color: 'black'
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false
        Emisor{
            anchors.centerIn: parent
        }
    }
    Rectangle{
        id: circ
        width: xApp.width
        height: xApp.height
        color: 'transparent'
        visible: false
        Rectangle{
            id: circ2
            width: xApp.height-app.fs*2
            height: width
            anchors.centerIn: parent
            radius: width*0.5
            color: 'blue'
        }
    }
    OpacityMask {
        width: parent.width
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        source: bg
        maskSource: circ
        invert: true

    }

}
