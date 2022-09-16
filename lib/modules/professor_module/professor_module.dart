import 'package:app/modules/professor_module/pages/bottom_navigation.dart';
import 'package:app/modules/professor_module/pages/faults_page.dart';
import 'package:app/modules/professor_module/profesor_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfessorModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const BottomNavigation(),
        ),
        ChildRoute(
          '/professor_page',
          child: (_, args) => const ProfessorPage(),
        ),
        ChildRoute(
          '/faults_page',
          child: (_, args) => const FaultsPage(),
        ),
      ];
}
