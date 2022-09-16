import 'package:flutter/material.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações', style: TextStyle(color: Colors.grey[700])),
        backgroundColor: Colors.grey[200],
        elevation: 2,
        shadowColor: Colors.grey[100],
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: const Text('Cadastrar Disciplina'),
                subtitle: const Text('Cadastre uma nova disciplina'),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.bookmark_add_rounded),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
          ),
        ],
      )),
    );
  }
}
