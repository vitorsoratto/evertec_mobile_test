import 'package:flutter/material.dart';

class CovidLogo extends StatelessWidget {
  final double width;
  final double height;
  final double titleFontSize;
  final double subTitleFontSize;
  final MainAxisAlignment mainAxisAlignment;

  const CovidLogo({
    super.key,
    required this.width,
    required this.height,
    this.titleFontSize = 22,
    this.subTitleFontSize = 10,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Image.asset('assets/images/covid.png', width: width, height: height),
        Text(
          'COVID-19',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontSize: titleFontSize,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          'CORONAVIRUS 2019 - nCoV',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontSize: subTitleFontSize,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
