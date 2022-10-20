import 'package:app/core/components/app_snackbar.dart';
import 'package:app/core/util/shared_impl.dart';
import 'package:app/modules/login_module/model/login_model.dart';
import 'package:app/modules/login_module/service/login_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  TextEditingController email_controller = TextEditingController();

  final shared = Modular.get<LocalStorageServiceImp>();

  @observable
  TextEditingController senha_controller = TextEditingController();

  final loginImpl = LoginImpl();

  @observable
  var login_auth = LoginModel();

  @observable
  bool isLoading = false;

  @observable
  bool hiddenShowPass = true;

  @action
  void changeObscureText() => hiddenShowPass = !hiddenShowPass;

  @action
  Future<void> login(BuildContext context) async {
    isLoading = true;
    // email_controller.text = 'alunoteste@gmail.com';
    // senha_controller.text = '123456';
    final data =
        await loginImpl.login(email_controller.text, senha_controller.text);
    if (data.status != 'success') {
      isLoading = false;
      AppSnackbar.error(context, 'Senha ou email incorretos!');
    } else {
      login_auth = data;
      await shared.write('token', data.token!);
      await shared.write('email', email_controller.text);
      await shared.write('senha', senha_controller.text);
      await shared.write('nome', data.nome!);
      await shared.write('id', data.id.toString());
      isLoading = false;
      AppSnackbar.success(context, 'Login realizado com sucesso!');
      if (data.permission == 3) {
        Modular.to.navigate('/aluno_module/');
      } else {
        Modular.to.navigate('/professor_module/');
      }
    }
    isLoading = false;
  }
}
