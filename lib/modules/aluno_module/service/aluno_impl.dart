import 'dart:convert';
import 'dart:developer';

import 'package:app/core/util/shared_impl.dart';
import 'package:app/modules/aluno_module/model/data_horas_aluno_model.dart';
import 'package:app/modules/aluno_module/model/materias_aluno_model.dart';
import 'package:app/modules/aluno_module/service/i_aluno.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class AlunoImpl extends IAlunoService {
  final shared = Modular.get<LocalStorageServiceImp>();

  @override
  Future<List<DataHorasAlunoModel>> getDataHorasAluno(
      String id_aluno, String disciplina) async {
    String? token = await shared.read('token');
    try {
      final url = Uri.parse(
          "https://projeto-integrador-production.up.railway.app/student/subject/call/$id_aluno/$disciplina/");
      final resposta = await http.get(url, headers: {
        "Authorization": 'Bearer $token!',
      });

      if (resposta.statusCode == 200) {
        List jsonResponse = json.decode(resposta.body);
        return jsonResponse
            .map((e) => DataHorasAlunoModel.fromJson(e))
            .toList();
      }

      return [];
    } on PlatformException catch (e) {
      log(e.toString());
      return DataHorasAlunoModel() as List<DataHorasAlunoModel>;
    }
  }

  @override
  Future<MateriaAlunoModel> getMaterias(String id_aluno) async {
    String? token = await shared.read('token');
    try {
      final url = Uri.parse(
          "https://projeto-integrador-production.up.railway.app/student/list/subjects/$id_aluno/");
      final resposta = await http.get(url, headers: {
        "Authorization": 'Bearer $token!',
      });

      if (resposta.body.contains('error')) {
        return MateriaAlunoModel(student: 'error');
      }

      return MateriaAlunoModel.fromJson(json.decode(resposta.body));
    } on PlatformException catch (e) {
      log(e.toString());
      return MateriaAlunoModel();
    }
  }
}
