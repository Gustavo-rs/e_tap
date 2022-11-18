import 'package:app/core/components/app_snackbar.dart';
import 'package:app/core/service/global_impl.dart';
import 'package:app/core/util/shared_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'global_controller.g.dart';

class GlobalController = _GlobalController with _$GlobalController;

abstract class _GlobalController with Store {
  final shared = Modular.get<LocalStorageServiceImp>();
  final globalImpl = GlobalImpl();

  final email_controller = TextEditingController();
  final old_password_controller = TextEditingController();
  final new_password_controller = TextEditingController();

  @observable
  bool themes = true;

  @observable
  String email = '';

  @observable
  String nome = '';

  @observable
  String token = '';

  @observable
  bool isTrocaSenhaLoad = false;

  @observable
  bool hiddenShowPass = false;

  @observable
  bool hiddenShowPass1 = false;

  @action
  void changeObscureText1() => hiddenShowPass1 = !hiddenShowPass1;

  @action
  void changeObscureText() => hiddenShowPass = !hiddenShowPass;

  @action
  Future<void> emailInsert() async {
    final emailShared = await shared.read('email');
    email_controller.text = emailShared!;
  }

  @action
  Future<void> sharedEmailSenha() async {
    email = await shared.read('email') as String;
    nome = await shared.read('nome') as String;
  }

  @action
  void changeThemes() => themes = !themes;

  @action
  Future<void> trocarSenhaUser(BuildContext context) async {
    // email_controller.text = shared.read('email') as String;

    if (email_controller.text.isEmpty ||
        old_password_controller.text.isEmpty ||
        new_password_controller.text.isEmpty) {
      AppSnackbar.error(context, 'Preencha todos os campos');
    } else {
      isTrocaSenhaLoad = true;
      String resposta = await globalImpl.trocarSenha(email_controller.text,
          old_password_controller.text, new_password_controller.text);
      isTrocaSenhaLoad = false;
      if (resposta == 'success') {
        AppSnackbar.success(context, 'Senha alterada com sucesso!');
      } else {
        AppSnackbar.error(context, 'Não foi possível trocar sua senha!');
      }
    }
  }
}
