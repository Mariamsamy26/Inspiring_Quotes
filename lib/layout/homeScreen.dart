import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    getRandomQuote();
  }

  Future<void> getRandomQuote() async {
    var quotesApi = QuotesApi();
    try {
      var fetchedQuote = await quotesApi.getRandom(); // Updated function call
      setState(() {
        quote = fetchedQuote;
        isLoading = false;
      });
    } catch (e) {
      print('Failed to load quotes due to: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: ColorManager.colorback,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomElevatedButton(
            text: 'Click Here To View Favorite Quotes',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoriteScreen()),
              );
            },
          ),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(5),
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
                  icon: isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  textQuote: quote!['content'] !,
                  textAuthor: quote!['authorSlug'] !,
                  onPressed: () {
                    setState(() {
                      getRandomQuote();
                    });
                  },
                  onPressedFav: () {
                    setState(() {
                      isFavorite = !isFavorite; // Toggle the favorite state
                    });
                  },
                ),
              ],
            )
                : Text('No quotes available.'),
          ),
        ],
      ),
    );
  }
}
