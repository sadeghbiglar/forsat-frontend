import 'package:flutter/material.dart';
import 'package:forsat/presentation/home/home_page.dart';
import 'package:forsat/screens/drawer.dart';
import 'package:forsat/screens/home_screen.dart';
import 'package:forsat/screens/login_screen.dart';
import 'package:forsat/services/auth.dart';
import 'package:provider/provider.dart';

class OpportunitiesPage extends StatefulWidget {
  @override
  _OpportunitiesPageState createState() => _OpportunitiesPageState();
}

class _OpportunitiesPageState extends State<OpportunitiesPage> with AutomaticKeepAliveClientMixin {
  @override
   Future<bool> _onBackPressed () async{
  return await showDialog(
    context: context,
    builder: (context) =>  AlertDialog(
      title: const Text(' آیا مطمئن هستید؟'),
      content:const  Text('می خواهید از برنامه خارج شوید'),
      actions: <Widget>[
    
      const  SizedBox(height: 2),
    
       MaterialButton(
         
                    child:const Text("بله"),
           onPressed: (){
            Provider.of<Auth>(context, listen: false).logout();
            Navigator.of(context).pop(true);
         },
       ),
        MaterialButton(
                    child:const Text("خیر"),
           onPressed: (){
           Navigator.of(context).pop(false);
         },
       )
      ],
    ),
  ) ??
      false;
}

  Widget build(BuildContext context) {
      super.build(context);
      return WillPopScope(
    onWillPop: _onBackPressed,
    child:  Scaffold(
      
      appBar: AppBar(
        title:const Text('داشبورد مدیریت')
      ),
       drawer:ddrawer(),
    )
      );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}