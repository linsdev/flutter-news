import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news/user/data/data_sources/firestore_names.dart';

DocumentReference getUserDocRef() {
  return FirebaseFirestore.instance
      .collection(FirestoreNames.UserCollection)
      .doc(FirebaseAuth.instance.currentUser.uid);
}
