import 'package:evertec_mobile_test/app/modules/bloc/app_bloc.dart';
import 'package:evertec_mobile_test/app/modules/home/components/device_info_widget.dart';
import 'package:evertec_mobile_test/app/modules/home/components/info_panel_widget.dart';
import 'package:evertec_mobile_test/app/modules/home/components/theme_changer_widget.dart';
import 'package:evertec_mobile_test/app/shared/components/covid_logo.dart';
import 'package:evertec_mobile_test/app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ThemeData theme = Theme.of(context);
  final appBloc = Modular.get<AppBloc>();

  void toggleTheme(ThemeMode themeMode) {
    appBloc.add(AppThemeChange(themeMode: themeMode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Modular.to.pushNamed('/details/');
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(14),
          backgroundColor: theme.primaryColor,
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              homeImage(),
              BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  return infoPanelBackground(state.themeMode);
                },
              ),
            ],
          ),
          customAppBar(),
          Stack(
            children: [
              const DeviceInfoWidget(),
              ThemeChangerWidget(
                lightModeAction: () {
                  toggleTheme(ThemeMode.light);
                },
                darkModeAction: () {
                  toggleTheme(ThemeMode.dark);
                },
              ),
            ],
          ),
          const InfoPanelWidget(),
        ],
      ),
    );
  }
}

Widget homeImage() {
  return Container(
    padding: const EdgeInsets.only(right: 50),
    alignment: Alignment.topRight,
    child: Image.asset(
      'assets/images/home-image.png',
      height: 300,
    ),
  );
}

Widget customAppBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 20, top: 16),
        child: CovidLogo(
          width: 100,
          height: 100,
          titleFontSize: 18,
          subTitleFontSize: 8,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
      GestureDetector(
        onTap: () {
          Modular.to.navigate('/login/');
        },
        child: const Padding(
          padding: EdgeInsets.only(top: 28, right: 28),
          child: Icon(
            Icons.logout,
            size: 32,
          ),
        ),
      ),
    ],
  );
}

Widget infoPanelBackground(ThemeMode currentThemeMode) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: currentThemeMode == ThemeMode.light
            ? Colors.grey.shade400
            : AppColors.lightGray,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5,
          ),
        ],
      ),
      width: double.maxFinite,
    ),
  );
}
