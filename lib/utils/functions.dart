
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> login(String email,String pass) async {
  http.Response a = await http.get(Uri.encodeFull('http://localhost:3000/?task=login&email=${email}&pass=${pass}'));
  return a;
}

Future<bool> create(String email,String pass, String name, String url) async {
  http.Response a = await http.get(Uri.encodeFull('http://localhost:3000/?task=create&email=${email}&pass=${pass}&name=${name}&pic=${url}'));
  if(json.decode(a.body)['task'].toString() == "Successfull"){
    return true;
  } 
  return false;
}

Future<http.Response> getCate() async {
  http.Response a = await http.get(Uri.encodeFull('http://localhost:3000/?task=categoryList'));
  return a;
}

Future<bool> savePrefs(var list, String email) async {
  await http.get(Uri.encodeFull('http://localhost:3000/?task=addPrefs&list=${list}&email=${email}'));
  return true;
}

Future<bool> publish(String title, String content, String url, String email) async {
  http.Response a = await http.get(Uri.encodeFull('http://localhost:3000/?task=publish&title=${title}&content=${content}&url=${url}&email=${email}'));
  return true;
}

Future<bool> draft(String title, String content, String email) async {
  http.Response a = await http.get(Uri.encodeFull('http://localhost:3000/?task=draft&title=${title}&content=${content}&email=${email}'));
  return true;
}