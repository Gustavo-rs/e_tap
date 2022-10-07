import 'package:app/core/components/app_text_form.dart';
import 'package:app/modules/professor_module/controller/professor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterDisciplinePage extends StatefulWidget {
  RegisterDisciplinePage({Key? key}) : super(key: key);

  @override
  State<RegisterDisciplinePage> createState() => _RegisterDisciplinePageState();
}

class _RegisterDisciplinePageState extends State<RegisterDisciplinePage> {
  final profController = Modular.get<ProfessorController>();

  List<int> countCall = [];
  List<int> call = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Modular.to.pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Text(
            'Cadastrar Disciplina',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF107AFF),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          AppTextFormField(
            controller: profController.nomeDisciplina,
            hintText: 'Nome da Disciplina',
            iconData: Icons.book_rounded,
          ),
          SizedBox(
            height: 20,
          ),
          AppTextFormField(
            controller: profController.totalEncontros,
            hintText: 'Total de Encontros',
            iconData: Icons.people_sharp,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Chamadas por dia:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF107AFF),
                          )),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Quantidade:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[700],
                          )),
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: call.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Text(
                                  '${call[index]}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF107AFF),
                                  ),
                                ),
                                Checkbox(
                                  activeColor: Color(0xFF107AFF),
                                  value: countCall.contains(index),
                                  onChanged: (value) {
                                    setState(() {});
                                    if (countCall.contains(index)) {
                                      countCall.remove(index);
                                    } else {
                                      countCall.clear();
                                      countCall.add(index);
                                    }
                                    print(countCall);
                                  },
                                ),
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF107AFF),
                padding: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Text('Cadastrar'),
            ),
          ),
        ],
      ),
    );
  }
}
