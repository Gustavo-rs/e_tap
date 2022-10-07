import 'package:app/core/data/login_data.dart';
import 'package:app/core/models/login_model.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  List<LoginModel> login = login_data;

  @observable
  bool hiddenShowPass = true;

  @action
  void changeObscureText() => hiddenShowPass = !hiddenShowPass;

  bool loginCheck(String id, String senha) {
    for (var i = 0; i < login.length; i++) {
      if (login[i].id == int.parse(id) && login[i].senha == senha) {
        return true;
      }
    }
    return false;
  }

  int loginCargo(String id, String senha) {
    for (var i = 0; i < login.length; i++) {
      if (login[i].id == int.parse(id) && login[i].senha == senha) {
        return login[i].cargo;
      }
    }
    return 0;
  }

  void cadastro(int id, String senha, int cargo) {
    login.add(LoginModel(id: id, senha: senha, cargo: cargo));
  }
}
