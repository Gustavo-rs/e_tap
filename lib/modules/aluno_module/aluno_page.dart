import 'package:app/core/components/app_snackbar.dart';
import 'package:app/core/controller/global_controller.dart';
import 'package:app/core/util/shared_impl.dart';
import 'package:app/modules/aluno_module/controller/aluno_controller.dart';
import 'package:app/modules/aluno_module/model/record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';

class AlunoPage extends StatefulWidget {
  @override
  State<AlunoPage> createState() => _AlunoPageState();
}

class _AlunoPageState extends State<AlunoPage> {
  final alunoController = Modular.get<AlunoController>();
  final globalController = Modular.get<GlobalController>();
  final shared = Modular.get<LocalStorageServiceImp>();

  Future<void> read() async {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      Object? tech;

      tech = Ndef.from(tag);
      if (tech is Ndef) {
        final cachedMessage = tech.cachedMessage;
        if (cachedMessage != null)
          Iterable.generate(cachedMessage.records.length).forEach((i) {
            final record = cachedMessage.records[i];
            final info = NdefRecordInfo.fromNdef(record);

            alunoController.setNdefWidgets(info.hash);
            if (alunoController.ndefWidgets == '12345') {
              alunoController.setStateFunc('success');
              Future.delayed(const Duration(seconds: 4), () {
                alunoController.setStateFunc('default');
              });
            } else {
              AppSnackbar.error(context, 'NFC não cadastrado!');
            }
          });
      }

      NfcManager.instance.stopSession();
    }).catchError((e) => setState(() => print('$e')));
  }

  @override
  void initState() {
    alunoController.setStateFunc('pause');
    super.initState();
  }

  @override
  void dispose() {
    NfcManager.instance.stopSession().catchError((_) {/* no op */});
    super.dispose();
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
                          Text("Usuário",
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
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () async {
                            await shared.delete('token');
                            await shared.delete('email');
                            await shared.delete('senha');
                            await shared.delete('nome');
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
            ),
          ],
          backgroundColor:
              globalController.themes ? Colors.white : Color(0xFF303030),
          elevation: 0,
        ),
        body: Observer(
          builder: (_) => Center(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .8,
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
                              if (alunoController.state == 'success')
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Lottie.asset(
                                          'assets/sa.json',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          repeat: true,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text('Presença contabilizada!'),
                                      ),
                                    ],
                                  ),
                                ),
                              if (alunoController.state == 'escanear')
                                Lottie.asset(
                                  'assets/nfc_phone.json',
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                ),
                              SizedBox(
                                height: 20,
                              ),
                              if (alunoController.state != 'escanear' &&
                                  alunoController.state != 'success')
                                GestureDetector(
                                  onTap: () async {
                                    alunoController.setStateFunc('escanear');
                                    await read();
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      color: Color(0xFF477BFF),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text("Tap",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                              if (alunoController.state == 'escanear')
                                IconButton(
                                  onPressed: () {
                                    NfcManager.instance.stopSession();
                                    alunoController.setStateFunc('pause');
                                  },
                                  icon: Icon(Icons.close),
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
        ),
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width * 0.92,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
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
              GestureDetector(
                onTap: () {
                  alunoController.changeSelectedPage(1);
                  Modular.to.navigate('/aluno_module/disciplinas_aluno');
                },
                child: Container(
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
