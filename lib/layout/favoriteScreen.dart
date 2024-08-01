import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../shared/components/Custom_ElevatedButton.dart';
import '../shared/components/Custom_ElevatedButtonIcon.dart';
import '../shared/style/color_manager.dart';
import 'homeScreen.dart';

class FavoriteScreen extends StatefulWidget {
  static const String routeName = 'favoritescreen Screen';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: ColorManager.colorback
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButtonIcon(
              coloricon: ColorManager.colorWhit,
              icon: Icons.arrow_back_ios_new_outlined,
              text: 'Click Here To View Favorite Quotes',
              onPressed: () {
                // Navigate to a different screen or handle logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            SizedBox(height: 20),

            AnimatedTextField(// Use AnimationType.slide
              decoration: InputDecoration(
                fillColor: Colors.white, // Set background color to white
                filled: true, // Enable the fill color
                hoverColor: ColorManager.colorWhit,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                contentPadding: EdgeInsets.all(12),
              ),
              hintTexts: [
                'Type Something Here To Search..',
              ],
            ),

            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ColorManager.colorWhit,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '“All I required to be happy was friendship and people I could admire.”',
                    style: TextStyle(
                      color: ColorManager.colorblack,
                      fontFamily: 'Gemunu Libre',
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        '"Christian Dior"',
                        style: TextStyle(
                          color: ColorManager.colorblack,
                          fontFamily: 'Gemunu Libre',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  CustomElevatedButtonIcon(
                    colorBorder: ColorManager.Colorpurple,
                    colorButton: ColorManager.colorWhit,
                    colorText: ColorManager.Colorpurple,
                    icon: Icons.favorite_border_outlined,
                    text: 'Remove From Favorite',
                    onPressed: () {
                      // Handle button press
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ColorManager.colorWhit,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '“While we stop to think, we often miss our opportunity.”',
                    style: TextStyle(
                      color: ColorManager.colorblack,
                      fontFamily: 'Publilius Syrus',
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        '"Christian Dior"',
                        style: TextStyle(
                          color: ColorManager.colorblack,
                          fontFamily: 'Gemunu Libre',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  CustomElevatedButtonIcon(
                    colorBorder: ColorManager.Colorpurple,
                    colorButton: ColorManager.colorWhit,
                    colorText: ColorManager.Colorpurple,
                    icon: Icons.favorite_border_outlined,
                    text: 'Remove From Favorite',
                    onPressed: () {
                      // Handle button press
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
