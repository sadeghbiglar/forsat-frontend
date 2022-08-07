class SignInFormModel {
  late String email;
  late String password;
   void setEmail(String email) {
    if (!validateEmail(email)) {
      throw LoginError(message: "invalide message");
    }
    this.email = email;
}
 void setPassword(String password) {
    if (password.length < 6) {
      throw LoginError(message: "password lenght shuld be greater than 6");
    }
    this.password = password;
  }

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}

class LoginError extends Error {
  final String message;
  LoginError({required this.message});
}
