#include "mockupinputcontext.h"
#include <QDebug>
#include <QEvent>
#include <QQuickView>
#include <QGuiApplication>
#include "mockupkeyeventdispatcher.h"
#include <QQmlEngine>
#include <QQmlContext>

class MockupInputContextPrivate
{
public:
    MockupInputContextPrivate();
    ~MockupInputContextPrivate();
    QQuickView *view;
    MockupKeyEventDispatcher keyEventDispatcher;
};

MockupInputContextPrivate::MockupInputContextPrivate(): view(0)
{

}

MockupInputContextPrivate::~MockupInputContextPrivate()
{
    if (view) {
        delete view;
    }
}

MockupInputContext::MockupInputContext() :
    QPlatformInputContext(), d(new MockupInputContextPrivate)
{

}

MockupInputContext::~MockupInputContext()
{

}

bool MockupInputContext::isValid() const
{
    return true;
}

QRectF MockupInputContext::keyboardRect() const
{
    return (d->view)? d->view->geometry(): QRectF();
}

void MockupInputContext::showInputPanel()
{
    if (!d->view) {        
        d->view = new QQuickView();
        d->view->engine()->rootContext()->setContextProperty("keyEventDispatcher",&d->keyEventDispatcher);
        d->view->setSource(QUrl("qrc:/InputPanel.qml"));

        d->view->setResizeMode(QQuickView::SizeViewToRootObject);
        d->view->setClearBeforeRendering(true);

        d->view->setColor(Qt::transparent);
        QSurfaceFormat f(d->view->format());
        f.setAlphaBufferSize(8);
        d->view->setFormat(f);

        d->view->setFlags(d->view->flags() | Qt::FramelessWindowHint | Qt::WindowStaysOnTopHint	| Qt::WindowDoesNotAcceptFocus);
    }

    d->view->show();

    QPlatformInputContext::showInputPanel();
}

void MockupInputContext::hideInputPanel()
{
    if (d->view) {
        d->view->hide();
    }
    QPlatformInputContext::hideInputPanel();
}

bool MockupInputContext::isInputPanelVisible() const
{
    return (d->view)? d->view->isVisible():false;
}


void MockupInputContext::setFocusObject(QObject *object)
{
    d->keyEventDispatcher.setFocusItem(object);
}
