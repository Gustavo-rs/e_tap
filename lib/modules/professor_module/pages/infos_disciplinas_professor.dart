import 'package:app/core/controller/global_controller.dart';
import 'package:app/modules/professor_module/controller/professor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InfosDisciplinasProfessor extends StatefulWidget {
  final String nome_disciplina;
  final int id_disciplina;
  const InfosDisciplinasProfessor(
      {Key? key, required this.nome_disciplina, required this.id_disciplina})
      : super(
          key: key,
        );

  @override
  State<InfosDisciplinasProfessor> createState() =>
      _InfosDisciplinasProfessorState();
}

class _InfosDisciplinasProfessorState extends State<InfosDisciplinasProfessor> {
  final professorController = Modular.get<ProfessorController>();
  final globalController = Modular.get<GlobalController>();

  @override
  void initState() {
    professorController.setListaAlunosMateria(widget.id_disciplina);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Modular.to.pop();
                    },
                    icon: Icon(
                      Icons.close,
                      color: globalController.themes
                          ? Color(0xFF303030)
                          : Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                '${widget.nome_disciplina}',
                style: TextStyle(
                    color: globalController.themes
                        ? Color(0xFF303030)
                        : Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontWeight: FontWeight.bold),
              ),
              if (!professorController.isVazio)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Lista de alunos:',
                        style: TextStyle(
                            color: globalController.themes
                                ? Color(0xFF303030)
                                : Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              professorController.isLoad
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: globalController.themes
                              ? Color(0xFF303030)
                              : Colors.white,
                        ),
                      ),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Observer(
                        builder: (_) => SingleChildScrollView(
                          child: Column(
                            children: [
                              if (professorController.isVazio)
                                Center(
                                  child: Text("Nenhum aluno encontrado!",
                                      style: TextStyle(
                                          color: globalController.themes
                                              ? Color(0xFF303030)
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ),
                              if (professorController.isVazio == false)
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.8,
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      controller: ScrollController(),
                                      shrinkWrap: true,
                                      itemCount: professorController
                                          .listAlunosMateria.students!.length,
                                      itemBuilder: ((context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.085,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: globalController.themes
                                                  ? Colors.grey[200]
                                                  : Color(0xFF292929),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: globalController.themes
                                                    ? Colors.grey[200]
                                                    : Color(0xFF292929),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: SingleChildScrollView(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                child: ListTile(
                                                  title: Text(
                                                    "${professorController.listAlunosMateria.students![index].fullName}",
                                                    style: TextStyle(
                                                        color: globalController
                                                                .themes
                                                            ? Color(0xFF303030)
                                                            : Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  subtitle: Text(
                                                    "${professorController.listAlunosMateria.students![index].email}",
                                                    style: TextStyle(
                                                        color: globalController
                                                                .themes
                                                            ? Color(0xFF303030)
                                                            : Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      })),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          )),
    );
  }
}
