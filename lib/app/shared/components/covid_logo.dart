import 'package:flutter/material.dart';

class CovidLogo extends StatelessWidget {
  final double width;
  final double height;
  final double titleFontSize;
  final double subTitleFontSize;

  const CovidLogo({
    super.key,
    required this.width,
    required this.height,
    this.titleFontSize = 22,
    this.subTitleFontSize = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/covid.png', width: width, height: height),
        Text('COVID-19',
            style: TextStyle(
                fontSize: titleFontSize, fontWeight: FontWeight.w900)),
        Text('CORONAVIRUS 2019 - nCoV',
            style: TextStyle(
                fontSize: subTitleFontSize, fontWeight: FontWeight.w900)),
      ],
    );
  }
}
