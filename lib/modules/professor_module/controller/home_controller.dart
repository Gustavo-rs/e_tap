import 'package:app/core/data/alunos_data.dart';
import 'package:app/core/data/faltas_data.dart';
import 'package:app/core/models/alunos_model.dart';
import 'package:app/core/models/falta_model.dart';

class HomeController {
  List<AlunosModel> alunos = alunos_data;

  List<FaltaModel> faltas = falta_data;
}
