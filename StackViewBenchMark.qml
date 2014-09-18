// Copyright (C) 2014 Leslie Zhai <xiang.zhai@i-soft.com.cn>

import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

Item {
    width: Screen.width; height: Screen.height

    StackView {
        id: stackView
        width: parent.width; height: parent.height
        anchors.fill: parent
        initialItem: BigView1 {}
    }    
}
