import 'package:firebase_auth/firebase_auth.dart';

import 'package:news/auth/domain/entities/email_password.dart';
import 'package:news/auth/domain/repositories/email_password_validator.dart';
import 'package:news/user/domain/repositories/firestore_add_user.dart';

enum SignInResult {
  Success,
  EmailPasswordInvalid,
}

Future<SignInResult> signIn(EmailPassword emailPassword) async {
  if (emailPassword.validation == EmailPasswordValidationResult.Invalid) {
    return SignInResult.EmailPasswordInvalid;
  }

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailPassword.email,
      password: emailPassword.password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return await _createUser(emailPassword);
    } else {
      return SignInResult.EmailPasswordInvalid;
    }
  }
  return SignInResult.Success;
}

Future<SignInResult> _createUser(EmailPassword emailPassword) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailPassword.email,
      password: emailPassword.password,
    );
  } on FirebaseAuthException catch (e) {
    return SignInResult.EmailPasswordInvalid;
  }
  await firestoreAddUser();
  return SignInResult.Success;
}
