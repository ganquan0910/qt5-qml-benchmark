// Copyright (C) 2014 Leslie Zhai <xiang.zhai@i-soft.com.cn>

import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Window 2.1
import cn.com.isoft.tutorial 1.0

ApplicationWindow {
    id: rootWindow
    width: 300; height: 200

    Process {
        id: processObj
        program: "uname"
        arguments: ['-a']
        Component.onCompleted: {
            processObj.start()
        }
        onReadyReadStandardOutput: {
            console.log("output:")
            console.log(processObj.readAllStandardOutput())
        }
    }
}
