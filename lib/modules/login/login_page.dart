import 'package:app/core/components/app_text_form.dart';
import 'package:app/modules/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Modular.get<LoginController>();
    final id_controller = TextEditingController();
    final senha_controller = TextEditingController();

    id_controller.text = '3';
    senha_controller.text = '123';

    return Scaffold(
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
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(350),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("e-Tap",
                  style: TextStyle(
                    color: Color(0xFF477BFF),
                    fontSize: MediaQuery.of(context).size.width * 0.15,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppTextFormField(
                            controller: id_controller,
                            hintText: 'E-mail',
                            iconData: Icons.person_outline_outlined),
                        AppTextFormField(
                            obscureText: loginController.hiddenShowPass,
                            suffixIcon: IconButton(
                              onPressed: () {
                                loginController.changeObscureText();
                              },
                              icon: loginController.hiddenShowPass
                                  ? Icon(
                                      Icons.visibility,
                                      color: Colors.grey[700],
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey[700],
                                    ),
                            ),
                            controller: senha_controller,
                            hintText: 'Senha',
                            iconData: Icons.key_outlined),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF477BFF),
                              padding: const EdgeInsets.all(12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              bool variavel = loginController.loginCheck(
                                  id_controller.text, senha_controller.text);
                              if (variavel) {
                                int test = loginController.loginCargo(
                                    id_controller.text, senha_controller.text);
                                if (test == 1) {
                                  Modular.to.navigate('/professor_module');
                                } else {
                                  Modular.to.navigate('/aluno_module');
                                }
                              }
                            },
                            child: const Text('ENTRAR',
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
              ),
            ],
          )
        ]),
      ),
    );
  }
}
