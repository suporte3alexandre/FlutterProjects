import 'package:flutter/material.dart';
import 'package:xande_todo/constants/design_constants.dart';
import 'package:xande_todo/constants/string_constants.dart';
import 'package:xande_todo/controllers/home_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController _homeController = HomeController();

  //Lista de tarefas
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DesignConstants.backgroundColor, //importado
        title: const Text(
          StringConstants.title,
        ), //importado
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(
              DesignConstants.allPadding,
            ), //importado
            child: Form(
              key: _homeController.formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _homeController.taskController,
                      style: const TextStyle(
                        fontSize: DesignConstants.title, //importado
                        color: DesignConstants.childColor, //importado
                      ),
                      decoration: const InputDecoration(
                        hintText: StringConstants.hintText, //importado
                        hintStyle: TextStyle(
                          fontSize: DesignConstants.title, //importado
                        ),
                      ),
                      keyboardType: TextInputType.text, //campo de texto
                      validator: (value) => _homeController.validator(value!),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: DesignConstants.allPadding,
                    ), //
                    child: FloatingActionButton(
                      backgroundColor:
                          DesignConstants.backgroundColor, //importado
                      onPressed: () {
                        setState(() {
                          _homeController.addTask();
                        });
                      },
                      child: const Icon(
                        Icons.add,
                        color: DesignConstants.childColor, //importado
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _homeController.tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      _homeController.tasks[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
