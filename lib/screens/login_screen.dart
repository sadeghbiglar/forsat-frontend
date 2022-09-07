import 'dart:io';
import 'package:flutter/material.dart';
import 'package:forsat/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:device_info_plus/device_info_plus.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController  _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String? _deviceName;
  @override
  void initState() {
    
    _emailController.text='sb@gm.com';
    _passwordController.text='password';
     getDeviceName();
    super.initState();
  }
  void getDeviceName()async{
  try{
   if(Platform.isAndroid){
     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
     _deviceName=androidInfo.model;
   }else if(Platform.isIOS){
     IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
     _deviceName=iosInfo.utsname.machine;
   }
  }catch(e){
    print(e);
  }
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            TextFormField(
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some email';
                }
                return null;
              },
            ),
             TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some password';
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            FlatButton(
              color: Colors.blue,
              child: Text('login'),
              onPressed: (){
                 Map creds = {
                    'email': _emailController.text,
                    'password': _passwordController.text,
                    'device_name': _deviceName ?? 'unknown',
                  };
                   if (_formkey.currentState!.validate()){
                   // print(creds);
                    Provider.of<Auth>(context, listen: false)
                        .login(creds);
                    Navigator.pop(context);
                  }
              },
            )
          ]),
        ),
      ),
    );
  }
}
