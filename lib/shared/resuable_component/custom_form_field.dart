import 'package:flutter/material.dart';

typedef fieldValidation= String? Function(String?)? ;

class CustomFormField extends StatelessWidget {

String label;
TextInputType keyboard;
bool obsecureText;
Widget? suffixIcon;
fieldValidation validator;
TextEditingController controller;

CustomFormField({required this.label,required this.keyboard, this.obsecureText=false,this.suffixIcon,this.validator,required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator ,
      obscureText: obsecureText, //h7otlha default false
      obscuringCharacter: "#",
      keyboardType:  keyboard,
      controller:  controller ,
      style: TextStyle(), //bta3 ale al user hyktbi
      decoration: InputDecoration(
        label: Text(label,style: TextStyle(color: Colors.black,fontSize: 16)),
      suffixIcon: suffixIcon,
      ),
    );
  }
}
