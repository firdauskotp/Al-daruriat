import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';
class MyDonationPage extends StatefulWidget {
  final String title = "DONATION";

  @override
  _MyDonationPageState createState() => _MyDonationPageState();
}

class _MyDonationPageState extends State<MyDonationPage>{
  _launchURL() async {
    const url = 'https://www.cimbclicks.com.my/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context){
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
               "Do you wish to donate? This button will redirect you to CIMBCLICKS. The account number is"
                   " 2-66016-0002347-5 (RHB Bank) and put the recepient info as Sumbangan Perubatan KKM",
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
                    "DONATE HERE",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: _launchURL,
                ),
              ),
              ButtonTheme (
                minWidth: 1400.0,
                height: 40.0,
                child:MaterialButton(
                  color: Colors.cyan,
                  child: Text(
                    "BACK",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: (){
                    Navigator.pop(context);
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
