import 'package:evertec_mobile_test/app/modules/bloc/app_bloc.dart';
import 'package:evertec_mobile_test/app/modules/home/bloc/home_bloc.dart';
import 'package:evertec_mobile_test/app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class InfoPanelWidget extends StatefulWidget {
  const InfoPanelWidget({super.key});

  @override
  State<InfoPanelWidget> createState() => _InfoPanelWidgetState();
}

class _InfoPanelWidgetState extends State<InfoPanelWidget> {
  final homeBloc = Modular.get<HomeBloc>();

  @override
  void initState() {
    homeBloc.add(Current());
    super.initState();
  }

  String dateParse(int paramDate) {
    String parsingDate = paramDate.toString();

    if (parsingDate.length < 8) {
      return '';
    }

    int year = int.parse(parsingDate.substring(0, 4));
    int month = int.parse(parsingDate.substring(4, 6));
    int day = int.parse(parsingDate.substring(6, 8));
    DateTime date = DateTime(year, month, day);

    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    late ThemeData theme = Theme.of(context);
    Size screenSize = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => homeBloc,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12)
            .copyWith(top: screenSize.height * .4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
              alignment: Alignment.centerLeft,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeSuccess) {
                    return Text(
                      'Fecha Recolección: ${dateParse(state.currentModel.date ?? 0)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.darkGray,
                        fontSize: 12,
                      ),
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return infoPanelData(theme, state.themeMode);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget infoPanelData(ThemeData theme, ThemeMode currentThemeMode) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          return Column(
            children: [
              infoPanelRow(
                children: [
                  infoPanelDataCard(
                    (state.currentModel.total ?? 0).toString(),
                    'Casos totales',
                    theme,
                    currentThemeMode,
                  ),
                  infoPanelDataCard(
                    (state.currentModel.totalTestResults ?? 0).toString(),
                    'Casos confirmados',
                    theme,
                    currentThemeMode,
                  ),
                ],
              ),
              infoPanelRow(
                children: [
                  infoPanelDataCard(
                    (state.currentModel.negative ?? 0).toString(),
                    'Probas negativas',
                    theme,
                    currentThemeMode,
                  ),
                  infoPanelDataCard(
                    (state.currentModel.positive ?? 0).toString(),
                    'Probas positivas',
                    theme,
                    currentThemeMode,
                  ),
                ],
              ),
              infoPanelRow(
                children: [
                  infoPanelDataCard(
                    (state.currentModel.death ?? 0).toString(),
                    'Falecidos',
                    theme,
                    currentThemeMode,
                  ),
                  infoPanelDataCard(
                    (state.currentModel.recovered ?? 0).toString(),
                    'Recuperados',
                    theme,
                    currentThemeMode,
                  ),
                ],
              ),
              infoPanelRow(
                children: [
                  infoPanelDataCard(
                    (state.currentModel.pending ?? 0).toString(),
                    'Pruebas pendentes',
                    theme,
                    currentThemeMode,
                  ),
                ],
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget infoPanelRow({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }

  Widget infoPanelDataCard(
      String data, String text, ThemeData theme, ThemeMode currentThemeMode) {
    return Container(
      padding: const EdgeInsets.all(14),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: currentThemeMode == ThemeMode.light
            ? Colors.white
            : AppColors.darkGray,
      ),
      child: Column(
        children: [
          Text(
            data,
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            text,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
