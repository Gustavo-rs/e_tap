import 'package:app/modules/login_module/model/login_model.dart';

abstract class ILoginService {
  Future<LoginModel> login(String email, String senha);
}
