import 'package:app/modules/professor_module/pages/configuracoes_page.dart';
import 'package:app/modules/professor_module/pages/perfil_page.dart';
import 'package:app/modules/professor_module/profesor_page.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _indiceAtual = 1;
  final List<Widget> _telas = [
    const ProfilePage(),
    const ProfessorPage(),
    const ConfigPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _telas[_indiceAtual],
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        child: ClipRRect(
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 0,
            currentIndex: _indiceAtual,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey[600],
            onTap: onTabTapped,
            items: [
              BottomNavigationBarItem(
                  label: 'Perfil',
                  icon: Icon(
                    Icons.person,
                    color: _indiceAtual == 0 ? Colors.blue : Colors.grey[600],
                  )),
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    Icons.home_outlined,
                    color: _indiceAtual == 1 ? Colors.blue : Colors.grey[600],
                  )),
              BottomNavigationBarItem(
                  label: 'Configurações',
                  icon: Icon(
                    Icons.settings,
                    color: _indiceAtual == 2 ? Colors.blue : Colors.grey[600],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
