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

  @observable
  bool loadChamadaProf = false;

  @observable
  List<int> countCall = ObservableList<int>.of([]);

  @observable
  List<int> call = ObservableList<int>.of([1, 2, 3, 4]);

  @action
  void changeChamada(bool value, int index) {
    if (value) {
      countCall.add(index);
    } else {
      countCall.remove(index);
    }
  }

  @action
  void ordenarChamada() {
    countCall.sort();
  }

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

  @action
  Future<void> postChamadaProf() async {
    loadChamadaProf = true;
    await professorService.postChamada(17, countCall);
    loadChamadaProf = false;
  }
}
