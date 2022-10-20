import 'package:app/modules/professor_module/model/disciplinas_professor_model.dart';

abstract class IProfessor {
  Future<List<DisciplinasProfessorModel>> getDisciplinasProfessor();
}
