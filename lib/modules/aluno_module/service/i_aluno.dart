import 'package:app/modules/aluno_module/model/data_horas_aluno_model.dart';

abstract class IAlunoService {
  Future<List<DataHorasAlunoModel>> getDataHorasAluno(
      String email, String senha, String disciplina, int id_aluno);
}
