import 'package:flutter/material.dart';
import 'package:forsat/application/models/sign_in_form_model.dart';
import 'package:forsat/router/route_constants.dart';
import 'package:forsat/services/globals.dart';
import 'package:forsat/values/images.dart';
import 'package:http/http.dart' as http;
import 'package:forsat/services/auth_services.dart';
import 'dart:convert';
//import 'package:states_rebuilder/states_rebuilder.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  
  final _formKey = GlobalKey<FormState>();
  final _signInFormModel = SignInFormModel();
  
  String _email = '';
  String _password = '';
  String _statusCode='';
  loginPressed() async {
    http.Response response = await AuthServices.login(_email, _password);
    Map responseMap = jsonDecode(response.body);
     _statusCode=response.statusCode.toString();
  }
 proccesLogin(){
   loginPressed();
   if(_statusCode=='200'){
     _statusCode='';
     Navigator.pushNamed(context, homeRoute);
     
   }
   else{
     _statusCode='';
     errorSnackBar( context,'نام کاربری یا رمز عبور اشتباه است');
     
   }
 }
@override
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Container(
                  height: 250,
                  child: Center(
                    child: Image.asset(Images.logo),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (!_signInFormModel.validateEmail(value!)) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _email = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Enter your email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                buildSizedBox(15),
                TextFormField(
                  validator: (value) {
                    if (!_signInFormModel.validatePassword(value!)) {
                      return 'Please enter valid password';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _password = value;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                buildSizedBox(25),
                MaterialButton(
                  child: Center(
                    child: Text(
                      "ورود",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Processing Data')),
                      // );
                    proccesLogin();
                    }
                  },
                  height: 55,
                  shape: StadiumBorder(),
                  color: Theme.of(context).primaryColor,
                ),
                buildSizedBox(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      child: Text("ثبت نام",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                      onPressed: () {
                        Navigator.pushNamed(context, signUpRoute);
                      },
                    ),
                    Text(
                      "حساب کاربری ندارید؟",
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }

  SizedBox buildSizedBox(double height) => SizedBox(height: height);
}
