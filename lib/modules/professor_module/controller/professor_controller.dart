import 'package:app/modules/professor_module/model/disciplinas_professor_model.dart';
import 'package:app/modules/professor_module/service/professor_impl.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'professor_controller.g.dart';

class ProfessorController = _ProfessorController with _$ProfessorController;

abstract class _ProfessorController with Store {
  final professorService = ProfessorImpl();

  final nomeDisciplina = TextEditingController();
  final totalEncontros = TextEditingController();
  final totalChamadas = TextEditingController();

  @observable
  bool isMateriaLoad = false;

  @observable
  bool isVazio = false;

  @observable
  int isSelectedPage = 0;

  @action
  void changeSelectedPage(int value) {
    isSelectedPage = value;
  }

  @observable
  List<DisciplinasProfessorModel> discProfessor = [];

  @action
  Future<void> setDisciplinasProfessor() async {
    isMateriaLoad = true;
    List<DisciplinasProfessorModel> data =
        await professorService.getDisciplinasProfessor();

    discProfessor = data;
    isMateriaLoad = false;
  }
}
