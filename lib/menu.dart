import 'package:flutter/material.dart';
import 'package:al_daruriat/main.dart';
import 'package:al_daruriat/buy.dart';
import 'package:al_daruriat/sell.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:streamingservice/ui/widgets/route.dart';

class MenuPage extends StatefulWidget {
//  LoginPage({Key key}) : super(key: key);
  final String title = "MAIN MENU";

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;





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
                    image: ExactAssetImage("images/facemask.jpg"),
                    fit: BoxFit.cover
                )
            ),

            child: SingleChildScrollView(
                child: Form(

                  child: Column(
                    children: <Widget>[
                      SizedBox(
                          height:80.0
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical:16.0, horizontal: 16.0),
                        child: Divider(),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical:12.0),
                          child: MaterialButton(
                            minWidth: 1000,
                            child: Text('SELL',
                              style: TextStyle(
                                color: Colors.white,
                              ),),
                            color: Colors.grey,
                            onPressed: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SellPage(),
                                  )
                              );
                            },
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical:12.0),
                        child: MaterialButton(
                          minWidth: 1000,
                          child: Text('VIEW',
                            style: TextStyle(
                              color: Colors.white,
                            ),),
                          color: Colors.grey,
                          onPressed: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => BuyPage(),
                                )
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical:12.0),
                        child: MaterialButton(
                          minWidth: 1000,
                          child: Text('LOG OUT',
                            style: TextStyle(
                              color: Colors.white,
                            ),),
                          color: Colors.grey,
                          onPressed: () async{
                            await _auth.signOut().then((_){
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                  )
                              );
                            });
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