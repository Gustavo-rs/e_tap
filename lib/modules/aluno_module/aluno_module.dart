import 'package:app/modules/aluno_module/aluno_page.dart';
import 'package:app/modules/aluno_module/controller/aluno_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AlunoModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => AlunoController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => AlunoPage(),
        ),
      ];
}
