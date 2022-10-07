import 'package:app/core/data/alunos_data.dart';
import 'package:app/core/data/faltas_data.dart';
import 'package:app/core/models/alunos_model.dart';
import 'package:app/core/models/falta_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'professor_controller.g.dart';

class ProfessorController = _ProfessorController with _$ProfessorController;

abstract class _ProfessorController with Store {
  List<AlunosModel> alunos = alunos_data;

  List<FaltaModel> faltas = falta_data;

  final nomeDisciplina = TextEditingController();
  final totalEncontros = TextEditingController();
  final totalChamadas = TextEditingController();

  @observable
  int isSelectedPage = 0;

  @action
  void changeSelectedPage(int value) {
    isSelectedPage = value;
  }
}
