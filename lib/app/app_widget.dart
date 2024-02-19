import 'package:evertec_mobile_test/app/modules/bloc/app_bloc.dart';
import 'package:evertec_mobile_test/app/shared/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final AppBloc appBloc = Modular.get<AppBloc>();
  ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appBloc,
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Evertec Mobile Test',
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: state.themeMode,
            routerConfig: Modular.routerConfig,
            builder: (context, child) {
              return Material(child: child ?? Container());
            },
          );
        },
      ),
    );
  }
}
