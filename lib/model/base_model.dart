//import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseModel {
  BaseModel();
  //BaseModel.fromMap(DocumentSnapshot document);
  String getCollection();
  String getUid();
  void setUid(String uId);
  toMap();
}