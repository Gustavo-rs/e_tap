import 'package:mobx/mobx.dart';

part 'aluno_controller.g.dart';

class AlunoController = _AlunoController with _$AlunoController;

abstract class _AlunoController with Store {
  @observable
  String ndefWidgets = '';

  @observable
  bool isVisible = false;

  @action
  void setIsVisible(bool value) => isVisible = value;

  @action
  void setNdefWidgets(String value) => ndefWidgets = value;
}
