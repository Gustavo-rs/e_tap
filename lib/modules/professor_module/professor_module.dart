import 'package:app/modules/login/login_controller.dart';
import 'package:app/modules/professor_module/pages/bottom_navigation.dart';
import 'package:app/modules/professor_module/pages/faults_page.dart';
import 'package:app/modules/professor_module/profesor_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfessorModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => LoginController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const BottomNavigation(),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 800),
        ),
        ChildRoute(
          '/professor_page',
          child: (_, args) => const ProfessorPage(),
        ),
        ChildRoute(
          '/faults_page',
          child: (_, args) => const FaultsPage(),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 800),
        ),
      ];
}
