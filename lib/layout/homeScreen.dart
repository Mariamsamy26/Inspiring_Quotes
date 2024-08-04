import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared/components/Custom_ElevatedButton.dart';
import '../shared/components/Custom_quote_home.dart';
import '../shared/remote/network/QuotesApi.dart';
import '../shared/style/color_manager.dart';
import 'favoriteScreen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Create Account Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, String>? quote;
  bool isLoading = true;
  bool isFavorite = false;
  List<Map<String, String>> favoriteQuoteIds = [];
  String? currentQuoteId;

  @override
  void initState() {
    super.initState();
    getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: ColorManager.colorback,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomElevatedButton(
            colorText: ColorManager.colorblack,
            colorBorder: ColorManager.Colorbabypurple,
            colorButton: ColorManager.Colorbabypurple,
            text: 'Click Here To View Favorite Quotes',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FavoriteScreen(favoriteQuoteIds)),
              );
            },
          ), //to go fav screen
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(9),
            ),
            child: isLoading
                ? CircularProgressIndicator()
                : quote != null
                    ? Column(
                        children: [
                          CustomQuoteHome(
                            textQuote: quote!['content']!,
                            textAuthor: quote!['authorSlug']!,
                            icon: isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            onPressed: () {
                              setState(() {
                                getRandomQuote();
                              });
                            },
                            onPressedFav: () {
                              setState(() {
                                isFavorite = !isFavorite;

                                // Add or remove the quote from favorites
                                if (isFavorite) {
                                  // Add quote to favorites
                                  favoriteQuoteIds.add(quote!);
                                } else {
                                  // Remove quote from favorites
                                  favoriteQuoteIds.removeWhere(
                                    (element) => element['id'] == quote!['id'],
                                  );
                                }
                                saveFavoriteQuotes();
                                print(isFavorite);
                                print(favoriteQuoteIds);
                              });
                            },
                          ),
                        ],
                      )
                    : Text(
                        'No quotes available.',
                        style: TextStyle(
                          color: ColorManager.colorWhit,
                          fontFamily: 'Gemunu Libre',
                          fontSize: 20,
                        ),
                      ),
          ),
        ],
      ),
    );
  }

  Future<void> getRandomQuote() async {
    var quotesApi = QuotesApi();
    try {
      var fetchedQuote = await quotesApi.getRandom();
      setState(() {
        quote = fetchedQuote;
        isLoading = false;
        isFavorite = false;
      });
    } catch (e) {
      print('Failed to load quotes due to: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> saveFavoriteQuotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteQuotesJson =
        favoriteQuoteIds.map((e) => jsonEncode(e)).toList();
    await prefs.setStringList('favoriteQuotes', favoriteQuotesJson);
  }

}
