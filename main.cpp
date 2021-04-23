#include <iostream>
#include <QApplication>
#include <QQmlApplicationEngine>

int main(int argc, char* argv[]) {
    std::cout << "Foo" << std::endl;

    QApplication app(argc, argv);
    QQmlApplicationEngine engine;

    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    return app.exec();
}