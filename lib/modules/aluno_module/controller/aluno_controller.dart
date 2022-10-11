import 'package:app/core/util/shared_impl.dart';
import 'package:app/modules/aluno_module/model/data_horas_aluno_model.dart';
import 'package:app/modules/aluno_module/model/materias_aluno_model.dart';
import 'package:app/modules/aluno_module/service/aluno_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'aluno_controller.g.dart';

class AlunoController = _AlunoController with _$AlunoController;

abstract class _AlunoController with Store {
  final alunoImpl = AlunoImpl();
  final shared = Modular.get<LocalStorageServiceImp>();

  @observable
  String ndefWidgets = '';

  @observable
  bool isVisible = false;

  @observable
  bool isMateriaLoad = false;

  @observable
  bool isVazio = false;

  @observable
  bool isHorasVazio = false;

  @observable
  String state = '';

  @observable
  bool isLoad = false;

  @observable
  int isSelectedPage = 0;

  @observable
  var dataHorasAluno = DataHorasAlunoModel();

  @observable
  var materiasAlunos = MateriaAlunoModel();

  @action
  void changeSelectedPage(int value) {
    isSelectedPage = value;
  }

  @action
  void setIsVisible(bool value) => isVisible = value;

  @action
  void setNdefWidgets(String value) => ndefWidgets = value;

  @action
  void setStateFunc(String value) {
    state = value;
  }

  @action
  Future<void> getMateriasAluno() async {
    isMateriaLoad = true;
    String id = await shared.read('id') as String;
    final data = await alunoImpl.getMaterias(id);
    if (data.student == 'error') {
      isHorasVazio = true;
    }
    materiasAlunos = data;
    isMateriaLoad = false;
  }

  @action
  Future<void> dateHours(String id_disciplina) async {
    isLoad = true;
    String id_aluno = await shared.read('id') as String;
    final data = await alunoImpl.getDataHorasAluno(id_aluno, id_disciplina);

    if (data == []) {}

    isLoad = false;
    dataHorasAluno = data[0];
  }
}
