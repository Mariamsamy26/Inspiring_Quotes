import 'package:flutter/material.dart';

import '../style/color_manager.dart';

class CustomElevatedButtonIcon extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double width;
  final double height;
  final Color colorBorder;
  final Color colorButton;
  final IconData icon;
  final Color coloricon;
  final Color colorText;

  CustomElevatedButtonIcon({
    required this.icon ,
    required this.text,
    required this.onPressed,
    this.height = 62,
    this.width = 327,
    this.colorBorder = ColorManager.colorWhit,
    this.colorButton = ColorManager.Colorpurple,
    this.colorText = ColorManager.colorWhit,
    this.coloricon = ColorManager.Colorpurple,
  });

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
