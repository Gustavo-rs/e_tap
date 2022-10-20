import 'package:app/core/controller/global_controller.dart';
import 'package:app/modules/aluno_module/controller/aluno_controller.dart';
import 'package:app/modules/professor_module/controller/professor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InfosDisciplinasProfessor extends StatefulWidget {
  final String nome_disciplina;
  const InfosDisciplinasProfessor({
    Key? key,
    required this.nome_disciplina,
  }) : super(
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
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: Colors.transparent,
        body: professorController.isLoad
            ? Center(
                child: CircularProgressIndicator(
                  color: globalController.themes
                      ? Color(0xFF303030)
                      : Colors.white,
                ),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
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
                    alunoController.isHorasVazio
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: Center(
                              child: Text("Nenhuma chamada cadastrada!",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: globalController.themes
                                        ? Color(0xFF303030)
                                        : Colors.white,
                                  )),
                            ),
                          )
                        : Column(
                            children: [
                              Text(
                                '${widget.nome_disciplina}',
                                style: TextStyle(
                                    color: globalController.themes
                                        ? Color(0xFF303030)
                                        : Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.07,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    controller: ScrollController(),
                                    shrinkWrap: true,
                                    itemCount: alunoController
                                        .dataHorasAluno.dates!.length,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.14,
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 12),
                                                    child: Text(
                                                      "${alunoController.dataHorasAluno.dates![index].day}",
                                                      style: TextStyle(
                                                          color: globalController
                                                                  .themes
                                                              ? Color(
                                                                  0xFF303030)
                                                              : Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 12),
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.1,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                      child: ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          shrinkWrap: true,
                                                          itemCount: alunoController
                                                              .dataHorasAluno
                                                              .dates![index]
                                                              .callSequence![alunoController
                                                                      .dataHorasAluno
                                                                      .dates![
                                                                          index]
                                                                      .callSequence!
                                                                      .length -
                                                                  1]
                                                              .sequence,
                                                          itemBuilder:
                                                              ((context, i) {
                                                            return Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                              child: Center(
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.06,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.15,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF79F564),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      "${alunoController.dataHorasAluno.dates![index].callSequence![i].callTime!.substring(0, 5)}",
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xFF303030),
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              14),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          })),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    })),
                              )
                            ],
                          ),
                  ],
                ),
              ),
      ),
    );
  }
}
