import 'package:flutter/material.dart';
import 'package:forsat/presentation/home/home_page.dart';
import 'package:forsat/screens/home_screen.dart';
import 'package:forsat/screens/login_screen.dart';
import 'package:forsat/services/auth.dart';
import 'package:provider/provider.dart';

class ddrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   Drawer(child: Consumer<Auth>(builder: (context, auth, child) {
          if (!auth.authenticated) {
            return ListView(
              children: [
                ListTile(
                  title: Text('ورود'),
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
                  title: Text('خروج'),
                  leading: Icon(Icons.logout),
                  onTap: () {
                     Provider.of<Auth>(context, listen: false)
                        .logout();
                          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  HomeScreen()),
  );
                  },
                ),
                ListTile(
                  title: Text('داشبورد'),
                  leading: Icon(Icons.logout),
                  onTap: () {
                      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  HomePage()),
  );
                  },
                ),
                ListTile(
                  title: Text('صفحه اصلی'),
                  leading: Icon(Icons.logout),
                  onTap: () {
                      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  HomeScreen()),
  );
                  },
                )
              ],
            );
          }
        }
        )
        );
    
  }
}