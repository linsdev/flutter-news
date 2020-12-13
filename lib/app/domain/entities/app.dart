import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/app/presentation/pages/init.dart';
import 'package:news/auth/presentation/pages/sign_in.dart';
import 'package:news/news/presentation/pages/news.dart';
import 'package:news/news/presentation/pages/news_details.dart';
import 'package:news/news/presentation/pages/news_search.dart';
import 'package:news/user/presentation/pages/favourites.dart';

class App extends StatelessWidget {
  static const pageInit = '/';
  static const pageSignIn = '/login';
  static const pageNews = '/news';
  static const pageNewsSearch = '/news/search';
  static const pageNewsDetails = '/news/details';
  static const pageFavourites = '/user/favourites';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'News',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: pageInit,
      routes: {
        pageInit: (context) => InitPage(),
        pageSignIn: (context) => SignInPage(),
        pageNews: (context) => NewsPage(),
        pageNewsSearch: (context) => NewsSearchPage(),
        pageNewsDetails: (context) => NewsDetailsPage(),
        pageFavourites: (context) => FavouritesPage(),
      },
    );
  }
}
