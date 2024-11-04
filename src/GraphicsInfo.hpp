#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>
#include <QQuickWindow>
#include <QSGRendererInterface>


class GraphicsInfo : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString graphicsApi READ graphicsApi CONSTANT)
    Q_PROPERTY(QString platformName READ platformName CONSTANT)
public:
    explicit GraphicsInfo(QQuickWindow *window, QObject *parent = nullptr)
        : QObject(parent), m_window(window) {}

    QString graphicsApi() const {
        if (!m_window)
            return QStringLiteral("Unknown");

        QSGRendererInterface *interface = m_window->rendererInterface();
        QSGRendererInterface::GraphicsApi api = interface->graphicsApi();

        switch (api) {
            case QSGRendererInterface::Software:   return QStringLiteral("Software Rasterization");
            case QSGRendererInterface::OpenGL:     return QStringLiteral("OpenGL");
            case QSGRendererInterface::Direct3D11: return QStringLiteral("Direct3D 11");
            case QSGRendererInterface::Vulkan:     return QStringLiteral("Vulkan");
            case QSGRendererInterface::Metal:      return QStringLiteral("Metal");
            //case QSGRendererInterface::OpenGLRhi:  return QStringLiteral("OpenGL via RHI");
            case QSGRendererInterface::Direct3D12: return QStringLiteral("Direct3D 12");
            case QSGRendererInterface::Null:       return QStringLiteral("Null");
            default:                               return QStringLiteral("Unknown");
        }
    }

    QString platformName() const {
        // Retrieve the current QPA plugin backend in use
        QString platform = QGuiApplication::platformName();
        return platform;
    }

private:
    QQuickWindow *m_window;
};
