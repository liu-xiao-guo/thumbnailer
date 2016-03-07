TEMPLATE = app
TARGET = thumbnailer

load(ubuntu-click)

QT += qml quick

SOURCES += main.cpp

RESOURCES += thumbnailer.qrc

QML_FILES += $$files(*.qml,true) \
             $$files(*.js,true)

CONF_FILES +=  thumbnailer.apparmor \
               thumbnailer.png

AP_TEST_FILES += tests/autopilot/run \
                 $$files(tests/*.py,true)

QML_IMAGES += $$files(*.jpg,true)
QML_VIDEOS += $$files(*.mp4,true)

#show all the files in QtCreator
OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES} \
               $${QML_IMAGES} \
               $${AP_TEST_FILES} \
               thumbnailer.desktop

#specify where the config files are installed to
config_files.path = /thumbnailer
config_files.files += $${CONF_FILES}
INSTALLS+=config_files

#install the desktop file, a translated version is 
#automatically created in the build directory
desktop_file.path = /thumbnailer
desktop_file.files = $$OUT_PWD/thumbnailer.desktop
desktop_file.CONFIG += no_check_exist
INSTALLS+=desktop_file

#specify where the qml/js files are installed to
qml_files.path = /thumbnailer
qml_files.files += $${QML_FILES}

image_files.path = /thumbnailer/images
image_files.files += $${QML_IMAGES}

video_files.path = /thumbnailer/images
video_files.files += $${QML_VIDEOS}

# Default rules for deployment.
target.path = $${UBUNTU_CLICK_BINARY_PATH}
INSTALLS+=target qml_files image_files video_files

