import 'package:app/core/components/app_text_form.dart';
import 'package:app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Modular.get<LoginController>();
    final id_controller = TextEditingController();
    final senha_controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SingleChildScrollView(
        child: Observer(
          builder: (_) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/logo.json',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              const SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppTextFormField(
                    controller: id_controller,
                    hintText: 'ID',
                    iconData: Icons.person_outline_outlined),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppTextFormField(
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
              ),
              const SizedBox(
                height: 22,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF107AFF),
                    padding: const EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
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
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
