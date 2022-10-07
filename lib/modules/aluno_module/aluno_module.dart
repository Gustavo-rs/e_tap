import 'package:app/core/util/shared_impl.dart';
import 'package:app/modules/aluno_module/aluno_page.dart';
import 'package:app/modules/aluno_module/controller/aluno_controller.dart';
import 'package:app/modules/aluno_module/pages/disciplinas_aluno.dart';
import 'package:app/modules/login/controller/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AlunoModule extends Module {
  final alunoController = Modular.get<AlunoController>();

  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => AlunoController()),
        Bind.lazySingleton((i) => LoginController()),
        Bind.lazySingleton((i) => LocalStorageServiceImp()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => AlunoPage(),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 800),
        ),
        ChildRoute(
          '/disciplinas_aluno',
          child: (_, args) => DisciplinasAluno(),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 800),
        ),
      ];
}
