//awl class aw table aw collection howa user w dol al attributes bta3to
class User{
  //leh nullable ? l2nha dataa hgebha mn mkan tany mommkn mtgebsh haga mnhom fydrblk crash fe al app kolo
  String? id;
  String? fullname;
  String? email;
  User({required this.id,required this.fullname,required this.email});


  //hena 7wl al map le obj
    User.fromFirestore(Map<String, dynamic>  data,) {
      id: data?['id'];
      fullname: data?['fullname'];
      email: data?['email'];
      //kda akhdt mn al map 7wlha le obj
  }

  //ht7wl al obj le map
  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "fullname": fullname,
      "email": email,

    };
  }
}



