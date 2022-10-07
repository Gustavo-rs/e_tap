import 'package:app/modules/aluno_module/model/data_horas_aluno_model.dart';
import 'package:app/modules/aluno_module/service/aluno_impl.dart';
import 'package:mobx/mobx.dart';

part 'aluno_controller.g.dart';

class AlunoController = _AlunoController with _$AlunoController;

abstract class _AlunoController with Store {
  final alunoImpl = AlunoImpl();

  @observable
  String ndefWidgets = '';

  @observable
  bool isVisible = false;

  @observable
  String state = '';

  @observable
  bool isLoad = false;

  @observable
  int isSelectedPage = 0;

  @observable
  var dataHorasAluno = DataHorasAlunoModel();

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
  Future<void> dateHours() async {
    isLoad = true;
    final data = await alunoImpl.getDataHorasAluno(
        'alunoteste@gmail.com', '123456', '1', 10);

    isLoad = false;
    dataHorasAluno = data[0];
  }
}
