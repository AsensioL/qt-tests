//#include <QApplication>
//#include <QWidget>
//#include <QPushButton>
//#include <QDebug>
//
//int main(int argc, char *argv[]) {
//    QApplication app(argc, argv);
//
//    // Create a QWidget, which is a base class for all UI objects in Qt
//    QWidget window;
//
//    // Set window size.
//    window.resize(250, 150);
//
//    // Create a QPushButton in the center of the window
//    QPushButton *button = new QPushButton("Click me!", &window);
//    button->setGeometry(50, 50, 150, 50); // (x, y, width, height)
//
//    // Connect a slot to handle the button click
//    QObject::connect(button, &QPushButton::clicked, &app, [&](){
//        qDebug() << "Button clicked!";
//    });
//
//    // Set window title and show the window
//    window.setWindowTitle("Minimal Qt Example");
//    window.showFullScreen();
//
//    // Run the application's event loop
//    return app.exec();
//}


//#include <QGuiApplication>
//#include <QQmlApplicationEngine>
//#include <QQmlContext>
//#include <QQuickView>
//
//int main(int argc, char *argv[])
//{
//    QGuiApplication app(argc, argv);
//
//    QQuickView view;
//    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));
//    //view.setResizeMode(QQuickView::SizeRootObjectToView);
//    view.showFullScreen();
//    //view.show();
//
//    return app.exec();
//}


#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    /**
     * Different QML files available
     */
    //const QUrl url(QStringLiteral("qml/full_screen.qml"));
    const QUrl url(QStringLiteral("qml/animation.qml"));


    engine.load(url);

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}