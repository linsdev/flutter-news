import 'package:firebase_auth/firebase_auth.dart';

import 'package:news/user/domain/repositories/firestore_add_user.dart';

enum SignInResult {
  Success,
  EmailPasswordInvalid,
}

Future<SignInResult> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return await _createUser(email, password);
    } else {
      return SignInResult.EmailPasswordInvalid;
    }
  }
  return SignInResult.Success;
}

Future<SignInResult> _createUser(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    return SignInResult.EmailPasswordInvalid;
  }
  await firestoreAddUser();
  return SignInResult.Success;
}
