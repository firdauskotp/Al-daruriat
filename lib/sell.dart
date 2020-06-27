import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:streamingservice/ui/widgets/route.dart';
import 'dart:math';
import 'package:al_daruriat/sellsuccess.dart';
class SellPage extends StatefulWidget {
//  LoginPage({Key key}) : super(key: key);
  final String title = "SELL";

  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage>{
  final GlobalKey<FormState> _sellFormKey = GlobalKey<FormState>();

  int selectedRadioTile;
  final firestoreInstance = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String quantity;
  String price;
  String fname = "";
  String lname = "";
  String address = "";
  String phone;
  String prod;

  userSync() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    Firestore.instance.collection("AD_users").document(user.uid).snapshots()
        .listen((DocumentSnapshot data) {
      setState(() {


        fname = data['firstname'];
        lname = data['lastname'];
        address = data['Address'];
      });
    }
    );
    return [fname, lname, address];
  }



  @override
  Widget build(BuildContext context) {
    userSync();
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage("images/sellwallpaper.PNG"),
                    fit: BoxFit.cover
                )
            ),
            child: SingleChildScrollView(
                child: Form(
                  key: _sellFormKey,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Welcome " + fname + " " + lname,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:6.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'What do you want to sell',
                            hintText: "FM for facemask, HS for sanitizer",
                            fillColor: Colors.white,
                            filled: true,
                            //                    errorText: "* Please enter a valid user name",
                            labelStyle:
                            TextStyle(color: Colors.black, letterSpacing: 1.3),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              prod = value;
                            });
                          },
                          validator: (String value){
                            if (value.isEmpty){
                              return '* Product is required';
                            }
                          },
                          onSaved: (String value){
                            quantity = value;
                            //                    _username = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:6.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Quantity',
                            hintText: "5",
                            fillColor: Colors.white,
                            filled: true,
                            //                    errorText: "* Please enter a valid user name",
                            labelStyle:
                            TextStyle(color: Colors.black, letterSpacing: 1.3),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              quantity = value;
                            });
                          },
                          validator: (String value){
                            if (value.isEmpty){
                              return '* Quantity is required';
                            }
                          },
                          onSaved: (String value){
                            quantity = value;
                            //                    _username = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:6.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Price *',
                            hintText: "4.50",
                            fillColor: Colors.white,
                            filled: true,
                            //                    errorText: "* Please enter a valid user name",
                            labelStyle:
                            TextStyle(color: Colors.black, letterSpacing: 1.3),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              price = value;
                            });
                          },
                          validator: (String value){
                            if (value.isEmpty){
                              return '* Price is required';
                            }
                          },
                          onSaved: (String value){
                            price = value;
                            //                    _username = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:6.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Phone Number *',
                            hintText: "012-2374030",
                            fillColor: Colors.white,
                            filled: true,
                            //                    errorText: "* Please enter a valid user name",
                            labelStyle:
                            TextStyle(color: Colors.black, letterSpacing: 1.3),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              phone = value;
                            });
                          },
                          validator: (String value){
                            if (value.isEmpty){
                              return '* Phone Number is required';
                            }
                          },
                          onSaved: (String value){
                            phone = value;
                            //                    _username = value;
                          },
                        ),
                      ),
                      ButtonTheme (
                        minWidth: 1200.0,
                        height: 40.0,
                        child: RaisedButton(
                          child: Text("SELL"),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            if (_sellFormKey.currentState.validate()) {
                              Random random = new Random();
                              int rng2 = random.nextInt(10000);
                              _sellFormKey.currentState.save();
                              Firestore.instance.collection("Products").document("Prod_ID_No$rng2").setData(
                                  {
                                    "Item": prod,
                                    "Quantity": quantity,
                                    "Price": price,
                                    "HP_No": phone,
                                    "Seller First Name": fname,
                                    "Seller Last Name": lname,
                                    "Seller Address": address,
                                  }

                              );
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SellPageSuccess(),
                                  )
                              );
                            } else {
                              return;
                            }
                          },
                        ),
                      ),

                    ],
                  ),
                )
            )
        )
    );
  }
}