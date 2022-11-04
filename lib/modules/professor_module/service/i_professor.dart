import 'package:app/modules/professor_module/model/disciplinas_professor_model.dart';
import 'package:app/modules/professor_module/model/lista_alunos_materia_model.dart';

abstract class IProfessor {
  Future<List<DisciplinasProfessorModel>> getDisciplinasProfessor();

  Future<ListaAlunosMateria> getListaDeAlunosMateria(int id);
}
