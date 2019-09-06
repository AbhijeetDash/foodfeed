
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<bool> login(String email,String pass) async {
  http.Response a = await http.get(Uri.encodeFull('http://localhost:3000/?task=login&email=${email}&pass=${pass}'));
  print("Login Called");
  if(json.decode(a.body)['task'].toString() == " Successfull"){
    return false;
  }
  return true;
}

Future<String> create(String email,String pass, String name, String url) async {
  http.Response a = await http.get(Uri.encodeFull('http://localhost:3000/?task=create&email=${email}&pass=${pass}&name=${name}&pic=${url}'));
  print("Login Called");
  if(json.decode(a.body)['task'].toString() == " Successfull"){
    return ""+json.decode(a.body)['name'].toString()+"%*%"+json.decode(a.body)['email'].toString()+"%*%"+json.decode(a.body)['pic'].toString();
  }
  return "error";
}