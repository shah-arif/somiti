import 'package:flutter/material.dart';
import 'package:somiti/screens/admin_control.dart';
import 'package:somiti/screens/admin_control_screen.dart';
import 'package:somiti/screens/authenticate.dart';
import 'package:somiti/screens/draft.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(child: ListTile(title: Text("Admin Control"),),onTap: (){
              showDialog(context: context, builder: (context){
                return Authenticate();
              });
              },)
          ],
        ),
      )
    );
  }
}
