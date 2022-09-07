import 'package:flutter/material.dart';
const String baseUrl="http://10.100.252.137:81/api/";  // localhost url
const Map<String,String> headers={"Content-Type":"application/json"};
errorSnackBar(BuildContext context,String text){
ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.redAccent,
    content: Text(text),
    duration: const Duration(seconds: 1),
    )

);
}