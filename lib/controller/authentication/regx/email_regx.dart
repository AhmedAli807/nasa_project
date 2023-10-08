 final RegExp _emailRegExp = RegExp(
  r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
);
  bool isEmailValid(String email) {
 return _emailRegExp.hasMatch(email);
 }