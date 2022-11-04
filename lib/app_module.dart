import 'package:app/core/pages/perfil_page.dart';
import 'package:app/core/controller/global_controller.dart';
import 'package:app/core/pages/trocar_senha_page.dart';
import 'package:app/core/util/shared_impl.dart';
import 'package:app/modules/aluno_module/aluno_module.dart';
import 'package:app/modules/aluno_module/controller/aluno_controller.dart';
import 'package:app/modules/login_module/login_module.dart';
import 'package:app/modules/professor_module/professor_module.dart';
import 'package:app/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => AlunoController()),
        Bind.lazySingleton((i) => GlobalController()),
        Bind.lazySingleton((i) => LocalStorageServiceImp()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/perfil_page',
            child: (_, args) => const PerfilPage(),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 800)),
        ChildRoute('/trocar_senha',
            child: (_, args) => const TrocarSenhaPage(),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 800)),
        ChildRoute('/', child: (_, args) => const SplashPage()),
        ModuleRoute('/professor_module', module: ProfessorModule()),
        ModuleRoute('/login_module/',
            module: LoginModule(),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 800)),
        ModuleRoute('/aluno_module/', module: AlunoModule()),
      ];
}
