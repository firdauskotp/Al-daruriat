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

  String choice;
  String quantity;
  String price;

  @override
  initState() {

    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val){
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      RadioListTile(
                        value:1,
                        groupValue: selectedRadioTile,
                        selected: true,
                        title: Text("Face Mask"),
                        onChanged: (val){
                          setSelectedRadioTile(val);
                          choice = val;
                        },
                        activeColor: Colors.cyan,
                      ),
                      RadioListTile(
                        value:2,
                        groupValue: selectedRadioTile,
                        title: Text("Hand Sanitizer"),
                        onChanged: (val){
                          choice = val;
                          setSelectedRadioTile(val);
                        },
                        activeColor: Colors.cyan,
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
                          textCapitalization: TextCapitalization.sentences,
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
                                    "Item": choice,
                                    "Quantity": quantity,
                                    "Price": price,
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