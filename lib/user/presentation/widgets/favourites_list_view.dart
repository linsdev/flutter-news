import 'package:flutter/material.dart';
import 'package:news/user/domain/use_cases/remove_favourite.dart';
import 'package:news_api_flutter_package/model/article.dart';

import 'package:news/news/presentation/widgets/build_data_view.dart';

class FavouritesListView extends StatefulWidget {
  final List<Article> articles;

  FavouritesListView(this.articles);

  @override
  MyAppState createState() {
    return MyAppState(articles);
  }
}

class MyAppState extends State<FavouritesListView> {
  final List<Article> articles;
  final List<String> items;

  MyAppState(this.articles)
      : items = List<String>.generate(articles.length, (i) => "$i");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        Article article = articles[index];
        return Card(
          child: Dismissible(
            key: Key(item),
            onDismissed: (direction) async {
              setState(() {
                items.removeAt(index);
              });
              removeFavourite(article).then((value) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Removed from favourites")),
                );
              });
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('REMOVE', style: TextStyle(color: Colors.white)),
                  Text('REMOVE', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            child: buildCardContent(context, article, index),
          ),
        );
      },
    );
  }
}
