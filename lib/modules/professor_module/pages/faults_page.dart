import 'package:app/modules/professor_module/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FaultsPage extends StatelessWidget {
  const FaultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = HomeController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[700],
          ),
          onPressed: () {
            Modular.to.pop();
          },
        ),
        title: Text('Histórico', style: TextStyle(color: Colors.grey[700])),
        backgroundColor: Colors.grey[200],
        elevation: 2,
        shadowColor: Colors.grey[100],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: homeController.faltas.length,
          itemBuilder: ((context, index) => ListTile(
                title: Text(homeController.faltas[index].nome),
                subtitle: Text(homeController.faltas[index].data
                    .toString()
                    .substring(0, 10)),
                trailing: Text('Faltas: ' +
                    homeController.faltas[index].qtd_faltas.toString()),
              )),
        ),
      ),
    );
  }
}
