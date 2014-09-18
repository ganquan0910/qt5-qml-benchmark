// Copyright (C) 2014 Leslie Zhai <xiang.zhai@i-soft.com.cn>

import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

Canvas {
    id: canvas
    width: Screen.width; height: Screen.height

    property bool requestLine: false
    property bool requestBlank: false
    property real hue: 0
    property real lastX: width * Math.random()
    property real lastY: height * Math.random()

    function line(context) {
        context.save();
        context.translate(canvas.width / 2, canvas.height / 2);
        context.scale(0.9, 0.9);
        context.translate(-canvas.width / 2, -canvas.height / 2);
        context.beginPath();
        context.lineWidth = 5 + Math.random() * 10;
        context.moveTo(lastX, lastY);
        lastX = canvas.width * Math.random();
        lastY = canvas.height * Math.random();
        context.bezierCurveTo(canvas.width * Math.random(), 
                              canvas.height * Math.random(), 
                              canvas.width * Math.random(), 
                              canvas.height * Math.random(), 
                              lastX, 
                              lastY);
        hue += Math.random() * 0.1
        if (hue > 1.0) {
            hue -= 1
        }
        context.strokeStyle = Qt.hsla(hue, 0.5, 0.5, 1.0);
        context.shadowColor = 'white';
        // FIXME: it will kill your SLOW CPU 
        // context.shadowBlur = 10;
        context.stroke();
        context.restore();
    }

    function blank(context) {
        context.fillStyle = Qt.rgba(0, 0, 0, 0.1)
        context.fillRect(0, 0, canvas.width, canvas.height);
    }

    onPaint: {
        var context = getContext('2d')
        if (requestLine) {
            line(context)
            requestLine = false
        }
        if (requestBlank) {
            blank(context)
            requestBlank = false
        }
    }

    Timer {
        id: lineTimer
        interval: 40
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            canvas.requestLine = true
            canvas.requestBlank = true
            canvas.requestPaint()
        }
    }

    Component.onCompleted: {
        lineTimer.start()
    }
}
