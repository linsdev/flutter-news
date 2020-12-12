import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

DocumentReference getUserDocRef() {
  return FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser.uid);
}
