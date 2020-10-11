/*
  Aplicación para mostrar en modo pantalla completa una cuenta regresiva de un evento de Twitch.
Este código fue creado por nextsigner el día 3/9/2020 en el directo de 
Twitch junto a TheGhost1304.
*/
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Window 2.0
import Qt.labs.settings 1.1

ApplicationWindow{
    id:app
    visible: true
    visibility: "Maximized"
    title: 'qtquick-webcam'
    color: 'black'
    minimumWidth: 500
    minimumHeight: 500
    //flags: Qt.FramelessWindowHint | Qt.Window
    property string moduleName: 'qtquick-webcam'
    property int fs: width*0.02
    onActiveChanged: {
        if(!active){
            t1.restart()
        }
    }
    Settings{
        id: apps
        fileName: app.moduleName+'.conf'
        property int cameraRotation: 0
        property int cameraX: 0
        property int cameraY: 0
        property int cameraWidth: Screen.width
        property int cameraHeight: Screen.height
    }
    Timer{
        id: t1
        running: false
        repeat: false
        interval: 3000
        onTriggered: {
            app.requestActivate()//ApplicationWindow.Maximized
            app.raise()
            console.log('Activando...')
        }
    }
    Item{
        id: xApp
        anchors.fill: parent
        XCamera{
            id: xCamera
            x: apps.cameraX
            y: apps.cameraY
            width: apps.cameraWidth
            height: apps.cameraHeight
            rotation: apps.cameraRotation
            onXChanged: apps.cameraX=x
            onYChanged: apps.cameraY=y
            onWidthChanged: {
                //if(width<100)width=100;height=100
            }
            MouseArea{
                anchors.fill: parent
                drag.target: parent
                drag.axis: Drag.XAndYAxis
                cursorShape: Qt.BlankCursor
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onDoubleClicked: {
                    if (mouse.modifiers & Qt.ControlModifier){
                        center()
                    }
                }
                onClicked: {
                    if (mouse.modifiers & Qt.ControlModifier){
                        return
                    }

                    if(mouse.button & Qt.LeftButton) {
                        zoom(1)
                    }
                    if(mouse.button & Qt.RightButton) {
                        zoom(0)
                    }
                }
            }
        }
        XMarco1{id: xMarco1}
        EmisorCircular{
            id: emisorCircular
            width: parent.height-app.fs*2
            height: width
            anchors.centerIn: parent
        }
        XGuide{id: xGuide; visible:false}
    }
    Shortcut{
        sequence: 'F1'
        onActivated: xGuide.visible=!xGuide.visible
    }
    Shortcut{
        sequence: 'F2'
        onActivated: apps.cameraRotation+=90
    }
    Shortcut{
        sequence: 'F3'
        onActivated: zoom(0)
    }
    Shortcut{
        sequence: 'F4'
        onActivated: zoom(1)
    }
    Shortcut{
        sequence: 'Ctrl+r'
        onActivated: apps.cameraRotation+=90
    }
    Shortcut{
        sequence: 'Ctrl+c'
        onActivated: center()
    }
    Shortcut{
        sequence: 'Ctrl+-'
        onActivated: zoom(0)
    }
    Shortcut{
        sequence: 'Ctrl++'
        onActivated: zoom(1)
    }
    Shortcut{
        sequence: 'Down'
        onActivated: apps.cameraY+=app.fs
    }
    Shortcut{
        sequence: 'Up'
        onActivated: apps.cameraY-=app.fs
    }
    Shortcut{
        sequence: 'Left'
        onActivated: apps.cameraX-=app.fs
    }
    Shortcut{
        sequence: 'Right'
        onActivated: apps.cameraX+=app.fs
    }
    Shortcut{
        sequence: 'Esc'
        onActivated: {
            if(xGuide.visible){
                xGuide.visible=false
                return
            }
            Qt.quit()
        }
    }
    function center(){
        apps.cameraX=xApp.width/2-xCamera.width/2
        apps.cameraY=xApp.height/2-xCamera.height/2
    }
    function zoom(to){
//        if(xCamera.width<100&&to===0){
//            return
//        }
//        if(xCamera.width>10000000&&to===1){
//            return
//        }
        if(to===0){
            //if(apps.cameraWidth>100){
            apps.cameraWidth-=xCamera.width*0.1
            //apps.cameraHeight-=xCamera.height*0.1
            //xCamera.width=apps.cameraWidth
            //xCamera.height=apps.cameraHeight
            //}
            //return
        }
        if(to===1){
            //if(apps.cameraWidth<1000000){
                apps.cameraWidth+=xCamera.width*0.1
                //apps.cameraHeight+=xCamera.height*0.1
            //}
            //return
        }
        center()
    }
}
