import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Effects

ShellRoot {
  Variants {
    model: Quickshell.screens
    delegate: Component{
      PanelWindow {
        required property var modelData
        screen: modelData
        focusable: false
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
          id: topBar
          exclusionMode: ExclusionMode.Auto
          height: 30
          width: screen.width
          focusable: false
          color: white
          anchors {
            top: true
            left: true
            right: true
          }
        }
        PanelWindow {
          id: rootPanel
          exclusionMode: ExclusionMode.Ignore
          implicitHeight: screen.height 
          implicitWidth: screen.width 
          color: "transparent"
          focusable: false
          anchors {
            top: true
            bottom: true
            left: true
            right: true
          }
          Rectangle {
            anchors.fill: parent
            color: "red"
            layer.enabled: true
            layer.effect: MultiEffect {
              maskSource: mask 
              maskEnabled: true 
              maskInverted: true
              maskThresholdMin: 0.5
              maskSpreadAtMin:1

            }
            Item {
              id: mask

              anchors.fill: parent
              layer.enabled: true
              visible: false

              Rectangle {
                id: maskInner
                anchors {
                  fill: parent 
                  margins: screen.height*0.01
                  
                  topMargin: screen.height*0.03

                }
                radius: 20
                color: "blue"
              }
            }

          }
        }
      }
    }
  }
}
  
