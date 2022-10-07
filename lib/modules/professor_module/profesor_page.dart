import 'package:app/core/controller/global_controller.dart';
import 'package:app/modules/professor_module/controller/professor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfessorPage extends StatefulWidget {
  const ProfessorPage({Key? key}) : super(key: key);

  @override
  State<ProfessorPage> createState() => _ProfessorPageState();
}

class _ProfessorPageState extends State<ProfessorPage> {
  final professorController = Modular.get<ProfessorController>();
  final globalController = Modular.get<GlobalController>();

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
                  bottomRight: Radius.circular(350),
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
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
              Container(
                decoration: professorController.isSelectedPage == 0
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
              Container(
                decoration: professorController.isSelectedPage == 1
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
