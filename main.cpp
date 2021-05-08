#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtPlugin>
#include <QtGlobal>

Q_IMPORT_PLUGIN(QtQmlPlugin)
Q_IMPORT_PLUGIN(QtQmlModelsPlugin)
Q_IMPORT_PLUGIN(QtQmlWorkerScriptPlugin)
Q_IMPORT_PLUGIN(QtQuick2Plugin)
Q_IMPORT_PLUGIN(QtQuickControls2Plugin)
Q_IMPORT_PLUGIN(QtQuickLayoutsPlugin)
Q_IMPORT_PLUGIN(QtQuickTemplates2Plugin)
Q_IMPORT_PLUGIN(QtQuick2WindowPlugin)
Q_IMPORT_PLUGIN(QIOSIntegrationPlugin)

//extern "C" int qtmn(int argc, char **argv) {
int main(int argc, char* argv[]) {
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;

    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    return app.exec();
}
