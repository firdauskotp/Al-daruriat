import 'package:al_daruriat/donate.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/painting.dart';
//import 'package:streamingservice/ui/widgets/route.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
//      title: "Register",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Color(0xFF37474F),
          )),
      home: new MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget{
//  MyHomePage({Key key, this.title}) : super(key: key);
  final String title = "HOME PAGE";



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage("images/homewallpaper.jpg"),
                  fit: BoxFit.cover
              )
          ),

          child: SingleChildScrollView(

            child: Form(


              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,
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
//                                  builder: (context) => MyLoginPage()
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
//                                builder: (context) => MyRegisterPage()
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
            ),
          ),
        ),
      ),
//      ),
    );
  }
}
