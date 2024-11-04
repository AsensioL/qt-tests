#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "GraphicsInfo.hpp"

void printObjectTree(QObject *object, int level = 0)
{
    if (!object)
        return;

    QString indent(level * 4, ' '); // Indentation based on tree level
    QString objectName = object->objectName();

    // Print the objectName if it's set
    if (!objectName.isEmpty()) {
        qDebug().noquote() << indent << objectName;
    } else {
        // Print the class name if objectName is not set
        qDebug().noquote() << indent << object->metaObject()->className();
    }

    // Recursively print the children
    const QObjectList &children = object->children();
    for (QObject *child : children) {
        printObjectTree(child, level + 1);
    }
}


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QQuickWindow::setTextRenderType(QQuickWindow::NativeTextRendering);


    /**
     * Different QML files available
     */
    //const QUrl url(QStringLiteral("qml/full_screen.qml"));
    //const QUrl url(QStringLiteral("qml/animation.qml"));
    //const QUrl url(QStringLiteral("qml/media_player.qml"));
    //const QUrl url(QStringLiteral("qml/font_colors.qml"));
    //const QUrl url(QStringLiteral("qml/locate_object.qml"));
    //const QUrl url(QStringLiteral("qml/media_player_transforms.qml"));
    const QUrl url(QStringLiteral("qml/clipping_and_zoom_demo.qml"));
    //const QUrl url(QStringLiteral("qml/pinch_area_demo.qml"));


    engine.load(url);

    if (engine.rootObjects().isEmpty())
        return -1;


    // Get the root window
    QObject *rootObject = engine.rootObjects().first();
    QQuickWindow *window = qobject_cast<QQuickWindow *>(rootObject);
    if (!window) {
        qWarning("Root object is not a QQuickWindow");
        return -1;
    }

    // Expose the GraphicsInfo object to QML
    GraphicsInfo graphicsInfo(window);
    engine.rootContext()->setContextProperty("graphicsInfo", &graphicsInfo);


    // // Print QML Object Tree
    // qDebug() << "QML Object Tree:";
    // printObjectTree(rootObject);


    //QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
    //    &app, []() { QCoreApplication::exit(-1); }, Qt::QueuedConnection);

    return app.exec();
}