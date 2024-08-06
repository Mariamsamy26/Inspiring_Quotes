import 'package:flutter/material.dart';

import '../style/color_manager.dart';
import 'Custom_ElevatedButton.dart';
import 'Custom_ElevatedButtonIcon.dart';

class CustomQuoteHome extends StatelessWidget {
  final String textQuote ;
  final String textAuthor;
  final void Function()? onPressed;
  final Future<void>? Function()? onPressedFav;
  final double width;
  final double height;
  final Color colorBorder;
  final Color colorButton;
  final IconData icon;
  final Color coloricon;
  final Color colorText;

  CustomQuoteHome({
    required this.icon,
    required this.textQuote,
    required this.textAuthor,
    required this.onPressed,
    required this.onPressedFav,
    this.height = 62,
    this.width = 327,
    this.colorBorder = ColorManager.colorWhit,
    this.colorButton = ColorManager.Colorpurple,
    this.colorText = ColorManager.colorWhit,
    this.coloricon = ColorManager.Colorpurple,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorManager.colorWhit,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        children: [
          Text(
            textQuote,
            style: TextStyle(
              color: ColorManager.colorblack,
              fontFamily: 'Gemunu Libre',
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Spacer(),
              Text(
                textAuthor,
                style: TextStyle(
                  color: ColorManager.colorblack,
                  fontFamily: 'Gemunu Libre',
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                    text: 'Generate Another Quote', onPressed: onPressed),
                flex: 2,
              ),
              Expanded(
                child: CustomElevatedButtonIcon(
                  colorBorder: ColorManager.Colorpurple,
                  colorButton: ColorManager.colorWhit,
                  colorText: ColorManager.Colorpurple,
                  icon: icon,
                  text: '',
                  onPressed: onPressedFav,
                ),
                flex: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
