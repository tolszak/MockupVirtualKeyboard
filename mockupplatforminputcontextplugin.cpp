#include "mockupplatforminputcontextplugin.h"
#include "mockupinputcontext.h"


QPlatformInputContext *MockupPlatformInputContextPlugin::create(const QString& system, const QStringList& paramList)
{
    Q_UNUSED(paramList);

    if (system.compare(system, QStringLiteral("mockup"), Qt::CaseInsensitive) == 0)
        return new MockupInputContext;
    return 0;
}



