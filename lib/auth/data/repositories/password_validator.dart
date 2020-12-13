enum PasswordValidationResult {
  Valid,
  TooShort,
  InvalidCharacters,
}

PasswordValidationResult validatePassword(String password) {
  // Password contains at least 6 characters and consists from
  // upper/lower case letters, numbers, and _ @ & $ symbols.

  if (password.length < 6) {
    return PasswordValidationResult.TooShort;
  }

  const exp = r'^[a-zA-Z0-9_@&$]+$';
  RegExp regExp = RegExp(exp);

  if (!regExp.hasMatch(password)) {
    return PasswordValidationResult.InvalidCharacters;
  }

  return PasswordValidationResult.Valid;
}
