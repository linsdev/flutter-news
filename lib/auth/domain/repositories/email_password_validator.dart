import 'package:news/auth/data/repositories/email_validator.dart';
import 'package:news/auth/data/repositories/password_validator.dart';

enum EmailPasswordValidationResult {
  Valid,
  Invalid,
}

EmailPasswordValidationResult validateEmailPassword(
  String email,
  String password,
) {
  if (validateEmail(email) != EmailValidationResult.Valid) {
    return EmailPasswordValidationResult.Invalid;
  }

  if (validatePassword(password) != PasswordValidationResult.Valid) {
    return EmailPasswordValidationResult.Invalid;
  }

  return EmailPasswordValidationResult.Valid;
}
