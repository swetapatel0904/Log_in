import 'package:flutter/cupertino.dart';
import 'package:log_in/utils/shared_helper.dart';

class LogInProvider with ChangeNotifier
{
  String email="",pass="";

void save(String s1, String s2)
{
  email=s1;
  pass=s2;
  saveEmail(email);
  savePass(pass);
}
}