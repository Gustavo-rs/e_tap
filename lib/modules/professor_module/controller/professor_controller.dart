import 'package:app/core/components/app_snackbar.dart';
import 'package:app/core/util/shared_impl.dart';
import 'package:app/modules/professor_module/model/disciplinas_professor_model.dart';
import 'package:app/modules/professor_module/model/lista_alunos_materia_model.dart';
import 'package:app/modules/professor_module/service/professor_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'professor_controller.g.dart';

class ProfessorController = _ProfessorController with _$ProfessorController;

abstract class _ProfessorController with Store {
  final professorService = ProfessorImpl();

  final nomeDisciplina = TextEditingController();
  final totalEncontros = TextEditingController();
  final totalChamadas = TextEditingController();

  final shared = Modular.get<LocalStorageServiceImp>();

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
  Future<void> iniciarChamada(BuildContext context) async {
    final id = await shared.read('id');
    if (countCall.isEmpty) {
      AppSnackbar.error(context, "Selecione pelo menos uma chamada");
    } else {
      loadChamadaProf = true;
      int idMeetResult = await professorService.getIdMeet(int.parse(id!));
      String postChamadaResult =
          await professorService.postChamada(idMeetResult, countCall);

      if (postChamadaResult == "alreadystarted") {
        AppSnackbar.error(context, "Chamada já foi iniciada");
        loadChamadaProf = false;
      }
    }
  }

  @action
  Future<void> finalizarChamada(BuildContext context) async {
    final id = await shared.read('id');
    int idMeetResult = await professorService.getIdMeet(int.parse(id!));
    String postEncerraResult =
        await professorService.encerraChamada(idMeetResult, countCall);

    if (postEncerraResult == "finished") {
      AppSnackbar.error(context, "Chamada já foi finalizada");
      loadChamadaProf = false;
    } else {
      AppSnackbar.success(context, "Chamada finalizada com sucesso");
      loadChamadaProf = false;
    }
  }
}
