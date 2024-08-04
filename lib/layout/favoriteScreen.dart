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
  bool isSearch = false;
  List<Map<String, String>> filteredQuotes = [];
  TextEditingController searchController = TextEditingController();
  Map<String, String> searchResult = {'content': '', 'authorSlug': ''};
  bool isFavorite = true;
  List<Map<String, String>> favoriteQuotes = [];

  @override
  void initState() {
    super.initState();
    loadFavoriteQuotes();
    searchController.addListener(() {
      filterQuotes(); // Call filter whenever the search when input in search
    });
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
              colorText: ColorManager.colorblack,
              colorBorder: ColorManager.Colorbabypurple,
              colorButton: ColorManager.Colorbabypurple,
              coloricon: ColorManager.colorblack,
              icon: Icons.arrow_back_ios_new_outlined,
              text: 'Click Here To View Favorite Quotes',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ), //back to home
            SizedBox(height: 15),
            AnimatedTextField(
              controller: searchController, // Update controller name
              decoration: InputDecoration(
                fillColor: ColorManager.colorWhit,
                filled: true,
                hoverColor: ColorManager.colorWhit,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorManager.colorWhit,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.colorblack,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.all(12),
              ),
              hintTexts: const [
                'Type Something Here To Search..',
              ],
            ), //search
            Expanded(
              child: ListView.builder(
                itemCount: filteredQuotes.length, // Use filtered quotes count
                itemBuilder: (context, index) {
                  final quote = filteredQuotes[index]; // Use filtered quotes
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
        filteredQuotes = List.from(favoriteQuotes); // Initialize filtered quotes
      });
    } else {
      setState(() {
        favoriteQuotes = widget.favoriteQuoteIds; // Use passed favorites if no saved data
        filteredQuotes = List.from(favoriteQuotes); // Initialize filtered quotes
      });
    }
  }

  Future<void> saveUpdatedFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteQuotesJson =
    favoriteQuotes.map((e) => jsonEncode(e)).toList();
    await prefs.setStringList('favoriteQuotes', favoriteQuotesJson);
  }

  void filterQuotes() {
    String searchText = searchController.text.toLowerCase(); // Get search text
    setState(() {
      filteredQuotes = favoriteQuotes.where((quote) {
        final content = quote['content']?.toLowerCase() ?? '';
        final authorSlug = quote['authorSlug']?.toLowerCase() ?? '';
        return content.contains(searchText) || authorSlug.contains(searchText);
      }).toList();
    });
  }
}
