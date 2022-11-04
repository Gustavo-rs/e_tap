import 'package:app/core/controller/global_controller.dart';
import 'package:app/core/util/shared_impl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final globalController = Modular.get<GlobalController>();
  final shared = Modular.get<LocalStorageServiceImp>();

  @override
  void initState() {
    globalController.sharedEmailSenha();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor:
              globalController.themes ? Colors.white : Color(0xFF303030),
          actions: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: globalController.themes
                          ? Color(0xFF303030)
                          : Colors.white,
                    ),
                    onPressed: () {
                      Modular.to.pop();
                    },
                  ),
                  IconButton(
                    onPressed: () async {
                      await shared.delete('token');
                      await shared.delete('email');
                      await shared.delete('senha');
                      await shared.delete('nome');
                      await shared.delete('id');
                      Modular.to.navigate('/login_module/');
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
            )
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height,
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
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color:
                    globalController.themes ? Colors.white : Color(0xFF303030),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(350),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                AssetImage('assets/images/perfil.jpg'),
                          ),
                          Column(
                            children: [
                              Text(
                                globalController.nome,
                                style: TextStyle(
                                    color: globalController.themes
                                        ? Color(0xFF303030)
                                        : Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                globalController.email,
                                style: TextStyle(
                                    color: globalController.themes
                                        ? Color(0xFF303030)
                                        : Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Modular.to.pushNamed('/trocar_senha');
                    },
                    child: Text('Trocar senha?',
                        style: TextStyle(
                            color: globalController.themes
                                ? Color(0xFF303030)
                                : Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
