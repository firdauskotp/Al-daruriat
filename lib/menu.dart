import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:streamingservice/ui/widgets/route.dart';

class MenuPage extends StatefulWidget {
//  LoginPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
          title: Text("Login"),
        ),*/
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
                            child: Text('Have an account? LOGIN HERE',
                              style: TextStyle(
                                color: Colors.white,
                              ),),
                            color: Colors.grey,
                            onPressed: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  )
                              );
                            },
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical:12.0),
                        child: MaterialButton(
                          minWidth: 1000,
                          child: Text('Create an account? REGISTER HERE',
                            style: TextStyle(
                              color: Colors.white,
                            ),),
                          color: Colors.grey,
                          onPressed: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                )
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical:12.0),
                        child: MaterialButton(
                          minWidth: 1000,
                          child: Text('Wish to donate? DONATE HERE',
                            style: TextStyle(
                              color: Colors.white,
                            ),),
                          color: Colors.grey,
                          onPressed: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MyDonationPage(),
                                )
                            );
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