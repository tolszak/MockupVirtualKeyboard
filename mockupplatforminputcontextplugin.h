#ifndef MOCKUPPLATFORMINPUTCONTEXTPLUGIN_H
#define MOCKUPPLATFORMINPUTCONTEXTPLUGIN_H

#include "mockupvirtualkeyboard_global.h"
#include <qpa/qplatforminputcontextplugin_p.h>

class MOCKUPVIRTUALKEYBOARDSHARED_EXPORT MockupPlatformInputContextPlugin: public QPlatformInputContextPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QPlatformInputContextFactoryInterface" FILE "mockup.json")

public:
    QPlatformInputContext *create(const QString&, const QStringList&);
};


#endif // MOCKUPPLATFORMINPUTCONTEXTPLUGIN_H
