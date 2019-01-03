TEMPLATE = lib
TARGET = libwebwx
QT += qml quick
CONFIG += plugin c++11

TARGET = $$qtLibraryTarget($$TARGET)
uri = cn.deaglepc.wx

# Input
SOURCES += \
        libwebwx_plugin.cpp \
        libwebwx.cpp \
    cwebwxwork.cpp \
    cwebwxcontact.cpp \
    cutils.cpp \
    cwebwxmessage.cpp

HEADERS += \
        libwebwx_plugin.h \
        libwebwx.h \
    cwebwxwork.h \
    config.h \
    cwebwxcontact.h \
    cutils.h \
    cwebwxmessage.h

DISTFILES = qmldir

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

qmldir.files = qmldir
unix {
    installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)
    qmldir.path = $$installPath
    target.path = $$installPath
    INSTALLS += target qmldir
}

include(network/network.pri)
