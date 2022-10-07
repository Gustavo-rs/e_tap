import 'package:app/core/pages/perfil_page.dart';
import 'package:app/core/controller/global_controller.dart';
import 'package:app/modules/aluno_module/aluno_module.dart';
import 'package:app/modules/aluno_module/controller/aluno_controller.dart';
import 'package:app/modules/login/login_module.dart';
import 'package:app/modules/professor_module/professor_module.dart';
import 'package:app/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => AlunoController()),
        Bind.lazySingleton((i) => GlobalController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/perfil_page', child: (_, args) => const PerfilPage()),
        ChildRoute('/', child: (_, args) => const SplashPage()),
        ModuleRoute('/professor_module', module: ProfessorModule()),
        ModuleRoute('/login',
            module: LoginModule(),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 800)),
        ModuleRoute('/aluno_module', module: AlunoModule()),
      ];
}
