class SignUpFormModel {
   String? firstName;
   String? lastName;
   String? email;
   String? password;
   String? passwordConfirmation;

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
  bool validatePassword(String password) {
    return  (password.length > 6);
    
  }
   bool validatepasswordConfirmation( String passwordConfirmation) {
    return(passwordConfirmation.length > 6) ;
    
  }


   bool validatefirstName(String firstName) {
    return  (firstName.length > 3);
  }
   bool validatelastName(String lastName) {
    return  (lastName.length > 3);
  }
}

class LoginError extends Error {
  final String message;
  LoginError({required this.message});
}
