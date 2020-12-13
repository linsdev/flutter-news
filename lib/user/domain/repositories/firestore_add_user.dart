import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news/user/data/data_sources/firestore_names.dart';

Future<void> firestoreAddUser() async {
  final userDoc = FirebaseFirestore.instance
      .collection(FirestoreNames.userCollection)
      .doc(FirebaseAuth.instance.currentUser.uid);

  if (!(await userDoc.get()).exists) {
    await userDoc.set({FirestoreNames.favouritesField: []});
  }
}
