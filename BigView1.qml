// Copyright (C) 2014 Leslie Zhai <xiang.zhai@i-soft.com.cn>

import QtQuick 2.3

Item {
    width: parent.width; height: parent.height

    Image {
        source: "images/1.jpg"
        anchors.fill: parent
    }

    Image {
        source: "images/forward.png"
        width: 80; height: 80
        anchors.right: parent.right

        MouseArea {
            anchors.fill: parent
            onClicked: {
                stackView.push({item: Qt.resolvedUrl("BigView2.qml")})
            }
        }
    } 
}
