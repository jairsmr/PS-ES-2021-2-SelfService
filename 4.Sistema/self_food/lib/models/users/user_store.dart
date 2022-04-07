import 'package:cloud_firestore/cloud_firestore.dart';

class UserStore {

  UserStore({this.email, this.password, this.name, this.id});

  String ? email;
  String ? password;
  String ? name;
  String? confirmPassword;
  String ? id;
  bool admin = false;

  UserStore.fromDocument(DocumentSnapshot document){
    id = document.id;
    name = document.get('name');
    email = document.get('email');
    Map<String,dynamic> dataMap = document.data() as Map<String,dynamic>;
  }
  DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('users/$id');  

  Future<void> saveData()async{

   await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap(){
   return {
      'name': name,
      'email': email,
  };
  }
}
