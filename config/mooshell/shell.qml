import QtQuick
import QuickShell

ShellRoot {
  Window {
    id: bar
    anchorPosition: BarAnchor.Top
    width: Screen.width
    height: 36
    color: "#1e1e2e"

    borderWidth: 0

    background: Rectangle {
      anchors.fill: parent
      radius: 8
      layers.enabled: true
    }

    paddingLeft: 16
    paddingRight: 16
    paddingTop: 4
    paddingBottom: 4

    Row {
      anchors.top: parent.top
      anchors.left: parent.left 
      spacing: 20

      Text { text: "10:30 AM"; color: "#cba6f7"; font.bold: true }
      Item { width: 1; height: 15; backgroundColor: "#89b4fa"}
    }

    Row {
      anchors.top: parent.top 
      anchors.right: parent.right 
      spacing: 20 

      Text { text: "CPU"; color: "#a6adc8" }
      Text { text: "45C"; color: "#fab387"; font.bold: true }
    }
  }
}
