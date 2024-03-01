import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/user.dart';
class FirestoreHelper{
  CollectionReference<User> getUsersCollections(){
    var reference= FirebaseFirestore.instance.collection("User").withConverter(

      //howa hyakhod al func bta3tna w ynfzha w hy convert mn map le obj
        fromFirestore:(snapshot,option){
          Map<String,dynamic>?data=snapshot.data();//bydek al snapshot bta3 kol doc bs 3ala hy2et map
          return User.fromFirestore( data??{});
        }  ,

        //hy7wlha al obj le map
        toFirestore: (user,options){
          return user.toFirestore();
        } );
    //ana bdef al user fe al collection fm7tag awl haga ageb al collection
    //kda bgeb al collection 3shan ykon fe edy w abd2 adef feh user brahte
    return reference;
  }


  //3ayz akhzn acc  w akhod al func mn al documintaion
  Adduser(String email,String fullname,String userID)async{


        var document= getUsersCollections().doc(userID); //msh auto generated la
        //nbd2 ndef fe al doc data
    await document.set(
      User(
          id: userID ,
          fullname:  fullname,
          email: email, )

    );


  }
  //tb law 3ayz ageb user >read data > Get data

 Future<User?>GetUser(String  userID)async{
    var document= getUsersCollections().doc(userID);
    var snapshot=await document.get();
    snapshot.data();

 }
}