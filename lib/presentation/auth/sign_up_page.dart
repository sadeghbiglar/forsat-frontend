import 'package:flutter/material.dart';
import 'package:forsat/application/models/sign_up_form_model.dart';
import 'package:forsat/router/route_constants.dart';
import 'package:forsat/values/images.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _signUpFormModel = SignUpFormModel();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   brightness: Brightness.light,
      //   automaticallyImplyLeading: false,
      // ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Container(
                  height: 100,
                  child: Center(
                    child: Image.asset(Images.logo),
                  ),
                ),
                 TextFormField(
                  validator: (value) {
                    if (!_signUpFormModel.validatefirstName(value!)) {
                      return 'Please enter valid firstName';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.near_me),
                    hintText: "Enter your firstName",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                buildSizedBox(15),
                 TextFormField(
                  validator: (value) {
                    if (!_signUpFormModel.validatelastName(value!)) {
                      return 'Please enter valid lastName';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.near_me_sharp),
                    hintText: "Enter your lastName",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                buildSizedBox(15),
                TextFormField(
                  validator: (value) {
                    if (!_signUpFormModel.validateEmail(value!)) {
                      return 'Please enter valid email';
                    }
                    return null;
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
                    if (!_signUpFormModel.validatePassword(value!)) {
                      return 'Please enter valid password';
                    }
                    return null;
                  },
                  controller: _pass,
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
                TextFormField(
                  
                  validator: (value) {
                    if(_confirmPass.text.isEmpty){
                      return 'Please enter passwordConfirmation';
                      
                    }
                    else if (_confirmPass.text!=_pass.text) {
                      return 'Please enter valid passwordConfirmation';
                    }
                    return null;
                  },
                 controller: _confirmPass,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.compare),
                    hintText: "Enter your passwordConfirmation",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                buildSizedBox(25),
                MaterialButton(
                  child: Center(
                    child: Text(
                      "ثبت نام",
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
                      Navigator.pushNamed(context, homeRoute);
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
                      child: Text(" ورود",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                      onPressed: () {
                        Navigator.pushNamed(context, signInRoute);
                      },
                    ),
                    Text(
                      "حساب کاربری دارید؟",
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
