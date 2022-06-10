#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>

#include "classaaa.h"

int main(int argc, char *argv[])
{
    // --------------------------------------------------------------
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    // --------------------------------------------------------------


    ClassAAA aaa;


    // --------------------------------------------------------------
    QGuiApplication app(argc, argv);
    // --------------------------------------------------------------


//    qmlRegisterUncreatableType<ClassAAA>("UriAAA", 1, 0, "QmlNameAAA",
//        QString("ClassAAA should not be created in QML"));


    // --------------------------------------------------------------
    QQmlApplicationEngine engine;
    // --------------------------------------------------------------


    engine.rootContext()->setContextProperty("aaa", &aaa);


    // --------------------------------------------------------------
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
    // --------------------------------------------------------------

}
