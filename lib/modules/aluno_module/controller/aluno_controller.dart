import 'package:app/core/components/app_snackbar.dart';
import 'package:app/core/util/shared_impl.dart';
import 'package:app/modules/aluno_module/model/data_horas_aluno_model.dart';
import 'package:app/modules/aluno_module/model/materias_aluno_model.dart';
import 'package:app/modules/aluno_module/service/aluno_impl.dart';
import 'package:flutter/cupertino.dart';
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
      isVazio = true;
    }
    materiasAlunos = data;
    isMateriaLoad = false;
  }

  @action
  Future<void> dateHours(String id_disciplina) async {
    isLoad = true;
    String id_aluno = await shared.read('id') as String;
    final data = await alunoImpl.getDataHorasAluno(id_aluno, id_disciplina);

    if (data.isEmpty) {
      isHorasVazio = true;
    } else {
      isHorasVazio = false;
    }

    isLoad = false;

    if (data.length > 0) {
      dataHorasAluno = data[0];
    } else {
      DataHorasAlunoModel();
    }
  }

  @action
  Future<void> callAluno(BuildContext context) async {
    String status = await alunoImpl.callAluno(ndefWidgets);

    if (status == 'success') {
      setStateFunc('success');
      Future.delayed(const Duration(seconds: 4), () {
        setStateFunc('default');
      });
      AppSnackbar.success(context, 'Chamada cadastrada com sucesso!');
    } else {
      AppSnackbar.error(context, 'Erro ao cadastrar chamada!');
    }
  }
}
