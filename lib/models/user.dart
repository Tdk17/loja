import 'package:cloud_firestore/cloud_firestore.dart';

class User{

User({this.email,this.password,this.name, this.id});

User.fronDocument(DocumentSnapshot document){
  id = document.documentID;
  name = document.data['name'] as String;
  email = document.data['email'] as String;

}
  

  String id;
  String email;
  String password;
  String name;

  String confirmPassword;

  DocumentReference get firestoreRef =>
  Firestore.instance.document('user/$id');

  Future<void> saveData()async{
    
   await firestoreRef.setData(toMap());
    
  }
  Map<String, dynamic> toMap(){
    return{
      'name': name,
      'email': email,
    };

  }
}