import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//3mlt al class da ahot kol al function bta3t al firestore
import '../../../model/user.dart';
class FirestoreHelper{
  //htetha fe func lwa7da 3shan al code da bst5dmo kter
  static CollectionReference<User> getUsersCollections(){
    // //3shan ageb obj mn al collection law collection user msh mwgod howa hy33mlo create
    var reference= FirebaseFirestore.instance.collection("User").withConverter(

      //howa hyakhod al func bta3tna w ynfzha w hy convert mn map le obj
        //bt3btlk al data al gya mn firestore fe snapshot(copy of doc)
        fromFirestore:(snapshot,option){
          Map<String,dynamic>?data=snapshot.data();//bydek al snapshot bta3 kol doc bs 3ala hy2et map
          return User.fromFirestore( data??{});  //law b null hb3thalo fadya 3shan kol haga tkon b null gowa,h7wlha le obj
        }  ,

        //hy7wl  al obj le map
        toFirestore: (user,options){
          return user.toFirestore();
        } );
    //ana bdef al user fe al collection fm7tag awl haga ageb al collection
    //kda bgeb al collection 3shan ykon fe edy w abd2 adef feh user brahte
    return reference;
  }


  // func bt3ml create le obj mn al user w ab3tlha al variable bta3tha
  static Future<void> Adduser(String email,String fullname,String userID)async{

              // create document :3ayz akhzn al obj (document) flazm a3ml document gded mn al colletion da
        var document= getUsersCollections().doc(userID); //wana b3ml al doc al id msh auto generated la

        //hbd2 a3ml set le data fe al doc fe shkl object mn class   hint:law mkontsh 3mlt cinvert kan hytlob map
     await document.set(
      User(
          id: userID ,
          fullname:  fullname,
          email: email, )
    );
  }

  //tb law 3ayz ageb user >read data > Get data
  static Future<User?> GetUser(String  userID)async{
    //3ayz arbot al doc b al user flazm al etnen ykono nfs al ID f3shan kda b3t le al doc al User ID
    var document= getUsersCollections().doc(userID);
    var snapshot=await document.get(); //btgblk al data ale fe al doc
    User? user=snapshot.data();//func al data btrg3 obj mn al user
    return user;

 }
}