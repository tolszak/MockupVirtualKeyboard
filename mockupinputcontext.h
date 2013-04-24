#ifndef MOCKUPINPUTCONTEXT_H
#define MOCKUPINPUTCONTEXT_H
#include <QRectF>
#include <qpa/qplatforminputcontext.h>

class MockupInputContextPrivate;
class MockupInputContext : public QPlatformInputContext
{
    Q_OBJECT
public:
    MockupInputContext();
    ~MockupInputContext();
    //retur true if plugin is enabled
    bool isValid() const;

    //this value will be available in QGuiApplication::inputMethod()->keyboardRectangle()
    QRectF keyboardRect() const;


    //show and hide invoked by Qt when editor gets focus
    void showInputPanel();
    void hideInputPanel();
    //this value will be available in QGuiApplication::inputMethod()->isVisible()
    bool isInputPanelVisible() const;

    //editor pointer
    void setFocusObject(QObject *object);

private:
    MockupInputContextPrivate *d;
};

#endif // MOCKUPINPUTCONTEXT_H
