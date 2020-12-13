import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:news/auth/data/repositories/email_validator.dart';
import 'package:news/auth/data/repositories/password_validator.dart';
import 'package:news/auth/domain/entities/email_password.dart';
import 'package:news/auth/domain/use_cases/signin_with_email_password.dart';
import 'package:news/core/presentation/widgets/error_snack_bar.dart';
import 'sign_in_with_email_password_provides.dart';

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

        _validateEmailPassword(context, email, password);

        final signInResult = await signIn(EmailPassword(email, password));
        if (signInResult == SignInResult.Success) {
          Navigator.pushReplacementNamed(context, App.PageNews);
        } else {
          errorSnackBar(context, "Failed to Sign In");
        }
      },
    );
  }
}

_validateEmailPassword(BuildContext context, String email, String password) {
  var emailErrorMessage = '';
  if (validateEmail(email) == EmailValidationResult.Invalid) {
    emailErrorMessage = 'Email looks like fake';
  }
  context.read(emailErrorProvider).set(emailErrorMessage);

  var passwordErrorMessage = '';
  switch (validatePassword(password)) {
    case PasswordValidationResult.TooShort:
      passwordErrorMessage = 'Must contains at least 6 characters';
      break;
    case PasswordValidationResult.InvalidCharacters:
      passwordErrorMessage = 'Must consists from '
          'letters, numbers, \nand _ @ & \$ symbols';
      break;
  }
  context.read(passwordErrorProvider).set(passwordErrorMessage);
}
