import 'package:evertec_mobile_test/app/modules/bloc/app_bloc.dart';
import 'package:evertec_mobile_test/app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoPanelWidget extends StatelessWidget {
  const InfoPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    late ThemeData theme = Theme.of(context);
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12)
          .copyWith(top: screenSize.height * .4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
            alignment: Alignment.centerLeft,
            child: Text(
              'Data de atualização: 20/10/2021',
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.darkGray,
                fontSize: 12,
              ),
            ),
          ),
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return infoPanelData(theme, state.themeMode);
            },
          ),
        ],
      ),
    );
  }

  Widget infoPanelData(ThemeData theme, ThemeMode currentThemeMode) {
    return Column(
      children: [
        infoPanelRow(
          children: [
            infoPanelDataCard(
                '102.318.299', 'Casos totales', theme, currentThemeMode),
            infoPanelDataCard(
                '13.218.299', 'Casos confirmados', theme, currentThemeMode),
          ],
        ),
        infoPanelRow(
          children: [
            infoPanelDataCard(
                '102.318.299', 'Probas negativas', theme, currentThemeMode),
            infoPanelDataCard(
                '13.218.299', 'Probas positivas', theme, currentThemeMode),
          ],
        ),
        infoPanelRow(
          children: [
            infoPanelDataCard(
                '102.318.299', 'Falecidos', theme, currentThemeMode),
            infoPanelDataCard(
                '13.218.299', 'Recuperados', theme, currentThemeMode),
          ],
        ),
        infoPanelRow(
          children: [
            infoPanelDataCard(
                '102.318.299', 'Pruebas pendentes', theme, currentThemeMode),
          ],
        ),
      ],
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
