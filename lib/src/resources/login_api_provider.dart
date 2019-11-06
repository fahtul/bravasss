import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:login_with_localapi/src/models/login_model.dart';
import 'package:login_with_localapi/src/models/response_login_model.dart';

class LoginProvider {
  Client client = Client();
  final _baseUrl = "http://192.168.88.29/mahasiswa";

  Future<ResponseLogin> login(LoginPost loginPost) async {
    print('login');
    print("$_baseUrl/login.php");
    var map = new Map<String, dynamic>();
    map['email'] = loginPost.email;
    map['password'] = loginPost.password;
    Map<String, dynamic> body = {'email': loginPost.email, 'password': loginPost.password};
    final encoding = Encoding.getByName('utf-8');

//    Map<String, String> headers = {
//    "Content-Type": "application/x-www-form-urlencoded",
//    "Content-type": "application/json"};

    FormData formData = new FormData.fromMap(body);
    final response = await post(Uri.parse("$_baseUrl/login.php/",),   headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    },body: body,encoding: encoding);
    if(response.statusCode == 200){
      print(response.body.toString());
      print(client.post("$_baseUrl/login.php", body: map));
      return ResponseLogin.fromJson(json.decode(response.body));

    }else{
      print(client.post("$_baseUrl/login.php", body: map));
      throw Exception('Failed to load data' + response.body.toString());
    }
  }
}