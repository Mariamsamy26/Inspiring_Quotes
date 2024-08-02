import 'dart:convert';

import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task2_intern2grow/shared/components/Custom_QuoteFav.dart';
import '../shared/components/Custom_ElevatedButtonIcon.dart';
import '../shared/style/color_manager.dart';
import 'homeScreen.dart';

class FavoriteScreen extends StatefulWidget {
  static const String routeName = 'favoritescreen Screen';
  final List<Map<String, String>> favoriteQuoteIds; // Add this line

  // Initialize with the list of favorite quotes
  FavoriteScreen(this.favoriteQuoteIds);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  bool isFavorite = true;
  List<Map<String, String>> favoriteQuotes = [];

  @override
  void initState() {
    super.initState();
    loadFavoriteQuotes(); // Load favorites from local storage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 70, 10, 5),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: ColorManager.colorback),
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
            ), //back to home
            SizedBox(height: 15),

            AnimatedTextField(
              // Use AnimationType.slide
              decoration: InputDecoration(
                fillColor: Colors.white,
                // Set background color to white
                filled: true,
                // Enable the fill color
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
            ), //search

            Expanded(
              child: ListView.builder(
                itemCount: favoriteQuotes.length,
                itemBuilder: (context, index) {
                  final quote = favoriteQuotes[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomQuoteFav(
                      textQuote: quote['content'] ?? '',
                      textAuthor: quote['authorSlug'] ?? '',
                      onPressedFav: () {
                        setState(() {
                          favoriteQuotes.removeAt(index); // Remove from favorites
                          saveUpdatedFavorites(); // Update local storage
                        });
                      },
                      icon: Icons.favorite_border_outlined,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadFavoriteQuotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteQuotesJson = prefs.getStringList('favoriteQuotes');

    if (favoriteQuotesJson != null) {
      setState(() {
        favoriteQuotes = favoriteQuotesJson
            .map((e) => Map<String, String>.from(jsonDecode(e)))
            .toList();
      });
    } else {
      setState(() {
        favoriteQuotes = widget.favoriteQuoteIds; // Use passed favorites if no saved data
      });
    }
  }
  Future<void> saveUpdatedFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteQuotesJson =
    favoriteQuotes.map((e) => jsonEncode(e)).toList();
    await prefs.setStringList('favoriteQuotes', favoriteQuotesJson);
  }
}
