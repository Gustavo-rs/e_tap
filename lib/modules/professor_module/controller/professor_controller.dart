import 'package:app/modules/professor_module/model/disciplinas_professor_model.dart';
import 'package:app/modules/professor_module/model/lista_alunos_materia_model.dart';
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
  bool isLoad = false;

  @observable
  bool isMateriaLoad = false;

  @observable
  bool isVazio = false;

  @observable
  bool isVazioDisc = false;

  @observable
  int isSelectedPage = 0;

  @action
  void changeSelectedPage(int value) {
    isSelectedPage = value;
  }

  @observable
  List<DisciplinasProfessorModel> discProfessor = [];

  @observable
  ListaAlunosMateria listAlunosMateria = ListaAlunosMateria();

  @action
  Future<void> setDisciplinasProfessor() async {
    isMateriaLoad = true;
    List<DisciplinasProfessorModel> data =
        await professorService.getDisciplinasProfessor();

    if (data == []) {
      isVazioDisc = true;
    }

    discProfessor = data;
    isMateriaLoad = false;
  }

  @action
  Future<void> setListaAlunosMateria(int id) async {
    isLoad = true;
    final data = await professorService.getListaDeAlunosMateria(id);

    listAlunosMateria = data;

    if (listAlunosMateria.students == []) {
      isVazio = true;
    }
    isLoad = false;
  }
}
