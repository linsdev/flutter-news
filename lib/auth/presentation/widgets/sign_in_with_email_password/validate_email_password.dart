import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:news/auth/data/repositories/email_validator.dart';
import 'package:news/auth/data/repositories/password_validator.dart';
import 'provides.dart';

bool validateEmailPassword(
  BuildContext context,
  String email,
  String password,
) {
  return _emailValid(context, email) && _passwordValid(context, password);
}

bool _emailValid(BuildContext context, String email) {
  final error = context.read(emailErrorProvider);

  switch (validateEmail(email)) {
    case EmailValidationResult.Invalid:
      error.set('Email looks like fake');
      break;

    default:
      error.set('');
      return true;
  }

  return false;
}

bool _passwordValid(BuildContext context, String password) {
  final error = context.read(passwordErrorProvider);

  switch (validatePassword(password)) {
    case PasswordValidationResult.TooShort:
      error.set('Must contains at least 6 characters');
      break;

    case PasswordValidationResult.InvalidCharacters:
      error.set(
        'Must consists from letters, numbers, \nand _ @ & \$ symbols',
      );
      break;

    default:
      error.set('');
      return true;
  }

  return false;
}
