import 'package:app/modules/login/model/login_model.dart';

abstract class ILoginService {
  Future<LoginModel> login(String email, String senha);
}
