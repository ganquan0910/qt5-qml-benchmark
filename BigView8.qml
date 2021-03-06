// Copyright (C) 2014 Leslie Zhai <xiang.zhai@i-soft.com.cn>

import QtQuick 2.3

Item {
    width: parent.width; height: parent.height

    Image {
        source: "images/8.jpg"
        anchors.fill: parent
    }

    Image {
        source: "images/back.png"
        width: 80; height: 80

        MouseArea {
            anchors.fill: parent
            onClicked: stackView.pop()
        }
    }
}
