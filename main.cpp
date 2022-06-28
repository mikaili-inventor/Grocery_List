#include <QApplication>
#include <FelgoApplication>

#include <QQmlApplicationEngine>

#include <FelgoLiveClient>

int main(int argc, char *argv[])
{

    QApplication app(argc, argv);

    FelgoApplication felgo;

    // Use platform-specific fonts instead of Felgo's default font
    felgo.setPreservePlatformFonts(true);

    QQmlApplicationEngine engine;
    felgo.initialize(&engine);

    felgo.setLicenseKey(PRODUCT_LICENSE_KEY);

    felgo.setMainQmlFileName(QStringLiteral("qml/Main.qml"));

    //felgo.setMainQmlFileName(QStringLiteral("qrc:/qml/Main.qml"));

    engine.load(QUrl(felgo.mainQmlFileName()));

    //FelgoLiveClient client (&engine);

    return app.exec();
}
