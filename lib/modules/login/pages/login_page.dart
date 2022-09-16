import 'package:app/core/components/app_text_form.dart';
import 'package:app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = LoginController();
    final id_controller = TextEditingController();
    final senha_controller = TextEditingController();
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: const Color.fromARGB(255, 35, 7, 192),
              child: Lottie.asset(
                'assets/logo.json',
                width: MediaQuery.of(context).size.width * 0.3,
              ),
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
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility,
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
                  primary: const Color.fromARGB(255, 35, 7, 192),
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
      )),
    );
  }
}
