import 'package:cloud_firestore/cloud_firestore.dart';

mixin class IdModel {
  String? id;
}

mixin class BaseFirebaseModel<T extends IdModel>  {

// T fromJson(Map<String, dynamic> json);

T fromJson(Map<String, dynamic> json) {
  // TODO: implement fromJson
  throw UnimplementedError();
}

T? fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot){
  final value = snapshot.data();
  if(value == null){
    return null;
  }
  value.addEntries([MapEntry('id', snapshot.id)]);
  return fromJson(value);
}


  
}