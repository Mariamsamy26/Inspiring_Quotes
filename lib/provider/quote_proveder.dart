import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/remote/network/QuotesApi.dart';

class QuoteProvider extends ChangeNotifier {
  Map<String, String>? quote;
  bool isLoading = true;
  bool isFavorite = false;
  List<Map<String, String>> favoriteQuoteIds = [];
  String? currentQuoteId;

  Future<void> getRandomQuote() async {
    var quotesApi = QuotesApi();
    try {
      var fetchedQuote = await quotesApi.getRandom();
      quote = fetchedQuote;
      isLoading = false;
      isFavorite = false;
    } catch (e) {
      print('Failed to load quotes due to: $e');
      // isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveFavoriteQuotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteQuotesJson =
        favoriteQuoteIds.map((e) => jsonEncode(e)).toList();
    await prefs.setStringList('favoriteQuotes', favoriteQuotesJson);
  }

  Future<void> saveUpdatedFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteQuotesJson =
    favoriteQuoteIds.map((e) => jsonEncode(e)).toList();
    await prefs.setStringList('favoriteQuotes', favoriteQuotesJson);
  }

  void filterQuotes(String searchController) {
    String searchText = searchController.toLowerCase(); // Get search text

    favoriteQuoteIds = favoriteQuoteIds.where((quote) {
        final content = quote['content']?.toLowerCase() ?? '';
        final authorSlug = quote['authorSlug']?.toLowerCase() ?? '';
        return content.contains(searchText) || authorSlug.contains(searchText);
        notifyListeners();
      }).toList();
    notifyListeners();
  }
}
