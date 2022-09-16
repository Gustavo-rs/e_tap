import 'package:app/core/models/falta_model.dart';
import 'package:app/modules/aluno_module/controller/aluno_controller.dart';
import 'package:app/modules/aluno_module/model/record.dart';
import 'package:app/modules/professor_module/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';

class AlunoPage extends StatefulWidget {
  @override
  State<AlunoPage> createState() => _AlunoPageState();
}

class _AlunoPageState extends State<AlunoPage> {
  final alunoController = Modular.get<AlunoController>();
  final homeController = HomeController();

  Future<void> read() async {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      final NfcTag tag1;
      tag1 = tag;
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
              alunoController.setIsVisible(true);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('NFC não cadastrado!'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          });
      }

      NfcManager.instance.stopSession();
    }).catchError((e) => setState(() => print('$e')));
  }

  @override
  void dispose() {
    NfcManager.instance.stopSession().catchError((_) {/* no op */});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Modular.to.navigate('/login');
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Color(0xFF107AFF),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bem vindo, ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Gilberto!",
                      style: TextStyle(
                          color: Color(0xFF107AFF),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Lottie.asset('assets/logo.json',
                    width: MediaQuery.of(context).size.width * 0.4),
              ],
            ),
            Column(
              children: [
                Text("Para contabilizar sua presença,aproxime perto ao leitor!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await read();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content: Observer(
                          builder: (_) => alunoController.isVisible
                              ? SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
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
                                )
                              : Lottie.asset(
                                  'assets/nfc_phone.json',
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                ),
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () {
                                NfcManager.instance.stopSession();
                                Modular.to.pop();
                                alunoController.setIsVisible(false);
                              },
                              child: const Text('Voltar',
                                  style: TextStyle(
                                    color: Color(0xFF107AFF),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    );
                    homeController.faltas.add(FaltaModel(
                      nome: 'Gilberto Carvalho',
                      data: DateTime.now(),
                      qtd_faltas: 2,
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF107AFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text(
                    'Aproximar',
                  ),
                ),
              ],
            ),
          ],
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
