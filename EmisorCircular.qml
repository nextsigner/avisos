import QtQuick 2.0
import QtQuick.Particles 2.0

Rectangle {
    id: root
    width: parent.width//*1.25
    height: parent.height
    color: 'transparent'
    ParticleSystem {
        id: particles
        anchors.fill: parent
        ImageParticle {
            id: ip
            groups: ["center"]
            anchors.fill: parent
            source: "./p1.png"
            colorVariation: 0.1
            color: "#009999FF"
        }
        ImageParticle {
            id: ip2
            groups: ["edge", "edge3"]
            anchors.fill: parent
            source: "./p2.png"
            colorVariation: 0.5
            color: "#0000FFFF"
        }

        Emitter {
            anchors.fill: parent
            group: "center"
            emitRate: 10000
            lifeSpan: 250
            size: 20
            sizeVariation: 10
            endSize: 0
            //! [0]
            shape: EllipseShape{fill: false}
            velocity: TargetDirection {
                targetX: root.width/2
                targetY: root.height/2
                proportionalMagnitude: true
                magnitude: 0.6
            }
            //! [0]
        }

        Emitter {
            anchors.fill: parent
            group: "edge2"
            startTime: 1000
            emitRate: 10000
            lifeSpan: 200
            size: 12
            sizeVariation: 2
            endSize: 0
            shape: EllipseShape{fill: false}
            velocity: TargetDirection {
                targetX: root.width/2
                targetY: root.height/2
                proportionalMagnitude: true
                magnitude: 0.8
                magnitudeVariation: 0.5
            }
            acceleration: TargetDirection {
                targetX: root.width/2
                targetY: root.height/2
                targetVariation: 500
                proportionalMagnitude: true
                magnitude: 0.6
                magnitudeVariation: 0.6
            }
        }
        Emitter {
            anchors.fill: parent
            group: "edge3"
            startTime: 1000
            emitRate: 10000
            lifeSpan: 100
            size: 30
            sizeVariation: 2
            endSize: 0
            shape: EllipseShape{fill: false}
            velocity: TargetDirection {
                targetX: root.width/2
                targetY: root.height/2
                proportionalMagnitude: true
                magnitude: 0.8
                magnitudeVariation: 0.5
            }
            acceleration: TargetDirection {
                targetX: root.width/2
                targetY: root.height/2
                targetVariation: 500
                proportionalMagnitude: true
                magnitude: 0.6
                magnitudeVariation: 0.6
            }
        }

    }
}
