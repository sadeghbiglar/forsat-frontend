import 'package:flutter/material.dart';
import 'package:forsat/presentation/Opportunities/opportunities_page.dart';

void main() {
  runApp(const Forsat());
}

class Forsat extends StatelessWidget {
  const Forsat({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forsat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       home:OpportunitiesPage(),
    );
  }
}
