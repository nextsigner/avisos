/*
  Aplicación para mostrar en modo pantalla completa una cuenta regresiva de un evento de Twitch.
Este código fue creado por nextsigner el día 3/9/2020 en el directo de Twitch junto a TheGhost1304.
*/
import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow{
    id:app
    visible: true
    visibility: "FullScreen"
    property date me
    property int h: 0
    property int m: 0
    property int s: 0
    FontLoader { id: webFont; name: "Pozofour";source: "./Pozofour.ttf" }
    Text{
        id: texto
        font.family: webFont.namead
        text: '<b>Aviso</b>'
        font.pixelSize: 30
        width: 800
        wrapMode: Text.WordWrap
        anchors.centerIn: parent
    }
    Item{
        anchors.fill: parent
        Text{
            id: cuentaAtras
            color: texto.color
            font.pixelSize: 30
            wrapMode: Text.WordWrap
            anchors.right: parent.right
            anchors.rightMargin: font.pixelSize*0.5
            anchors.top: parent.top
            anchors.topMargin: font.pixelSize*0.5
        }
    }
    Timer{
        id: timerContador
        running: false
        repeat: true
        interval: 1000
        onTriggered: {
            let ahora=new Date(Date.now())
            let hora=ahora.getHours()
            let minuto=ahora.getMinutes()
            let segundo=ahora.getSeconds()

            let horaME=app.me.getHours()
            let minutoME=app.me.getMinutes()
            let segundoME=app.me.getSeconds()

            let faltanMin=minuto-minutoME
            let faltanSeg=segundo-segundoME
            if(app.s>0){
                app.s--
            }else{
                app.s=59
                if(app.m>0){
                    app.m--
                }else{
                    app.m=59
                    app.h--
                }
            }
            if(app.h===0&&app.m===0&&app.s===0){
                texto.text='Comenzamos YA!'
                timerContador.stop()
            }

            let hours=app.h
            let minutes=app.m
            let seconds=app.s

            hours = (hours < 10) ? "0" + hours : hours;
            minutes = (minutes < 10) ? "0" + minutes : minutes;
            seconds = (seconds < 10) ? "0" + seconds : seconds;
            cuentaAtras.text=''+hours+':'+minutes+':'+seconds
        }
    }
    Shortcut{
        sequence: 'Esc'
        onActivated: Qt.quit()
    }
    Component.objectName: {
        console.log('Aplicacion iniciada!')
        if(Qt.application.arguments.length<3)return
        let dato=Qt.application.arguments[2]
        texto.text=dato
        if(Qt.application.arguments.length<4)return
        let colorFondo=Qt.application.arguments[3]
        app.color=colorFondo
        if(Qt.application.arguments.length<5)return
        let colorTexto=Qt.application.arguments[4]
        texto.color=colorTexto
        if(Qt.application.arguments.length<6)return
        let fonts=Qt.application.arguments[5]
        texto.font.pixelSize=fonts
        cuentaAtras.font.pixelSize=fonts
        if(Qt.application.arguments.length<7)return
        let parHora=(''+Qt.application.arguments[6]).split(':')//10:30
        let d=new Date(Date.now())
        let horaDeComienzo=new Date(d.getFullYear(),d.getMonth(), d.getDate(), parseInt(parHora[0]), parseInt(parHora[1]))
        app.me=horaDeComienzo
        //console.log('')
        let ahora=new Date(Date.now())
        let duration=app.me.getTime()-ahora.getTime()
        var milliseconds = parseInt((duration % 1000) / 100);
        let seconds = Math.floor((duration / 1000) % 60);
        let minutes = Math.floor((duration / (1000 * 60)) % 60);
        let hours = Math.floor((duration / (1000 * 60 * 60)) % 24);

        app.h=hours
        app.m=minutes
        app.s=seconds
        timerContador.start()
        //cuentaAtras.text=horaDeComienzo.toString()
    }
}
