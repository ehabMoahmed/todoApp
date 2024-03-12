import 'package:flutter/material.dart';
import 'package:todoapp/model/user.dart' as MyUser;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoapp/shared/remote/firebase/firestore_helper.dart';

//3shan ast5dm data bta3t al user fe al app kolo
class Authprovider extends ChangeNotifier{
  User? firebaseUserAuth;  //da bta3 al auth //3shan al autologin
  MyUser.User? databaseUser;  // w da obj al user bta3 al firestore

void  setUsers(User? newFirebaseUserAuth, MyUser.User? newDatabaseUser){
  firebaseUserAuth=newFirebaseUserAuth;
  databaseUser=newDatabaseUser;
}
bool isFirebaseUserLoggedIn(){
  if(FirebaseAuth.instance.currentUser==null)return false;
  //law fe currentUser mfrod akhzo firebaseUserAuth
  firebaseUserAuth=FirebaseAuth.instance.currentUser;
  return true;
}
Future<void>retrieveDatabaseUserData() async {
  try{
    databaseUser= await FirestoreHelper.GetUser(firebaseUserAuth!.uid);

  }catch(error){
    print(error);
  }
}
Future<void> SignOut() async {
  firebaseUserAuth=null;
  databaseUser=null;

  //Auth
 return await FirebaseAuth.instance.signOut();
}

 }
