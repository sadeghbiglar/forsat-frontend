import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
        body: const Center(child: Text('خوش آمدید')),
        drawer: Drawer(child: Consumer<Auth>(builder: (context, auth, child) {
          if (!auth.authenticated) {
            return ListView(
              children: [
                ListTile(
                  title: Text('login'),
                  leading: Icon(Icons.login),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
            );
          } else {
            return ListView(
              children: [
                DrawerHeader(
                    child: Column(children: [
                      const CircleAvatar(
                       // backgroundImage:NetworkImage(auth.user.avatar),
                        backgroundColor: Colors.white,
                        radius: 50,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(auth.user.name),
                      Text(auth.user.email),
                    ]),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    )),
                ListTile(
                  title: Text('logout'),
                  leading: Icon(Icons.logout),
                  onTap: () {
                     Provider.of<Auth>(context, listen: false)
                        .logout();
                  },
                )
              ],
            );
          }
        })));
  }
}
