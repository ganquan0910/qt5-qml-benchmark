QT_VERSION = $$[QT_VERSION]
QT_VERSION = $$split(QT_VERSION, ".")
QT_VER_MAJ = $$member(QT_VERSION, 0)
QT_VER_MIN = $$member(QT_VERSION, 1)

lessThan(QT_VER_MAJ, 5) | lessThan(QT_VER_MIN, 2) | {
	error(process is only tested under Qt 5.2!)
}

QT += qml quick
QMAKE_CXXFLAGS += -std=c++11 -Werror
!android: !ios: !blackberry: qtHaveModule(widgets): QT += widgets
TARGET = process
CODECFORSRC = UTF-8

include(src/src.pri)

OTHER_FILES += \
    qml/main.qml

RESOURCES += \
    resources.qrc

unix {
    #VARIABLES
    isEmpty(PREFIX) {
        PREFIX = /usr
    }
    BINDIR = $$PREFIX/bin
    DATADIR = $$PREFIX/share

    DEFINES += PREFIX=\\\"$$PREFIX\\\"
    DEFINES += TARGET=\\\"$$TARGET\\\"
    DEFINES += DATADIR=\\\"$$DATADIR\\\" PKGDATADIR=\\\"$$PKGDATADIR\\\"

    #MAKE INSTALL
    INSTALLS += target

    target.path = $$BINDIR
}
