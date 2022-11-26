import 'package:flutter/material.dart';
import 'package:xande_todo/designer.dart';

void main() => runApp(const MyApp());

// MaterialApp tem varios wigets
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: TextInfo.title, //importado
      home: MyHome(),
      debugShowCheckedModeBanner: Desiger.debugShow, //importado
    );
  }
}

// Criando a Classe MyHome que foi transformado em widget.
class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

// Criando um estado p/ o widget myhome.
class MyHomeState extends State<MyHome> {
  final TextEditingController taskController =
      TextEditingController(); //Controlador de texto
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(); //Chave do formulario
  List<String> tasks = []; //Lista de tarefas
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Desiger.backgroundColor, //importado
        title: const Text(TextInfo.title), //importado
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
                bottom: FontSizes.buttonMargin), //importado
            child: Form(
              key: formKey,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: taskController,
                      style: const TextStyle(
                        fontSize: FontSizes.title, //importado
                        color: Desiger.childColor, //importado
                      ),
                      decoration: const InputDecoration(
                        hintText: TextInfo.hintText, //importado
                        hintStyle: TextStyle(
                          fontSize: FontSizes.title, //importado
                        ),
                      ),
                      keyboardType: TextInputType.text, //campo de texto
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return TextInfo.hintText; //importado
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                          left: FontSizes.buttonMargin), //
                      child: FloatingActionButton(
                        backgroundColor: Desiger.backgroundColor, //importado
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              tasks.add(taskController.text);
                            });
                            taskController.clear();
                          }
                        },
                        child: const Icon(
                          Icons.add,
                          color: Desiger.childColor, //importado
                        ),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                title: Text(tasks[index]),
              ));
            },
          ))
        ],
      ),
    );
  }
}
