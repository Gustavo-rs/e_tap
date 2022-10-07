import 'package:app/core/util/shared_impl.dart';
import 'package:app/modules/login/model/login_model.dart';
import 'package:app/modules/login/service/login_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  var email_controller = TextEditingController();

  final shared = Modular.get<LocalStorageServiceImp>();

  @observable
  var senha_controller = TextEditingController();

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
  Future<void> login() async {
    isLoading = true;
    final data = await loginImpl.login("alunoteste@gmail.com", "123456");
    login_auth = data;
    await shared.write('token', data.token!);
    isLoading = false;
  }
}
