import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Thumbnailer 0.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "thumbnailer.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    automaticOrientation: false

    width: units.gu(60)
    height: units.gu(85)

    function encode_utf8(s) {
      return unescape(encodeURIComponent(s));
    }

    function decode_utf8(s) {
      return decodeURIComponent(escape(s));
    }

    Page {
        title: i18n.tr("thumbnailer")

        Image {
//            source: "image://thumbnailer/"+Qt.resolvedUrl("images/image2.jpg")
//            source: "image://thumbnailer/"+Qt.resolvedUrl("videos/sample.mp4")
//            source: "image://albumart/album=Blur:+The+Best+Of&artist=Blur"
//            source: "image://artistart/"+"album=Real+Gone&artist=Tom+Waits"
            source: "image://artistart/"+encode_utf8("album=传奇&artist=王菲")
            width:parent.width/2
            height:parent.height/2
            fillMode:Image.PreserveAspectFit
            sourceSize:Qt.size(width, height)
            anchors.centerIn: parent
        }
    }
}

