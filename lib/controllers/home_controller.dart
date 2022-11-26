import 'package:flutter/material.dart';

import '../constants/string_constants.dart';

class HomeController {
  //Controlador de texto
  final TextEditingController taskController = TextEditingController();

  //Chave do formulario
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // lista de tasks
  List<String> tasks = [];

  //validador
  String? validator(String value) {
    if (value.trim().isEmpty) {
      return StringConstants.hintText; //importado
    }

    return null;
  }

  //função do FloatingActionButton
  void addTask() {
    if (formKey.currentState!.validate()) {
      tasks.add(taskController.text);
      taskController.clear();
    }
  }
}
