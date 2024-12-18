class RegexApp {

  RegExp emailReg = RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
  
  static bool checkPasswordLength(String string) {
    RegExp pattern = RegExp(r'^.{4,124}$');
    return pattern.hasMatch(string);
  }
}
