import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick

ShellRoot {
  Variants {
    model: Quickshell.screens
    delegate: Component{
      PanelWindow {
        required property var modelData
        screen: modelData
        focusable: true
        WlrLayershell.layer: WlrLayer.Bottom
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
        color: "transparent"
        anchors {
          top: true
          bottom: true
          left: true
          right: true
        }
        PanelWindow {
          id: rootPanel
          exclusionMode: exclusionMode.Ignore
          implicitHeight: screen.height 
          implicitWidth: screen.width 
          color: "transparent"
          focusable: true
          anchors {
            top: true
            bottom: true
            left: true
            right: true
          }
        }
        PanelWindow {
          id: testrect
          color: "transparent"
          focusable: false
          anchors {
            top: true
            bottom: true 
            left: true
            right: true
          }
          Rectangle {
            color: "transparent"
            border {
              color: "white"
              width: 20
            }
            radius: 20.0
            width: 500
            height: 200
            ClippingRectangle {
              color: "red"
              radius: 10
              width: 300
              height: 150
              anchors.centerIn: parent
            }
          }

        }
      }
    }
  }
}  
