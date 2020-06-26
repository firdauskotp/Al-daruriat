import 'package:al_daruriat/main.dart';
import 'package:flutter/material.dart';
import 'package:al_daruriat/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:streamingservice/ui/widgets/route.dart';

class SellPageSuccess extends StatefulWidget {
//  LoginPage({Key key}) : super(key: key);
  final String title = "SUCCESS";

  @override
  _SellPageSuccess createState() => _SellPageSuccess();
}

class _SellPageSuccess extends State<SellPageSuccess>{
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
              image: ExactAssetImage("images/donation_wallpaper.png"),
              fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                "YOUR PRODUCT IS TO BE SOLD IS SUCCESSFULLY STORED IN THE DATABASE",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.orange,
                  backgroundColor: Colors.grey,
                  fontFamily: "ShadowsIntoLight",
                ),
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