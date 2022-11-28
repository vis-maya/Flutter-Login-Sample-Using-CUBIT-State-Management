class FormValidator {
  static String? isNullOrEmpty(String? inputValue) {
    if (inputValue == null) { //null has no identity
      return "please enter value";
    }
    if (inputValue
        .trim()
        .isEmpty) { //empty:there is an identity    // trim:eliminating unwanted spaces
      return "please enter value";
    }
    return null; //func return nullable string
  }

  static String? isValidEmail(String? emailValue) {
    String? nullOrEmptyError = isNullOrEmpty(emailValue);
    if (nullOrEmptyError != null) {
      return nullOrEmptyError;
    }
    final bool emailValid =
    RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailValue!);

    if (!emailValid) {
      return "Invalid value";
    }
    return null;
  }


  static String? isValidpassword(String? passwordValue) {
    String? nullOrEmptyError = isNullOrEmpty(passwordValue);
    if (nullOrEmptyError != null) {
      return nullOrEmptyError;
    }
    final bool passwordValid =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(passwordValue!);

    if (!passwordValid) {
      return "Invalid value";
    }
    return null;
  }
}