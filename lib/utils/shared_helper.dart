import 'package:shared_preferences/shared_preferences.dart';

void saveEmail(String s1) async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  shr.setString("email", s1);
}

Future<String?> getEmail() async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  return shr.getString("email");
}

void savePass(String s2) async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  shr.setString("password", s2);
}

Future<String?> getPass() async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  return shr.getString("password");
}
