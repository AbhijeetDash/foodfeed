
import 'dart:convert';

import 'package:http/http.dart' as http;


Future<bool> credent(String task,String email,String pass) async {
  http.Response a = await http.get(Uri.encodeFull('http://localhost:3000/?task=${task}&email=${email}&pass=${pass}'));
  print("Login Called");
  if(json.decode(a.body)['task'].toString() == task+" Successfull"){
    return false;
  }
  return true;
}