import 'package:flutter/material.dart';
import 'package:forsat/router/router.dart';
import 'package:forsat/router/route_constants.dart';
import 'package:forsat/screens/home_screen.dart';
import 'package:forsat/services/auth.dart';
import 'package:forsat/values/branding_color.dart';
import 'package:provider/provider.dart';
// void main() {
//   runApp(const Forsat());
// }
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
      ],
      child:const Forsat(),
    ),
  );
}
class Forsat extends StatelessWidget {
  const Forsat({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Forsat',
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: brandingColor,
      ),
        onGenerateRoute: Routers.onGenerateRoute,
      initialRoute: signInRoute,
     //////////// home: HomeScreen(),
    );
  }
}
