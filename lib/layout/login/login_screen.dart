import 'package:flutter/material.dart';
import 'package:todoapp/shared/constant.dart';
import 'package:todoapp/style/app-colors.dart';

import '../../shared/resuable_component/custom_form_field.dart';
import '../home_screen/home_screen.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName='login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
bool isObsecure=true;

//3n tre2 al controller t2dr tktb text mo3yn yban fe al awl aw tgeb al text al mwgod
 TextEditingController emailController=TextEditingController( );
TextEditingController PassController=TextEditingController( );

//adeto formstate 3shan function al validate mwgoda fe al formstate bs msh fe ay key
GlobalKey<FormState> formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(
          "assets/images/backgroundd.jpg"

        ))
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title:Text('Login',style: TextStyle(color: Colors.white,fontSize: 25)),
          backgroundColor: Colors.transparent,
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formkey,//bmsabt al controller bta3t al text form field bardo btshghl al validation
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10,),


                CustomFormField(
                  keyboard:TextInputType.emailAddress ,
                  label:'Email' ,
                validator:(value){
                    if(value==null||value.isEmpty){
                      return 'this feild cant be empty';
                    }
                    //de 3obara 3n function btbd2 tt2kd en al value mktob bnfs seght al variable da btrg3 true or false
                    if(!RegExp(Constant.emailRegex).hasMatch(value)) {
                      return "Enter valid Email";
                    }
                    return null; //law 3ada kol dol al validate tkon b null
                } ,
                  controller: emailController,

                  ),

                SizedBox(height: 10,),


                CustomFormField(
                  keyboard:TextInputType.visiblePassword ,
                  label: 'pass',
                obsecureText: isObsecure,
                suffixIcon:IconButton( onPressed:(){

                  setState(() {
                    isObsecure=!isObsecure;
                  });
                } ,
                    icon:Icon(
                       isObsecure? Icons.visibility_off:Icons.visibility,
                      size: 24,
                      color: AppColors.PrimaryLightColor,
                    ) ) ,
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return 'this feild cant be empty';
                    }
                    if(value.length<8){
                      return'Password should be at least 8 character';
                    }
                      return null;

                  },
                  controller: PassController,
                ),

                SizedBox(height: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.PrimaryLightColor,
                  ),
                    onPressed: (){
                      //law al formkey de b true nfzle kza law b true azhrle al kalam
                    if(formkey.currentState?.validate() ??false){
                      //3shan hyshel al register aw al login w yfth al home
                      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                    }
                    },
                    child:  Text('Login',style: TextStyle(
                      color: Colors.white,
                    ),)),
                SizedBox(height: 10,),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context,RegisterScreen.routeName  );
                },
                    child: Text('Dont have an account? sign up') )

              ],),
          ),
        ),

      ),
    );
  }
}
