import 'package:app/core/controller/global_controller.dart';
import 'package:app/modules/aluno_module/controller/aluno_controller.dart';
import 'package:app/modules/aluno_module/pages/data_horarios_aluno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DisciplinasAluno extends StatefulWidget {
  const DisciplinasAluno({Key? key}) : super(key: key);

  @override
  State<DisciplinasAluno> createState() => _DisciplinasAlunoState();
}

class _DisciplinasAlunoState extends State<DisciplinasAluno> {
  final alunoController = Modular.get<AlunoController>();
  final globalController = Modular.get<GlobalController>();

  List<String> disc = [
    'Projeto integrador',
    'Engenharia de software',
    'Banco de dados',
    'Programação web',
    'Programação mobile'
  ];

  List<String> porc = [
    '90%',
    '80%',
    '96%',
    '75%',
    '60%',
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          actions: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.circleUser,
                          color: globalController.themes
                              ? Color(0xFF303030)
                              : Colors.white,
                        ),
                      ),
                      Text("Usuário",
                          style: TextStyle(
                              color: globalController.themes
                                  ? Color(0xFF303030)
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      // Switch(
                      //     splashRadius: 30,
                      //     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      //     thumbColor: MaterialStateProperty.all(Colors.white),
                      //     activeTrackColor: Color(0xFF303030),
                      //     value: true,
                      //     onChanged: (value) {}),
                      InkWell(
                        splashColor: Colors.transparent,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.decelerate,
                          width: 40,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: globalController.themes
                                ? Color(0xFF303030)
                                : Colors.white,
                          ),
                          child: AnimatedAlign(
                            duration: const Duration(milliseconds: 300),
                            alignment: globalController.themes
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            curve: Curves.decelerate,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: globalController.themes
                                      ? Colors.white
                                      : Color(0xFF303030),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          globalController.changeThemes();
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),

                      IconButton(
                        onPressed: () {
                          Modular.to.navigate('/login');
                        },
                        icon: Icon(
                          Icons.exit_to_app,
                          color: globalController.themes
                              ? Color(0xFF303030)
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
                  child: Column(
                    children: [],
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
            Column(
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
                ListView.builder(
                    itemCount: disc.length,
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
                                        MediaQuery.of(context).size.height * .9,
                                    child: DataHorariosAluno(
                                      disciplina: disc[index],
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
                                title: Text(disc[index],
                                    style: TextStyle(
                                        color: globalController.themes
                                            ? Color(0xFF303030)
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                trailing: Text(porc[index],
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
                    }))
              ],
            )
          ]),
        ),
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width * 0.92,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  alunoController.changeSelectedPage(0);
                  Modular.to.navigate('/aluno_module/');
                },
                child: Container(
                  decoration: alunoController.isSelectedPage == 0
                      ? BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        )
                      : null,
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
                decoration: alunoController.isSelectedPage == 1
                    ? BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      )
                    : null,
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