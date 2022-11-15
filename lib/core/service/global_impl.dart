import 'dart:convert';
import 'dart:developer';

import 'package:app/core/service/i_global_service.dart';
import 'package:app/core/util/shared_impl.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class GlobalImpl implements IGlobalService {
  @override
  Future<String> trocarSenha(
      String email, String old_password, String new_password) async {
    final shared = Modular.get<LocalStorageServiceImp>();

    final token = await shared.read('token');
    final json =
        '{"email": "$email","old_password": "$old_password","new_password": "$new_password"}';
    try {
      final url = Uri.parse(
          "https://projeto-integrador-production.up.railway.app/user/updatepassword/");
      final resposta = await http.post(url,
          headers: {
            "Authorization": 'Bearer $token',
          },
          body: json);

      if (resposta.statusCode != 200 || resposta.body.contains("Traceback")) {
        return 'error';
      }

      return jsonDecode(resposta.body)['status'];
    } on PlatformException catch (e) {
      log(e.toString());
      return 'error';
    }
  }
}
