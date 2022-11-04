import 'package:app/core/components/app_text_form.dart';
import 'package:app/core/controller/global_controller.dart';
import 'package:app/core/util/shared_impl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

class TrocarSenhaPage extends StatefulWidget {
  const TrocarSenhaPage({Key? key}) : super(key: key);

  @override
  State<TrocarSenhaPage> createState() => _TrocarSenhaPageState();
}

class _TrocarSenhaPageState extends State<TrocarSenhaPage> {
  final globalController = Modular.get<GlobalController>();
  final shared = Modular.get<LocalStorageServiceImp>();

  @override
  void initState() {
    globalController.emailInsert();
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
                mainAxisAlignment: MainAxisAlignment.start,
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
                  bottomLeft: Radius.circular(350),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppTextFormField(
                                validator: Validatorless.multiple(
                                  [
                                    Validatorless.required('Email Obrigatório'),
                                  ],
                                ),
                                controller: globalController.email_controller,
                                hintText: 'E-mail',
                                iconData: Icons.person_outline_outlined),
                            AppTextFormField(
                                validator: Validatorless.multiple(
                                  [
                                    Validatorless.required('Senha Obrigatória'),
                                  ],
                                ),
                                controller:
                                    globalController.old_password_controller,
                                hintText: 'Senha atual',
                                iconData: Icons.lock_outline),
                            AppTextFormField(
                                validator: Validatorless.multiple(
                                  [
                                    Validatorless.required('Senha Obrigatória'),
                                  ],
                                ),
                                controller:
                                    globalController.new_password_controller,
                                hintText: 'Nova Senha',
                                iconData: Icons.lock),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF477BFF),
                                  padding: const EdgeInsets.all(12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  globalController.trocarSenhaUser(context);
                                },
                                child: Text('Trocar Senha',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
