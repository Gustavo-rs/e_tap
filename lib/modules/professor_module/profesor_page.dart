import 'package:app/core/controller/global_controller.dart';
import 'package:app/modules/aluno_module/model/record.dart';
import 'package:app/modules/professor_module/controller/professor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nfc_manager/nfc_manager.dart';

class ProfessorPage extends StatefulWidget {
  @override
  State<ProfessorPage> createState() => _ProfessorPageState();
}

class _ProfessorPageState extends State<ProfessorPage> {
  final professorController = Modular.get<ProfessorController>();
  final globalController = Modular.get<GlobalController>();

  @override
  void initState() {
    globalController.sharedEmailSenha();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        backgroundColor:
            globalController.themes ? Colors.white : Color(0xFF303030),
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          backgroundColor:
              globalController.themes ? Colors.white : Color(0xFF303030),
          elevation: 0,
        ),
        body: Observer(
          builder: (_) => Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .75,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(200),
                            topRight: Radius.circular(200),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xFF477BFF),
                              Color.fromARGB(255, 74, 121, 240),
                              Color.fromARGB(213, 84, 245, 207),
                              Color(0xFF54F5CF),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                width: MediaQuery.of(context).size.width * 0.75,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: Color(0xFF477BFF),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    "Iniciar Chamada",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                .085,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width * 0.92,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
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
              GestureDetector(
                onTap: () {
                  Modular.to
                      .navigate('/professor_module/disciplinas_professor');
                },
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

class NdefRecordInfo {
  const NdefRecordInfo({required this.record, required this.hash});

  final Record record;

  final String hash;

  static NdefRecordInfo fromNdef(NdefRecord record) {
    final _record = Record.fromNdef(record);
    if (_record is WellknownTextRecord)
      return NdefRecordInfo(
        record: _record,
        hash: '${_record.text}',
      );

    throw UnimplementedError();
  }
}
