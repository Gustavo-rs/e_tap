import 'package:app/modules/aluno_module/model/data_horas_aluno_model.dart';
import 'package:app/modules/aluno_module/model/materias_aluno_model.dart';

abstract class IAlunoService {
  Future<List<DataHorasAlunoModel>> getDataHorasAluno(
      String disciplina, String id_aluno);

  Future<MateriaAlunoModel> getMaterias(String id_aluno);

  Future<void> callAluno();
}
