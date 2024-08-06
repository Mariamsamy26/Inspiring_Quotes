import 'package:flutter/material.dart';

import '../style/color_manager.dart';
import 'Custom_ElevatedButton.dart';

class CustomElevatedButtonIcon extends CustomElevatedButton {
  final IconData icon;
  final Color coloricon;

  CustomElevatedButtonIcon({
    required this.icon ,
    this.coloricon = ColorManager.Colorpurple,
    required super.text,
    required super.onPressed,
    super.height = 62,
    super.width = 327,
    super.colorBorder = ColorManager.colorWhit,
    super.colorButton = ColorManager.Colorpurple,
    super.colorText = ColorManager.colorWhit,
  }
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorButton,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                color: colorBorder,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: coloricon),
              SizedBox(width: 5,),
              Text(
                text,
                style: TextStyle(
                  color: colorText,
                  fontFamily: 'Gemunu Libre',
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
