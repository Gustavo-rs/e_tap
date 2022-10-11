import 'package:app/core/util/shared_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'global_controller.g.dart';

class GlobalController = _GlobalController with _$GlobalController;

abstract class _GlobalController with Store {
  final shared = Modular.get<LocalStorageServiceImp>();

  @observable
  bool themes = true;

  @observable
  String email = '';

  @observable
  String nome = '';

  @observable
  Future<void> sharedEmailSenha() async {
    email = await shared.read('email') as String;
    nome = await shared.read('nome') as String;
  }

  @action
  void changeThemes() => themes = !themes;
}
