import 'dart:convert';
import 'dart:developer';

import 'package:app/modules/login/model/login_model.dart';
import 'package:app/modules/login/service/i_login.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class LoginImpl extends ILoginService {
  @override
  Future<LoginModel> login(String email, String senha) async {
    try {
      if (email == '' || senha == '') {
        email = 'default';
        senha = 'default';
      }
      final url = Uri.parse(
          "https://projeto-integrador-production.up.railway.app/login/");

      final resposta = await http.post(url,
          body: jsonEncode({"email": email, "password": senha}));

      if (resposta.body == 'null') {
        return LoginModel(
          status: 'error',
          token: '',
        );
      }
      return LoginModel.fromJson(json.decode(resposta.body));
    } on PlatformException catch (e) {
      log(e.toString());
      return LoginModel(status: "error");
    }
  }
}
