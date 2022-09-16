import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class ProfessorPage extends StatefulWidget {
  const ProfessorPage({Key? key}) : super(key: key);

  @override
  State<ProfessorPage> createState() => _ProfessorPageState();
}

class _ProfessorPageState extends State<ProfessorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Modular.to.navigate('/login');
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Lottie.asset('assets/logo.json',
                    width: MediaQuery.of(context).size.width * 0.5),
                const SizedBox(
                  height: 22,
                ),
                const Text("Bem Vindo Professor"),
              ],
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 35, 7, 192),
                  ),
                  child: Card(
                    color: const Color.fromARGB(255, 35, 7, 192),
                    child: ListTile(
                      title: const Text(
                        'Histórico de presença',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Ver histórico de presença',
                          style: TextStyle(color: Colors.white)),
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.book_rounded, color: Colors.white),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          color: Colors.white),
                      onTap: () {
                        Modular.to.pushNamed('/professor_module/faults_page');
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 35, 7, 192),
                  ),
                  child: Card(
                    color: const Color.fromARGB(255, 35, 7, 192),
                    child: ListTile(
                      title: const Text(
                        'Minhas disciplinas',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Gerencie suas disciplinas',
                          style: TextStyle(color: Colors.white)),
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.wysiwyg, color: Colors.white),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          color: Colors.white),
                      onTap: () {},
                    ),
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
