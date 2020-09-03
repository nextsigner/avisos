import QtQuick 2.0
import QtQuick.Particles 2.0

Rectangle {
    id: root
    width: parent.width*1.25
    height: width
    color: app.color
    Image {
        id: fondo1
        width: root.width*1.5
        height: width
        anchors.centerIn: root
        source: "./p1.png"
        SequentialAnimation{
            running: true
            loops: Animation.Infinite
            NumberAnimation{
                target: fondo1
                property: "rotation"
                from:0
                to:35
                duration: 20000
                easing.type: Easing.InOutCirc
            }
            NumberAnimation{
                target: fondo1
                property: "rotation"
                from:35
                to:-80
                duration: 8000
                easing.type: Easing.InOutCirc
            }
            NumberAnimation{
                target: fondo1
                property: "rotation"
                from:-80
                to:0
                duration: 9000
                easing.type: Easing.InOutCirc
            }
        }
    }
    Image {
        id: fondo2
        width: root.width*1.5
        height: width
        anchors.centerIn: root
        source: "./p2.png"
        SequentialAnimation{
            running: true
            loops: Animation.Infinite
            NumberAnimation{
                target: fondo2
                property: "rotation"
                from:0
                to:270
                duration: 18000
                easing.type: Easing.InOutCirc
            }
            NumberAnimation{
                target: fondo2
                property: "rotation"
                from:270
                to:-180
                duration: 8000
                easing.type: Easing.InOutCirc
            }
            NumberAnimation{
                target: fondo2
                property: "rotation"
                from:-180
                to:0
                duration: 12000
                easing.type: Easing.InOutCirc
            }
        }
    }

    ParticleSystem {
        id: particles
        anchors.fill: parent

          ImageParticle {
            id: ip
            groups: ["center","edge"]
            anchors.fill: parent
            //source: "qrc:///particleresources/glowdot.png"
            source: "./p1.png"
            colorVariation: 0.1
            color: "#009999FF"
        }
          ImageParticle {
            id: ip2
            groups: ["center","edge2"]
            anchors.fill: parent
            //source: "qrc:///particleresources/glowdot.png"
            source: "./p2.png"
            colorVariation: 0.1
            color: "#009999FF"
        }

        Emitter {
            anchors.fill: parent
            group: "center"
            emitRate: 400
            lifeSpan: 2000
            size: 20
            sizeVariation: 2
            endSize: 0
            //! [0]
            shape: EllipseShape {fill: false}
            velocity: TargetDirection {
                targetX: root.width/2
                targetY: root.height/2
                proportionalMagnitude: true
                magnitude: 0.5
            }
            //! [0]
        }

        Emitter {
            anchors.fill: parent
            group: "edge"
            startTime: 2000
            emitRate: 2000
            lifeSpan: 2000
            size: 28
            sizeVariation: 2
            endSize: 16
            shape: EllipseShape {fill: false}
            velocity: TargetDirection {
                targetX: root.width/2
                targetY: root.height/2
                proportionalMagnitude: true
                magnitude: 0.1
                magnitudeVariation: 0.1
            }
            acceleration: TargetDirection {
                targetX: root.width/2
                targetY: root.height/2
                targetVariation: 200
                proportionalMagnitude: true
                magnitude: 0.1
                magnitudeVariation: 0.1
            }
        }
        Emitter {
            anchors.fill: parent
            group: "edge2"
            startTime: 1000
            emitRate: 2000
            lifeSpan: 2000
            size: 32
            sizeVariation: 2
            endSize: 16
            shape: EllipseShape {fill: false}
            velocity: TargetDirection {
                targetX: root.width/2
                targetY: root.height/2
                proportionalMagnitude: true
                magnitude: 0.2
                magnitudeVariation: 0.2
            }
            acceleration: TargetDirection {
                targetX: root.width/2
                targetY: root.height/2
                targetVariation: 200
                proportionalMagnitude: true
                magnitude: 0.1
                magnitudeVariation: 0.1
            }
        }
    }
}


///****************************************************************************
//**
//** Copyright (C) 2017 The Qt Company Ltd.
//** Contact: https://www.qt.io/licensing/
//**
//** This file is part of the examples of the Qt Toolkit.
//**
//** $QT_BEGIN_LICENSE:BSD$
//** Commercial License Usage
//** Licensees holding valid commercial Qt licenses may use this file in
//** accordance with the commercial license agreement provided with the
//** Software or, alternatively, in accordance with the terms contained in
//** a written agreement between you and The Qt Company. For licensing terms
//** and conditions see https://www.qt.io/terms-conditions. For further
//** information use the contact form at https://www.qt.io/contact-us.
//**
//** BSD License Usage
//** Alternatively, you may use this file under the terms of the BSD license
//** as follows:
//**
//** "Redistribution and use in source and binary forms, with or without
//** modification, are permitted provided that the following conditions are
//** met:
//**   * Redistributions of source code must retain the above copyright
//**     notice, this list of conditions and the following disclaimer.
//**   * Redistributions in binary form must reproduce the above copyright
//**     notice, this list of conditions and the following disclaimer in
//**     the documentation and/or other materials provided with the
//**     distribution.
//**   * Neither the name of The Qt Company Ltd nor the names of its
//**     contributors may be used to endorse or promote products derived
//**     from this software without specific prior written permission.
//**
//**
//** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
//** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
//** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
//** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
//** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
//** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
//** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
//** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
//** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
//**
//** $QT_END_LICENSE$
//**
//****************************************************************************/

//import QtQuick 2.0
//import QtQuick.Particles 2.0

//Rectangle {
//    width: 320
//    height: 480
//    color: "black"
//    property bool lastWasPulse: false
//    Timer {
//        interval: 3500
//        triggeredOnStart: true
//        running: true
//        repeat: true
//        onTriggered: {
//        //! [0]
//            if (lastWasPulse) {
//                burstEmitter.burst(500);
//                lastWasPulse = false;
//            } else {
//                pulseEmitter.pulse(500);
//                lastWasPulse = true;
//            }
//        //! [0]
//        }
//    }
//    ParticleSystem {
//        id: particles
//        anchors.fill: parent
//        ImageParticle {
//            source: "./p1.png"
//            alpha: 0
//            colorVariation: 0.6
//        }

//        Emitter {
//            id: burstEmitter
//            x: parent.width/2
//            y: parent.height/3
//            emitRate: 1000
//            lifeSpan: 2000
//            enabled: false
//            velocity: AngleDirection{magnitude: 64; angleVariation: 360}
//            size: 24
//            sizeVariation: 8
//            Text {
//                anchors.centerIn: parent
//                color: "white"
//                font.pixelSize: 18
//                text: "Burst"
//            }
//        }
//        Emitter {
//            id: pulseEmitter
//            x: parent.width/2
//            y: 2*parent.height/3
//            emitRate: 1000
//            lifeSpan: 2000
//            enabled: false
//            velocity: AngleDirection{magnitude: 64; angleVariation: 360}
//            size: 24
//            sizeVariation: 8
//            Text {
//                anchors.centerIn: parent
//                color: "white"
//                font.pixelSize: 18
//                text: "Pulse"
//            }
//        }
//    }
//}
