import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:evertec_mobile_test/app/modules/bloc/app_bloc.dart';
import 'package:evertec_mobile_test/app/modules/home/classes/device_info.dart';
import 'package:evertec_mobile_test/app/shared/utils/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DeviceInfoWidget extends StatefulWidget {
  const DeviceInfoWidget({super.key});

  @override
  State<DeviceInfoWidget> createState() => _DeviceInfoWidgetState();
}

class _DeviceInfoWidgetState extends State<DeviceInfoWidget> {
  String formattedDate = '';

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  DeviceInfo _deviceInfo = DeviceInfo();

  @override
  void initState() {
    refreshTime();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initPlatformState();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12)
              .copyWith(top: screenSize.height * .25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: state.themeMode == ThemeMode.dark
                ? AppColors.darkGray
                : Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5,
              ),
            ],
          ),
          height: 170,
          child: Stack(
            children: [
              deviceInfoData(_deviceInfo),
            ],
          ),
        );
      },
    );
  }

  Future<void> initPlatformState() async {
    DeviceInfo deviceInfo = DeviceInfo();

    try {
      if (defaultTargetPlatform == TargetPlatform.android) {
        deviceInfo = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else {
        deviceInfo = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } catch (e) {}

    if (!mounted) return;

    setState(() {
      _deviceInfo = deviceInfo;
    });
  }

  DeviceInfo _readAndroidBuildData(AndroidDeviceInfo build) {
    return DeviceInfo(
      name: build.device,
      brand: build.brand,
      model: build.model,
      operationSystem: build.version.baseOS,
      type: build.type,
    );
  }

  DeviceInfo _readIosDeviceInfo(IosDeviceInfo data) {
    return DeviceInfo(
      name: data.name,
      brand: 'Apple',
      model: data.utsname.machine,
      operationSystem: data.systemName,
      type: data.isPhysicalDevice ? 'Físico' : 'Simulado',
    );
  }

  void refreshTime() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        formattedDate = DateFormat.jms().format(DateTime.now());
      });
    });
  }

  Widget deviceInfoData(DeviceInfo deviceData) {
    return Column(
      children: [
        deviceInfoRow(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedDate,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
                const Text(
                  'Fecha actual',
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
            deviceInfoDataCard('Nome del dispositivo', deviceData.name ?? ''),
          ],
        ),
        deviceInfoRow(
          children: [
            deviceInfoDataCard('Marca del dispositivo', deviceData.brand ?? ''),
            deviceInfoDataCard('Tipo de Dispositivo', deviceData.type ?? ''),
          ],
        ),
        deviceInfoRow(
          children: [
            deviceInfoDataCard(
                'Modelo del dispositivo', deviceData.model ?? ''),
            deviceInfoDataCard('Sistema operativo y su versión',
                deviceData.operationSystem ?? '')
          ],
        ),
      ],
    );
  }

  Widget deviceInfoRow({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }

  Widget deviceInfoDataCard(String data, String text) {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            data,
            style: const TextStyle(fontSize: 11),
            maxLines: 2,
            minFontSize: 11,
            maxFontSize: 11,
          ),
          AutoSizeText(
            text,
            style: const TextStyle(fontSize: 14),
            maxLines: 1,
            minFontSize: 12,
            maxFontSize: 14,
          ),
        ],
      ),
    );
  }
}
