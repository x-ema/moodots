import Quickshell
import Quickshell.Widgets
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick

ShellRoot {
  id: root

  PanelWindow {
    focusable: true
    WlrLayershell.layer: WlrLayer.Bottom
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
    color: "transparent"

    anchors {
      top: true
      left: true
      right: true
      bottom: true
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
        left: true 
        right: true 
        bottom: true
      }

      PanelWindow {
        implicitHeight: 42
        implicitWidth: 0

        anchors{
          top: true
        }
        color: "transparent"
        mask: rootPanel.mask
      }

      mask: Region {
        Region {
          item: topBar
        }
      }

    }
  }
}
