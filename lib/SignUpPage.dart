import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'LoginPage.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final formKey = new GlobalKey<FormState>();

  String _email;
  String _passWord;
  String _confirmPassword;

//  FormType _formType = FormType.login;

  bool  _validateAndSave(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      print("Form is validate, Email: $_email , Password: $_passWord");
      return true;
    }
    else{
      print("Form is not validate");
      return false;
    }
  }
  void _validateAndRegister() async{
    try {
      if (_validateAndSave() ) {
        FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _passWord);
        print("Registered user: ${user.uid}");
      }
    }catch(e){
      print("Exception Occured:: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowGlow();
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 150.0, left: 16.0, right: 16.0),
                  child: Card(
                    semanticContainer: true,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Text(
                            "Connect with",
                            style: TextStyle(
                                fontFamily: "WorkSansMedium",
                                fontSize: 16.0,
                                color: Colors.blueGrey),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 2.0, top: 16.0),
                              child: Material(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(30.0),
                                child: MaterialButton(
                                  onPressed: ()=>print("Google"),
                                  minWidth: 136.0,
                                  height: 45.0,
                                  child: Text(
                                    "Google",
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 2.0, top: 16.0),
                              child: Material(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(30.0),
                                child: MaterialButton(
                                  onPressed: ()=>print("Facebook"),
                                  minWidth: 136.0,
                                  height: 45.0,
                                  child: Text(
                                    "Facebook",
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  gradient: new LinearGradient(
                                      colors: [
                                        Colors.black12,
                                        Colors.black,
                                      ],
                                      begin: const FractionalOffset(0.0, 0.0),
                                      end: const FractionalOffset(1.0, 1.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.mirror),
                                ),
                                width: 100.0,
                                height: 1.0,
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(left: 15.0, right: 15.0),
                                child: Text(
                                  "OR",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontFamily: "WorkSansMedium"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: new LinearGradient(
                                      colors: [
                                        Colors.black,
                                        Colors.black12,
                                      ],
                                      begin: const FractionalOffset(0.0, 0.0),
                                      end: const FractionalOffset(1.0, 1.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                width: 100.0,
                                height: 1.0,
                              ),
                            ],
                          ),
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 6.0, left: 12.0, right: 12.0, bottom: 4.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value)=>value.isEmpty?'Username can\'t be empty':null,
                                  onSaved: (value)=> _email = value,
                                  decoration: InputDecoration(
                                    labelText: "UserName",
                                    prefixIcon: Icon(Icons.account_circle),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0)),
                                  ),
                                  controller: new TextEditingController(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 12.0, right: 12.0, bottom: 8.0),
                                child: TextFormField(
                                  obscureText: true,
                                  validator: (value)=>value.isEmpty?'Password can\'t be empty':null,
                                  onSaved: (value)=> _passWord = value,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: Icon(Icons.remove_red_eye),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0)),
                                  ),
                                  controller: new TextEditingController(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 12.0, right: 12.0, bottom: 8.0),
                                child: TextFormField(
                                  obscureText: true,
                                  validator: (value)=>value.isEmpty?' Confirm password can\'t be empty':null,
                                  onSaved: (value)=> _confirmPassword = value,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: "Confirm Password",
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: Icon(Icons.remove_red_eye),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0)),
                                  ),
                                  controller: new TextEditingController(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 8.0, right: 8.0,bottom: 14.0),
                                child: Material(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: MaterialButton(
                                    onPressed: () =>_validateAndRegister(),
                                    splashColor: Colors.amber,
                                    height: 30.0,
                                    minWidth: 310.0,
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.0),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FlatButton(
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>new LoginPage()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 75.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Have an account?",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "WorkSansMedium",
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            fontFamily: "WorkSansMedium",
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
