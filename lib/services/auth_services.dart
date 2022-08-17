import 'package:http/http.dart' as http;
import 'package:forsat/services/globals.dart';
import 'dart:convert';
class AuthServices{
   ///

  static Future<http.Response> login(String email,String password)
  async{
    Map data={

      'email':email,
      'password':password
    };
    var body=json.encode(data);
    var url=Uri.parse(baseUrl+'auth/login');
    http.Response response= await http.post(
        url,
        headers: headers,
        body: body
    );
    print(response.body);
    return response;
  }
}