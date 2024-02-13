import 'package:evertec_mobile_test/app/app_module.dart';
import 'package:evertec_mobile_test/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
