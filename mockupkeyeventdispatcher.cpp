#include "mockupkeyeventdispatcher.h"
#include <QInputMethodEvent>
#include <QCoreApplication>
MockupKeyEventDispatcher::MockupKeyEventDispatcher(QObject *parent) :
    QObject(parent),m_focusItem(0)
{

}

void MockupKeyEventDispatcher::setFocusItem(QObject *focusItem)
{
    m_focusItem = focusItem;
}

void MockupKeyEventDispatcher::sendKeyToFocusItem(const QString &keyText)
{
    if (!m_focusItem) {
        return;
    }
    QInputMethodEvent ev;
    if (keyText == QString("\x7F")) {
        //delete one char
        ev.setCommitString("",-1,1);

    } else {
        //add some text
        ev.setCommitString(keyText);
    }
    QCoreApplication::sendEvent(m_focusItem,&ev);
}
