import 'package:app/core/controller/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AtalhoPages extends StatefulWidget {
  const AtalhoPages({Key? key}) : super(key: key);

  @override
  State<AtalhoPages> createState() => _AtalhoPagesState();
}

class _AtalhoPagesState extends State<AtalhoPages> {
  final globalController = Modular.get<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          actions: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Modular.to.pushNamed('/perfil_page');
                      },
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.circleUser,
                            color: globalController.themes
                                ? Color(0xFF303030)
                                : Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text("${globalController.nome.split(' ')[0]}",
                              style: TextStyle(
                                  color: globalController.themes
                                      ? Color(0xFF303030)
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
          backgroundColor:
              globalController.themes ? Colors.white : Color(0xFF303030),
          elevation: 0,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: MediaQuery.of(context).size.height * 0.8,
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color:
                    globalController.themes ? Colors.white : Color(0xFF303030),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(350),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Observer(
                builder: (_) => Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 0,
                          color: globalController.themes
                              ? Colors.grey[100]
                              : Colors.black12.withOpacity(0.1),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text('Minhas Disciplinas',
                                  style: TextStyle(
                                      color: globalController.themes
                                          ? Color(0xFF303030)
                                          : Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              trailing: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: globalController.themes
                                    ? Color(0xFF303030)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width * 0.92,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Modular.to.navigate('/professor_module');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.list_alt,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
