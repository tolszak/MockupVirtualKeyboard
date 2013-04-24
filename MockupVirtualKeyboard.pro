#-------------------------------------------------
#
# Project created by QtCreator 2013-04-04T23:11:38
#
#-------------------------------------------------

QT       += qml quick gui-private

CONFIG += plugin

TARGET = MockupVirtualKeyboard
TEMPLATE = lib

DEFINES += MOCKUPVIRTUALKEYBOARD_LIBRARY

SOURCES += mockupplatforminputcontextplugin.cpp \
    mockupinputcontext.cpp \
    mockupkeyeventdispatcher.cpp

HEADERS += mockupplatforminputcontextplugin.h\
        mockupvirtualkeyboard_global.h \
    mockupinputcontext.h \
    mockupkeyeventdispatcher.h

target.path = $$[QT_INSTALL_PLUGINS]/platforminputcontexts

INSTALLS += target

OTHER_FILES += \
    InputPanel.qml \
    KeyModel.qml \
    KeyButton.qml

RESOURCES += \
    mockupresources.qrc
