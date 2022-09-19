import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:forsat/presentation/Opportunities/opportunities_page.dart';
import 'package:forsat/presentation/home/home_page.dart';
import 'package:forsat/router/route_constants.dart';
import 'package:forsat/screens/drawer.dart';
import 'package:forsat/screens/login_screen.dart';
import 'package:forsat/services/auth.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    readToken();
  }

  void readToken() async {
    String? token = await storage.read(key: 'token');
    Provider.of<Auth>(context, listen: false).tryToken(token: token);
    print(token);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('اتوماسیون اداری مرکز بهداشت ابهر'),
        ),
        
        body: Center(child: Consumer<Auth>(builder: (context, auth, child) {
          if(auth.authenticated){
            return  Text('خوش آمدید'+auth.user.name);
                      
          }
         
          return   Text('لطفا وارد حساب کاربری خود شوید'); 
          }
        
        )
        ),
        drawer:ddrawer(),
      
        );
  }
}
