import QtQuick 2.0
import Felgo 3.0
import VPlayPlugins 1.0

Item {

    id: dataModel

    signal loggedIn
    signal loggedOut

    property var  shoppingItems: ({})

    readonly property string dbKeyAllShoppingItems: "grocery-list-user"

    FirebaseConfig{

         id: firebaseConfig
         projectId: "grocery-list-9e5ed"
         databaseUrl: "https://grocery-list-9e5ed.firebase.io"

         apiKey: Qt.platform.os === "android"
         ? "AIzaSyCachesdNNpJO91cMlys2fpwu0dCeujLF4"
         : "";

         applicationId:  Qt.platform.os === "android"
         ? "1:478505786453:android:d0fa78c95f0fa6747008dc"
         : "";
        }

    FirebaseAuth{

        id: firebaseAuth
        config: firebaseConfig

        onLoggedIn: {
            (!success) NativeUtils.displayMessageBox(qsTr("Login Failed"), qsTr("Reason: %1").arg(message), 1)
        }
        onUserRegistered: {
            (!success) NativeUtils.displayMessageBox(qsTr("Register Failed"), qsTr("Reason: %1").arg(message), 1)
        }
        onAuthenticatedChanged: if(authenticated) dataModel.loggedIn()
    }

    function registerUser(email, password){
        firebaseAuth.registerUser(email, password)
    }

    function loginUser(email, password){
        firebaseAuth.loginUser(email, password)
        
    function logOut(email, password){
        firebaseAuth.logOutUser()
    }

    FirebaseDatabase{
        id: firebaseDatabase
        config: firebaseConfig

        realtimeUserValueKeys: [dbKeyAllShoppingItems]
        onnRealtimeUserValueChanged: if (key===dbKeyAllShoppingItems) shoppingItemsItemsLoaded(value)
        onFirebaseReady: console.log("db ready");
        onWriteCompleted: console.log("write completed");

    }


    function shoppingItemsItemsLoaded(value) {
        dataModel.shoppingItems = value || {}
        console.log(JSON.stringify(dataModel.shoppingItems));
        
    }

}
