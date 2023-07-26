import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_full_app/product/utility/exception/custom_exceptions.dart';

mixin class IdModel {
  String? id;
}

mixin class BaseFirebaseModel<T extends IdModel>  {

// T fromJson(Map<String, dynamic> json);

T fromJson(Map<String, dynamic> json) {
  // TODO: implement fromJson
  throw UnimplementedError();
}

T fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot){
  final value = snapshot.data();
  if(value == null){
    throw FirebaseCustomExcepiton('$snapshot data is null');
  }
  value.addEntries([MapEntry('id', snapshot.id)]);
  return fromJson(value);
}


  
}