import 'package:flutter/material.dart';

import '../style/color_manager.dart';
import 'Custom_ElevatedButton.dart';
import 'Custom_ElevatedButtonIcon.dart';
import 'Custom_QuoteFav.dart';

class CustomQuoteHome extends CustomQuoteFav {

  final void Function()? onPressed;


  CustomQuoteHome({
    required this.onPressed,
    required super.icon,
    required super.textQuote,
    required super.textAuthor,
    required super.onPressedFav,
    super.height = 62,
    super.width = 327,
    super.colorBorder = ColorManager.colorWhit,
    super.colorButton = ColorManager.Colorpurple,
    super.colorText = ColorManager.colorWhit,
    super.coloricon = ColorManager.Colorpurple,
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
