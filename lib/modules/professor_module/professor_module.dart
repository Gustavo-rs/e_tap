import 'package:app/modules/login/controller/login_controller.dart';
import 'package:app/modules/professor_module/controller/professor_controller.dart';
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
          child: (_, args) => const ProfessorPage(),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 800),
        ),
      ];
}
