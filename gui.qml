import QtQuick
import QtQuick.Window
import QtQuick.Shapes

Window {
    visible: true
    width: 640
    height: 480
    title: "Circle with Inner Circle and 5 Equal Outer Circles"

    Item {
        width: 200
        height: 200
        anchors.centerIn: parent

        // Outer circle divided into 5 parts
        Shape {
            anchors.fill: parent
            ShapePath {
                strokeWidth: 2
                strokeColor: "black"
                fillColor: "transparent"
                startX: 100; startY: 0
                PathAngleArc {
                    centerX: 100; centerY: 100
                    radiusX: 100; radiusY: 100
                    startAngle: -90
                    sweepAngle: 360
                }
            }
        }

        // Division lines
        Repeater {
            model: 5
            Shape {
                anchors.fill: parent
                ShapePath {
                    strokeWidth: 2
                    strokeColor: "black"
                    fillColor: "transparent"
                    startX: 100; startY: 100
                    PathLine { 
                        x: 100 + 100 * Math.cos((index * 72 - 90) * Math.PI / 180)
                        y: 100 + 100 * Math.sin((index * 72 - 90) * Math.PI / 180)
                    }
                }
            }
        }

        // Inner circle
        Shape {
            anchors.fill: parent
            ShapePath {
                strokeWidth: 2
                strokeColor: "black"
                fillColor: "white"
                startX: 100; startY: 50
                PathAngleArc {
                    centerX: 100; centerY: 100
                    radiusX: 50; radiusY: 50
                    startAngle: -90
                    sweepAngle: 360
                }
            }
        }

        // Text "Cancel" in the center
        Text {
            anchors.centerIn: parent
            text: "Cancel"
            font.pixelSize: 12
            color: "black"
        }
    }
}