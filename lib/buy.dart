import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:streamingservice/ui/widgets/route.dart';
import 'package:al_daruriat/menu.dart';
class BuyPage extends StatefulWidget {
//  LoginPage({Key key}) : super(key: key);
  final String title = "VIEW";

  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage>{
  final firestoreInstance = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
//
//  Widget _buildListItem(BuildContext context, DocumentSnapshot document){
//    return ListTile(
//      title: Row(
//        children: [
//          Expanded(
//            child: Text(
//              document['Item'] ,
////              style: Theme.of(context).textTheme.headline1,
//            ),
//          ),
//        ],
//      ),
//    );
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage("images/loginwallpaper.PNG"),
              fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                "YOU HAVE TO GO TO THE ADDRESS SPECIFIED AND PICK UP THE ITEM. PLEASE CALL THE OWNER OF THE ITEM YOU WISH TO BUY",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.orange,
                  backgroundColor: Colors.grey,
                  fontFamily: "ShadowsIntoLight",
                ),
              ),
              StreamBuilder(
                stream: Firestore.instance.collection('Products').snapshots(),
                builder: (context, snapshot){
                  if (!snapshot.hasData) return const Text("NO ITEMS FOR SALE");
                  return Column(
                    children: <Widget>[
                      Text(
                        "Item : " + snapshot.data.documents[0] ["Item"],
                        style: new TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Price : " +snapshot.data.documents[0] ["Price"],
                        style: new TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Quantity : " +snapshot.data.documents[0] ["Quantity"],
                        style: new TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Seller's first name : " +snapshot.data.documents[0] ["Seller_First_Name"],
                        style: new TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Seller's last name : " +snapshot.data.documents[0] ["Seller_Last_Name"],
                        style: new TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Address : " +snapshot.data.documents[0] ["Seller_Address"],
                        style: new TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Phone No : " +snapshot.data.documents[0] ["HP_No"],
                        style: new TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                },
              ),
              ButtonTheme (
                minWidth: 1400.0,
                height: 40.0,
                child:MaterialButton(
                  color: Colors.cyan,
                  child: Text(
                    "RETURN TO MAIN MENU",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MenuPage(),
                        )
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}