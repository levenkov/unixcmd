#include <iostream>
#include <QFont>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char* argv[]) {
    QFont font( "Arial" );
    QGuiApplication::setFont( font );

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    return app.exec();
}