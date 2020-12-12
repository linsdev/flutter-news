import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:news/auth/presentation/pages/sign_in.dart';
import 'package:news/app/presentation/pages/init.dart';
import 'package:news/news/presentation/pages/news.dart';
import 'package:news/news/presentation/pages/news_details.dart';
import 'package:news/news/presentation/pages/news_search.dart';
import 'package:news/user/presentation/pages/favourites.dart';

class App extends StatelessWidget {
  static const PageInit = '/';
  static const PageSignIn = '/login';
  static const PageNews = '/news';
  static const PageNewsSearch = '/news/search';
  static const PageNewsDetails = '/news/details';
  static const PageFavourites = '/user/favourites';

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
      initialRoute: PageInit,
      routes: {
        PageInit: (context) => InitPage(),
        PageSignIn: (context) => SignInPage(),
        PageNews: (context) => NewsPage(),
        PageNewsSearch: (context) => NewsSearchPage(),
        PageNewsDetails: (context) => NewsDetailsPage(),
        PageFavourites: (context) => FavouritesPage(),
      },
    );
  }
}
