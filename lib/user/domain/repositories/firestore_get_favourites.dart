import 'package:cloud_firestore/cloud_firestore.dart';

getFavourites(DocumentReference doc, String field) async {
  return (await doc.get()).data()[field];
}
