import 'package:app/modules/aluno_module/model/data_horas_aluno_model.dart';
import 'package:mobx/mobx.dart';

part 'global_controller.g.dart';

class GlobalController = _GlobalController with _$GlobalController;

abstract class _GlobalController with Store {
  @observable
  bool themes = true;

  @action
  void changeThemes() => themes = !themes;
}
