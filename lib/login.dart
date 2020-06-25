import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:streamingservice/ui/widgets/route.dart';

class LoginPage extends StatefulWidget {
//  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  String subs;

  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty){
      return "* Email is required";
    } else if (!regex.hasMatch(value)) {
      return '* Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.isEmpty){
      return "* Password is required";
    } else if (value.length < 8) {
      return '* Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  bool _isHid = true;
  void _toggleVisibility(){
    setState(() {
      _isHid = !_isHid;
    });
  }

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
                    image: ExactAssetImage("libAssets/images/login_wallpaper.jpg"),
                    fit: BoxFit.cover
                )
            ),

            child: SingleChildScrollView(
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                          height:80.0
                      ),
                      CircleAvatar(
                        //                backgroundColor: Colors.lightGreenAccent,
                        child: Image.asset("libAssets/images/placeholder.jpg"),
                        radius:50.0,
                      ),
                      SizedBox(
                          height:80.0
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:6.0),
                        child:TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email *',
                            hintText: "testing@gmail.com",
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
                          controller: emailInputController,
                          keyboardType: TextInputType.emailAddress,
                          validator: emailValidator,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:6.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Password *',
                            fillColor: Colors.white,
                            filled: true,
                            //                    errorText: "* Please enter a valid user name",
                            labelStyle:
                            TextStyle(color: Colors.black, letterSpacing: 1.3),
                            suffixIcon: IconButton(
                              onPressed: _toggleVisibility,
                              icon: _isHid ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          controller: pwdInputController,
                          obscureText: _isHid,
                          validator: pwdValidator,
                        ),
                      ),
                      ButtonTheme (
                        minWidth: 1200.0,
                        height: 40.0,
                        child: RaisedButton(
                          child: Text("Login"),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            if (!_loginFormKey.currentState.validate()){
                              return;
                            } else {

                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                  email: emailInputController.text,
                                  password: pwdInputController.text)
                                  .then((authResult) =>
                                  Firestore.instance
                                      .collection("users")
                                      .document(authResult.user.uid)
                                      .get()
)
                                  .catchError((err) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Error Occured!"),
                                        content: Text("Either the email or password input was wrong!"),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text("Close"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    });
                              });
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