import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../shared/components/Custom_ElevatedButton.dart';
import '../shared/components/Custom_ElevatedButtonIcon.dart';
import '../shared/style/color_manager.dart';
import 'favoriteScreen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Creat Account Screen';

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  Widget build(BuildContext context) {
    bool isFavorite = false;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: ColorManager.colorback
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomElevatedButton(
            text: 'Click Here To View Favorite Quotes',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FavoriteScreen()));
            },),

          Container(
            margin: EdgeInsets.all(25),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorManager.colorWhit,
              borderRadius: BorderRadius.circular(9),
            ),
            child:  Column(
            children: [
              const Text(
                '“All I required to be happy was friendship and people I could admire.”',
                style: TextStyle(
                  color: ColorManager.colorblack,
                  fontFamily: 'Gemunu Libre',
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Spacer(),
                  Text(
                    '"Christian Dior"',
                    style: TextStyle(
                      color: ColorManager.colorblack,
                      fontFamily: 'Gemunu Libre',
                      fontSize: 20,
                    ),),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      text: 'Generate Another Quote',
                      onPressed: () {  },),
                      flex:2,
                  ),

                  Expanded(
                    child: CustomElevatedButtonIcon(
                      colorBorder:ColorManager.Colorpurple ,
                      colorButton: ColorManager.colorWhit,
                      colorText: ColorManager.Colorpurple,
                      icon: isFavorite ? Icons.favorite_border_outlined : Icons.favorite,
                      text: '',
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite; // Toggle the icon state
                        });
                      },
                    ),
                      flex:1,
                  ),
                ],
              )
            ],
          ),
          ),

      ],),
    );
  }

}
