import 'package:flutter/material.dart';

import 'package:news/auth/presentation/widgets/sign_in_with_email_password.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInWithEmailAndPasswordCard(),
            ],
          ),
        ),
      ),
    );
  }
}
