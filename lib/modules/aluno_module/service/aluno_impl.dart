import 'dart:convert';
import 'dart:developer';

import 'package:app/modules/aluno_module/model/data_horas_aluno_model.dart';
import 'package:app/modules/aluno_module/service/i_aluno.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class AlunoImpl extends IAlunoService {
  @override
  Future<List<DataHorasAlunoModel>> getDataHorasAluno(
      String email, String senha, String disciplina, int id_aluno) async {
    try {
      final url = Uri.parse(
          "https://projeto-integrador-production.up.railway.app/student/subject/call/$id_aluno/$disciplina/");
      final resposta = await http.get(url, headers: {
        "Authorization": 'YWx1bm90ZXN0ZUBnbWFpbC5jb206MTIzNDU2',
      });

      List jsonResponse = json.decode(resposta.body);
      return jsonResponse.map((e) => DataHorasAlunoModel.fromJson(e)).toList();
    } on PlatformException catch (e) {
      log(e.toString());
      return DataHorasAlunoModel() as List<DataHorasAlunoModel>;
    }
  }
}
