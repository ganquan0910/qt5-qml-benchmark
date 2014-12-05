// Copyright (C) 2014 Leslie Zhai <xiang.zhai@i-soft.com.cn>

#include <QApplication>
#include <QtQml>
#include <QtQuick/QQuickView>

#include "process.h"

int main(int argc, char* argv[]) 
{                                                                        
    QApplication app(argc, argv);

    qmlRegisterType<Process>("cn.com.isoft.tutorial", 1, 0, "Process");

    QQmlApplicationEngine engine(QUrl("qrc:/qml/main.qml")); 
    QObject* topLevel = engine.rootObjects().value(0);
    QQuickWindow* window = qobject_cast<QQuickWindow*>(topLevel); 
    if (!window) {
        qWarning("Error: Your root item has to be a Window.");
        return -1;
    }
    window->show();

    return app.exec();
}
