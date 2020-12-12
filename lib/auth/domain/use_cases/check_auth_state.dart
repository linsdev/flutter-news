import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

bool isUserSignedIn() => _auth.currentUser != null;
