import 'package:flutter/material.dart';

typedef fieldValidation= String? Function(String?)? ;

class CustomFormField extends StatelessWidget {

String label;
TextInputType keyboard;
bool obsecureText;
Widget? suffixIcon;
fieldValidation validator;
TextEditingController controller;
int maxlines;
CustomFormField({required this.label,required this.keyboard, this.obsecureText=false,this.suffixIcon,this.validator,required this.controller,this.maxlines=1});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator ,
      obscureText: obsecureText, //h7otlha default false
      obscuringCharacter: "*",
      keyboardType:  keyboard,

      controller:  controller ,
       maxLines:maxlines ,
      style: TextStyle(), //bta3 ale al user hyktbi
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        label: Text(label,style: TextStyle(color: Colors.black,fontSize: 16)),
      suffixIcon: suffixIcon,
      ),
    );
  }
}
