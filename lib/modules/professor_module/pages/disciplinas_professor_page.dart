import 'package:app/core/controller/global_controller.dart';
import 'package:app/modules/professor_module/controller/professor_controller.dart';
import 'package:app/modules/professor_module/pages/infos_disciplinas_professor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DisciplinasProfessorPage extends StatefulWidget {
  const DisciplinasProfessorPage({Key? key}) : super(key: key);

  @override
  State<DisciplinasProfessorPage> createState() =>
      _DisciplinasProfessorPageState();
}

class _DisciplinasProfessorPageState extends State<DisciplinasProfessorPage> {
  final globalController = Modular.get<GlobalController>();
  final professorController = Modular.get<ProfessorController>();

  @override
  void initState() {
    professorController.setDisciplinasProfessor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          actions: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Modular.to.pushNamed('/perfil_page');
                      },
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.circleUser,
                            color: globalController.themes
                                ? Color(0xFF303030)
                                : Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text("${globalController.nome.split(' ')[0]}",
                              style: TextStyle(
                                  color: globalController.themes
                                      ? Color(0xFF303030)
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
          backgroundColor:
              globalController.themes ? Colors.white : Color(0xFF303030),
          elevation: 0,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topLeft,
                      colors: [
                        Color(0xFF54F5CF),
                        Color.fromARGB(255, 74, 121, 240),
                        Color(0xFF477BFF),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color:
                    globalController.themes ? Colors.white : Color(0xFF303030),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(350),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Observer(
                builder: (_) => Column(
                  children: [
                    Center(
                      child: Text("Disciplinas",
                          style: TextStyle(
                              color: globalController.themes
                                  ? Color(0xFF303030)
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),
                    ),
                    if (professorController.isMateriaLoad)
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: globalController.themes
                                ? Color(0xFF303030)
                                : Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                    if (professorController.isVazio &&
                        !professorController.isMateriaLoad)
                      Center(
                        child: Text("Nenhuma disciplina encontrada!",
                            style: TextStyle(
                                color: globalController.themes
                                    ? Color(0xFF303030)
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                    if (!professorController.isMateriaLoad)
                      ListView.builder(
                        itemCount: professorController.discProfessor.length,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  enableDrag: false,
                                  backgroundColor: globalController.themes
                                      ? Colors.white
                                      : Color(0xFF303030),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  isDismissible: false,
                                  isScrollControlled: true,
                                  builder: (context) => SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .9,
                                        child: InfosDisciplinasProfessor(
                                          nome_disciplina: professorController
                                              .discProfessor[index]
                                              .subjectName!,
                                        ),
                                      ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 20),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 0,
                                color: globalController.themes
                                    ? Colors.grey[100]
                                    : Colors.black12.withOpacity(0.1),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    title: Text(
                                        "${professorController.discProfessor[index].subjectName}",
                                        style: TextStyle(
                                            color: globalController.themes
                                                ? Color(0xFF303030)
                                                : Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    trailing: Text(
                                        "Tag: ${professorController.discProfessor[index].tagId}",
                                        style: TextStyle(
                                            color: globalController.themes
                                                ? Color(0xFF303030)
                                                : Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                  ],
                ),
              ),
            ),
          ]),
        ),
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width * 0.92,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // alunoController.changeSelectedPage(0);
                  Modular.to.navigate('/professor_module/');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.list_alt,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
