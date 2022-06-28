import Felgo 3.0
import QtQuick 2.0
import "pages"
import "helper"

App {
    licenseKey: "954A0A57D212D807F9DEE2863382F930E8C47314F2CFA204F43AB7550CBB6100B58CB3C5DC6FB96FE5AC8C3D9EC69CB9B49884857D07959A4FB9C3F9C2639DB3F88C4ECD5573B1F7CB00BA91823F2F4C3DC6886507E20389479A456AEA6871A5A5464A03C9E6862E82D6040363097A9CE706A1A8439E03938477291CAE6C9842F3A4840716BECD3B0F8E7FB01A4B28EF48330102F45B7BA58E9ED531BFD3EDFD4D3E7A3F4CB23A6E03EC098ABB99EDAF9C4CF1290D0A9C28D46D70C9B4A5C7E2BE23D0E3B04801FFE3236F7F0B8CB091D58903671B453D482DED63E2C10663EB14007F6976916DE83FDC5C71765DD58FB5EAA88A150E7F3DC9A9D19B36497F75621FD03E1195A0184E520559E94112760B5BF18E83E52AA30DEA38BA91508DD7B0AE67E1279F64A64C4AFF2316DC7A1D242A6F3A6E448071DAC572485BA45EAD"

    PluginMainItem {
        id: pluginMainItem
        z: 1           // display the plugin example above other items in the QML code below
        visible: false // set this to true to show the plugin example
        property alias firebasePage: firebasePage

        FirebasePage {
            id: firebasePage
            visible: false
            onPopped:  { firebasePage.parent = pluginMainItem; visible = false }
        }
    }

    NavigationStack {

        Page {
            title: qsTr("Main Page")

            Image {
                source: "../assets/felgo-logo.png"
                anchors.centerIn: parent
            }
        }

    }
}
