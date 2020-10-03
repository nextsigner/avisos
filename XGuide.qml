import QtQuick 2.0

Rectangle {
    id: r
    anchors.fill: parent
    color: app.color
    property string info: '<b>Text is empty!</b>'
    Flickable{
        width: r.width-app.fs*2
        height: r.height
        anchors.horizontalCenter:  r.horizontalCenter
        Text{
            id: textInfo
            text: r.info
            color: 'white'
            font.pixelSize: app.fs
            width: parent.width
            wrapMode: Text.WordWrap
            textFormat: Text.RichText
        }
    }
    Component.onCompleted: {
        r.info=''
                +'<h1>Instrucciones</h1>'
                +'<ul>'
                +'  <li>F1: Ver/Ocultar Ayuda</li>'
                +'  <li>F2 o Crtl+r: Rotar Cámara</li>'
                +'  <li>F3 o Crtl+-: Bajar Zoom</li>'
                +'  <li>F4 oCrtl++: Subir Zoom</li>'
                +'  <li>Crtl+c: Centrar Cámara</li>'
                +'  <li>Esc: Cerrar aplicación</li>'
                +'</ul>'
                +'<br />'
                +'<h2>Sobre Unik QtQuick WebCam</h2>'
                +'<p>Esta aplicación fue creada por @nextsigner el 3 de Octubre de 2020 con el editor de código QtCreator 5.5.1 en Ubuntu Mate 16.04 bajo las licencias GPL, LGPL y LGPL2.</p>'
                +'<p>Esta aplicación es un módulo QtQuick para Unik Qml Engine. Unik fué creado por @nextsigner con el framework Qt Open Source 5.12.3 en Ubuntu Mate 16.04 bajo las licencias GPL, LGPL y LGPL2.</p>'
                +'<p>Para más información sobre Qt diríjase a la página de internet htts://qt.io/</p>'
                +'<br />'
                +'<br />'
                +'<h3>@nextsigner - Octubre 2020</h3>'
    }
}
