import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news/user/data/data_sources/firestore_names.dart';

Future<List> getFavouritesInJson(DocumentReference doc) async {
  return (await doc.get()).data()[FirestoreNames.favouritesField];
}
