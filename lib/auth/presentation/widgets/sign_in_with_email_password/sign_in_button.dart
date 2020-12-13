import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:news/app/domain/entities/app.dart';
import 'package:news/auth/domain/use_cases/signin_with_email_password.dart';
import 'package:news/core/presentation/widgets/error_snack_bar.dart';
import 'provides.dart';
import 'validate_email_password.dart';

class SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: 120,
      child: Text('Sign In', style: TextStyle(color: Colors.white)),
      color: Theme.of(context).colorScheme.primary,
      onPressed: () async {
        final String email = context.read(emailTextFormProvider).text;
        final String password = context.read(passwordTextFormProvider).text;

        if (validateEmailPassword(context, email, password)) {
          final signInResult = await signIn(email, password);
          if (signInResult == SignInResult.Success) {
            Navigator.pushReplacementNamed(context, App.PageNews);
            return;
          }
        }

        errorSnackBar(context, "Failed to Sign In");
      },
    );
  }
}
