#ifndef MOCKUPKEYEVENTDISPATCHER_H
#define MOCKUPKEYEVENTDISPATCHER_H

#include <QObject>

class MockupKeyEventDispatcher : public QObject
{
    Q_OBJECT
public:
    explicit MockupKeyEventDispatcher(QObject *parent = 0);
    
signals:
    
public slots:
    void setFocusItem(QObject *focusItem);
    void sendKeyToFocusItem(const QString &keyText);
private:
    QObject * m_focusItem;
};

#endif // MOCKUPKEYEVENTDISPATCHER_H
