enum PasswordValidationResult {
  valid,
  tooShort,
  invalidCharacters,
}

PasswordValidationResult validatePassword(String password) {
  // Password contains at least 6 characters and consists from
  // upper/lower case letters, numbers, and _ @ & $ symbols.

  if (password.length < 6) {
    return PasswordValidationResult.tooShort;
  }

  const exp = r'^[a-zA-Z0-9_@&$]+$';
  final regExp = RegExp(exp);

  if (!regExp.hasMatch(password)) {
    return PasswordValidationResult.invalidCharacters;
  }

  return PasswordValidationResult.valid;
}
