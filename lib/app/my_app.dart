import 'package:flutter/material.dart';
import 'package:xande_todo/constants/design_constants.dart';
import 'package:xande_todo/constants/string_constants.dart';

import '../views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: StringConstants.title, //importado
      home: Home(),
      debugShowCheckedModeBanner: DesignConstants.debugShow, //importado
    );
  }
}
