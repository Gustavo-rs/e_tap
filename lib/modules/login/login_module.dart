import 'package:app/core/util/shared_impl.dart';
import 'package:app/modules/login/controller/login_controller.dart';
import 'package:app/modules/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => LoginController()),
        Bind.lazySingleton((i) => LocalStorageServiceImp()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const LoginPage(),
        ),
      ];
}
