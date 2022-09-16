import 'package:app/modules/aluno_module/aluno_module.dart';
import 'package:app/modules/login/login_module.dart';
import 'package:app/modules/professor_module/professor_module.dart';
import 'package:app/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/aluno_module', module: AlunoModule()),
        ChildRoute('/', child: (_, args) => const SplashPage()),
        ModuleRoute('/professor_module', module: ProfessorModule()),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/aluno_module', module: AlunoModule()),
      ];
}
