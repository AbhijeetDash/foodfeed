
import 'dart:convert';

import 'package:http/http.dart' as http;


Future<bool> login(String email,String pass) async {
  http.Response a = await http.get(Uri.encodeFull('http://localhost:3000/?email=${email}&pass=${pass}'));
  print("Login Called");
  if(json.decode(a.body)['task'].toString() == " Successfull"){
    return false;
  }
  return true;
}

Future<bool> create(String email,String pass, String name, String url) async {
  http.Response a = await http.get(Uri.encodeFull('http://localhost:3000/?&email=${email}&pass=${pass}&name=${name}&pic=${url}'));
  print("Login Called");
  if(json.decode(a.body)['task'].toString() == " Successfull"){
    return false;
  }
  return true;
}