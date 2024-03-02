import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/layout/login/login_screen.dart';
import 'package:todoapp/shared/provider/auth_provider.dart';

import '../../style/app-colors.dart';

class HomeScreen extends StatelessWidget {
   static const String routeName="homeScreen";

  @override
  Widget build(BuildContext context) {
    Authprovider provider=Provider.of<Authprovider>(context);
    return Container(
      color: AppColors.backgroundColor,
      child:   Scaffold(
        backgroundColor: Colors.transparent,
        appBar:  AppBar(
          backgroundColor: Colors.blue,
          leading:IconButton(
            onPressed: () async {
                 await   provider.SignOut();
                 Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              },
              icon: Icon (
                Icons.exit_to_app,
                size: 20,
                color: Colors.white,
              ),
              ) ,
        )
        
      ),
    );
  }
}
