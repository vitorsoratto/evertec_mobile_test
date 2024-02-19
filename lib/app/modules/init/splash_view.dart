import 'dart:async';
import 'dart:math';

import 'package:evertec_mobile_test/app/shared/components/covid_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double progressValue = 0;
  final rng = Random();

  @override
  void initState() {
    determinateLoadingValue();
    super.initState();
  }

  void determinateLoadingValue() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (progressValue < 1.0) {
          double controlledRandomValue = rng.nextDouble();

          if (progressValue + controlledRandomValue < 1.0) {
            progressValue += controlledRandomValue;
          } else {
            progressValue = 1.0;
          }
        } else {
          timer.cancel();
          Modular.to.navigate('/home/');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: CovidLogo(
            width: 200,
            height: 200,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Loading...', style: TextStyle(fontSize: 14)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.5,
                    ),
                  ),
                  child: LinearProgressIndicator(
                    color: Colors.black,
                    backgroundColor: Colors.white,
                    minHeight: 20,
                    value: progressValue,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${(progressValue * 100).toInt()}%',
                    style: const TextStyle(fontSize: 14)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
