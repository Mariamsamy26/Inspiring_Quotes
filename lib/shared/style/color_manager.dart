import 'package:flutter/material.dart';

class ColorManager{
  static const  colorback = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(93, 19, 231, 1),
        Colorpurple ]
  );

  static const Colorpurple= Color.fromRGBO(130, 73, 181, 1);
  static const Color colorWhit= Color.fromRGBO(251, 251, 251, 1);
  static const Color colorblack= Color.fromRGBO(50, 50, 50, 0.7);


}
