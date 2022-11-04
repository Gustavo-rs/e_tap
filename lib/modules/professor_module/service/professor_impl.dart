import 'dart:convert';
import 'dart:developer';

import 'package:app/core/util/shared_impl.dart';
import 'package:app/modules/professor_module/model/disciplinas_professor_model.dart';
import 'package:app/modules/professor_module/model/lista_alunos_materia_model.dart';
import 'package:app/modules/professor_module/service/i_professor.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class ProfessorImpl implements IProfessor {
  final shared = Modular.get<LocalStorageServiceImp>();

  @override
  Future<List<DisciplinasProfessorModel>> getDisciplinasProfessor() async {
    final token = await shared.read('token');
    final id_professor = await shared.read('id');
    try {
      final url = Uri.parse(
          "https://projeto-integrador-production.up.railway.app/user/subject/$id_professor/");
      final resposta = await http.get(url, headers: {
        "Authorization": 'Bearer $token',
      });

      List jsonResponse = json.decode(resposta.body);
      if (jsonResponse
              .map((e) => DisciplinasProfessorModel.fromJson(e))
              .toList() ==
          []) {
        return [];
      }
      return jsonResponse
          .map((e) => DisciplinasProfessorModel.fromJson(e))
          .toList();
    } on PlatformException catch (e) {
      log(e.toString());
      return DisciplinasProfessorModel() as List<DisciplinasProfessorModel>;
    }
  }

  @override
  Future<ListaAlunosMateria> getListaDeAlunosMateria(int id) async {
    final token = await shared.read('token');

    try {
      final url = Uri.parse(
          "https://projeto-integrador-production.up.railway.app/educator/list/students/$id/");
      final resposta = await http.get(url, headers: {
        "Authorization": 'Bearer $token',
      });

      if (ListaAlunosMateria.fromJson(json.decode(resposta.body)).students ==
          []) {
        return ListaAlunosMateria(students: []);
      }

      return ListaAlunosMateria.fromJson(json.decode(resposta.body));
    } on PlatformException catch (e) {
      log(e.toString());
      return ListaAlunosMateria(students: []);
    }
  }
}
