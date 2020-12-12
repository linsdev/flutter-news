import 'package:news/auth/domain/repositories/email_password_validator.dart';

class EmailPassword {
  final String email;
  final String password;
  final EmailPasswordValidationResult validation;

  EmailPassword(this.email, this.password)
      : validation = validateEmailPassword(email, password);
}
