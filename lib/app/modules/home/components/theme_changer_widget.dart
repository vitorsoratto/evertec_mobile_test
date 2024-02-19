import 'package:evertec_mobile_test/app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeChangerWidget extends StatelessWidget {
  final void Function() lightModeAction;
  final void Function() darkModeAction;

  const ThemeChangerWidget({
    super.key,
    required this.lightModeAction,
    required this.darkModeAction,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        top: screenSize.height * .428,
        left: screenSize.width * .60,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: AppColors.secondaryGray,
            width: 1.5,
          ),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: AppColors.secondaryGray,
                blurRadius: 3,
                offset: Offset(0, 3)),
          ],
        ),
        width: 145,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            lightModeButton(),
            darkModeButton(screenSize),
          ],
        ),
      ),
    );
  }

  Widget lightModeButton() {
    return GestureDetector(
      onTap: lightModeAction,
      child: Container(
        padding: const EdgeInsets.all(2.5).copyWith(left: 6),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(6),
            backgroundColor: Colors.grey[200],
            shadowColor: AppColors.lightGray,
          ),
          onPressed: lightModeAction,
          child: const Icon(Icons.sunny),
        ),
      ),
    );
  }

  Widget darkModeButton(Size screenSize) {
    return GestureDetector(
      onTap: darkModeAction,
      child: Container(
        padding: const EdgeInsets.all(2.5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          color: AppColors.secondaryGray,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(6),
            backgroundColor: AppColors.secondaryGray,
            shadowColor: AppColors.darkGray,
          ),
          onPressed: darkModeAction,
          child: const Icon(Icons.nightlight_round_sharp),
        ),
      ),
    );
  }
}
