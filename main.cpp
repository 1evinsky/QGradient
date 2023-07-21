#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "uilogic.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    UILogic ui;

    QQmlApplicationEngine engine;
    engine.addImportPath(":/garno.com/import");
    const QUrl url(u"qrc:/Controls/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.rootContext()->setContextProperty("UILogic", &ui);

    engine.load(url);

    return app.exec();
}
