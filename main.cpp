#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "src/UILogic.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    UILogic ui;

    QQmlApplicationEngine engine;
    engine.addImportPath(":/garno.com/import");
    const QUrl url(u"qrc:/QGradient/ui/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.rootContext()->setContextProperty("UILogic", &ui);

    engine.load(url);

    return app.exec();
}
