import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> firestoreAddUser() async {
  final userDoc = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser.uid);

  if (!(await userDoc.get()).exists) {
    await userDoc.set({'favourites': []});
  }
}
