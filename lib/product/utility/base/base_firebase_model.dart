import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IdModel {
  String? id;
}

abstract class BaseFirebaseModel<T extends IdModel>  {

T fromJson(Map<String, dynamic> json);

T? fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot){
  final value = snapshot.data();
  if(value == null){
    return null;
  }
  value.addEntries([MapEntry('id', snapshot.id)]);
  return fromJson(value);
}


  
}