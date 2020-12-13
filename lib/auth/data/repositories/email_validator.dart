enum EmailValidationResult {
  valid,
  invalid,
}

EmailValidationResult validateEmail(String email) {
  // RFC 2821
  // For more details see
  // https://www.regexlib.com/REDetails.aspx?regexp_id=2558
  const exp = r"^((([!#$%&'*+\-\/=?^_`{|}~\w])|([!#$%&'*+\-\/=?^_"
      r"`{|}~\w][!#$%&'*+\-\/=?^_`{|}~\.\w]{0,}[!#$%&'*+\"
      r'-\/=?^_`{|}~\w]))[@]\w+([-.]\w+)*\.\w+([-.]\w+)*)$';

  final regExp = RegExp(exp);

  if (!regExp.hasMatch(email)) {
    return EmailValidationResult.invalid;
  }

  return EmailValidationResult.valid;
}
