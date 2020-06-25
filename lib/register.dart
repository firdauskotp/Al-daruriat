import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/painting.dart';
//import 'package:streamingservice/ui/widgets/route.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController usernameInputController;
  TextEditingController firstNameInputController;
  TextEditingController lastNameInputController;
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;
  TextEditingController clubInputController;

  @override
  initState() {
    usernameInputController = new TextEditingController();
    firstNameInputController = new TextEditingController();
    lastNameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
    clubInputController = new TextEditingController();
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

  String confirmPwdValidator(String value) {
    if (value.isEmpty){
      return "* Password is required";
    } else if (value != pwdInputController) {
      return '* Password must match';
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
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage("libAssets/images/field.jpg"),
                    fit: BoxFit.cover
                )
            ),
            child: SingleChildScrollView(
                child: Form(
                  key: _registerFormKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:6.0),
                        child:TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Username (>= 3 LETTERS) *',
                            hintText: "FootballFan97",
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
                          controller: usernameInputController,
                          validator: (value) {
                            if (value.isEmpty){
                              return "* Please enter a valid username";
                            } else if (value.length < 3) {
                              return "* Username must be more than 3 letters";
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:6.0),
                        child: TextFormField(
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            labelText: 'First Name *',
                            hintText: "John",
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
                          controller: firstNameInputController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "* Please enter a valid first name.";
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:6.0),
                        child: TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              labelText: 'Last Name *',
                              hintText: "Doe",
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
                            controller: lastNameInputController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "* Please enter a valid last name.";
                              }
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:6.0),
                        child:TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email *',
                            hintText: "john.doe@gmail.com",
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
                            labelText: 'Password (>= 8 LETTERS) *',
                            hintText: "********",
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
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:6.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Confirm Password *',
                            hintText: "********",
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
                          controller: confirmPwdInputController,
                          obscureText: _isHid,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:6.0),
                        child:TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Club *',
                            hintText: "Everton",
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
                          controller: clubInputController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "* Please enter a club name";
                            }
                          },
                        ),
                      ),

                      ButtonTheme (
                        minWidth: 120.0,
                        height: 40.0,
                        child: RaisedButton(
                          child: Text("Register"),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            if (_registerFormKey.currentState.validate()) {
                              if (pwdInputController.text ==
                                  confirmPwdInputController.text) {
                                String subscription = "free";
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                    email: emailInputController.text,
                                    password: pwdInputController.text)
                                    .then((currentUser) => Firestore.instance
                                    .collection("users")
                                    .document(currentUser.user.uid)
                                    .setData({
                                  "uid" : currentUser.user.uid,
                                  "username" : usernameInputController.text,
                                  "firstname" : firstNameInputController.text,
                                  "lastname" : lastNameInputController.text,
                                  "email" : emailInputController.text,
                                  "club" : clubInputController.text,
                                  "subscription" : subscription,
                                })
                                    .then((result) => {
                                  usernameInputController.clear(),
                                  firstNameInputController.clear(),
                                  lastNameInputController.clear(),
                                  emailInputController.clear(),
                                  pwdInputController.clear(),
                                  confirmPwdInputController.clear(),
                                  clubInputController.clear(),

                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Success!"),
                                          content: Text("Account has been registered, continue to log in :D"),
                                          actions: <Widget>[
//                                            FlatButton(
//                                              child: Text("Close"),
//                                              onPressed: () {
//                                                Navigator.pushReplacementNamed(
//                                                    context, loginPageRoute);
//                                              },
//                                            )
                                          ],
                                        );
                                      })

                                }))
                                    .catchError((err) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Oh no! Something Happened!"),
                                          content: Text("Seems like the email was registered!"),
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
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Error"),
                                        content: Text("The passwords do not match"),
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
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(
                          height:30.0
                      ),
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                          height:10.0
                      ),
                      ButtonTheme (
                        minWidth: 120.0,
                        height: 40.0,
                        child:RaisedButton(
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            "Login Here",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),

//                          onPressed: () {
//                            Navigator.pushNamed(context, loginPageRoute);
//                          },
                        ),
                      )
                    ],
                  ),
                ))));
  }
}