import 'package:app/modules/professor_module/model/disciplinas_professor_model.dart';
import 'package:app/modules/professor_module/model/lista_alunos_materia_model.dart';

abstract class IProfessor {
  Future<List<DisciplinasProfessorModel>> getDisciplinasProfessor();

  Future<ListaAlunosMateria> getListaDeAlunosMateria(int id);

  Future<String> postChamada(int id_meet, List<int> chamada);

  Future<String> encerraChamada(int id_meet, List<int> chamada);

  Future<int> getIdMeet(int id);
}
