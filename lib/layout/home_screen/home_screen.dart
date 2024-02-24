import 'package:flutter/material.dart';

import '../../style/app-colors.dart';

class HomeScreen extends StatelessWidget {
   static const String routeName="homeScreen";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child:   Scaffold(
        backgroundColor: Colors.transparent,
        appBar:  AppBar(

        )
        
      ),
    );
  }
}
