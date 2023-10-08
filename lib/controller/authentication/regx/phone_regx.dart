final RegExp _phoneRegExp = RegExp(
  r'^\(\d{3}\) \d{3}-\d{4}$',
);
bool isPhoneValid(String phone) {
  return _phoneRegExp.hasMatch(phone);
}