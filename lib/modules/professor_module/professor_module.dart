import 'package:app/modules/login_module/controller/login_controller.dart';
import 'package:app/modules/professor_module/controller/professor_controller.dart';
import 'package:app/modules/professor_module/pages/atalho_pages.dart';
import 'package:app/modules/professor_module/pages/disciplinas_professor_page.dart';
import 'package:app/modules/professor_module/profesor_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfessorModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => LoginController()),
        Bind.lazySingleton((i) => ProfessorController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => ProfessorPage(),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 800),
        ),
        ChildRoute(
          '/atalho',
          child: (_, args) => AtalhoPages(),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 800),
        ),
        ChildRoute(
          '/disciplinas_professor',
          child: (_, args) => DisciplinasProfessorPage(),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 800),
        ),
      ];
}
