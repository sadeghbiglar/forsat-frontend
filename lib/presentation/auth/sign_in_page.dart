import 'package:flutter/material.dart';
import 'package:forsat/values/images.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
            padding: EdgeInsets.all(16),
            child: ListView(children: <Widget>[
              Container(
                height: 250,
                child: Center(child: Image.asset(Images.logo)),
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
             buildSizedBox(20),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
               buildSizedBox(20),
              MaterialButton(
                onPressed: () {},
                height: 55,
                shape: StadiumBorder(),
                color: Theme.of(context).primaryColor,
                child: Center(
                    child: Text(
                  "ورود",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )),
              ),
              buildSizedBox(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                      onPressed: () {},
                      child: Text(
                        "ثبت نام",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )),
                  Text("حساب کاربری ندارید؟"),
                ],
              )
            ])));
  }

  SizedBox buildSizedBox(double height) {
    return SizedBox(
              height: height,
            );
  }
}
