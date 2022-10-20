import 'package:app/core/components/app_text_form.dart';
import 'package:app/modules/login_module/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Modular.get<LoginController>();
    loginController.email_controller.text = 'professorteste@gmail.com';
    loginController.senha_controller.text = 'senhateste';

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
                    fontSize: MediaQuery.of(context).size.width * 0.18,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 60,
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
                    child: Observer(
                      builder: (_) => Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppTextFormField(
                              controller: loginController.email_controller,
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
                              controller: loginController.senha_controller,
                              hintText: 'Senha',
                              iconData: Icons.key_outlined),
                          Observer(
                            builder: (_) => loginController.isLoading
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 4,
                                  )
                                : Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF477BFF),
                                        padding: const EdgeInsets.all(12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: () {
                                        loginController.login(context);
                                      },
                                      child: Text('ENTRAR',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          )),
                                    ),
                                  ),
                          ),
                        ],
                      ),
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
