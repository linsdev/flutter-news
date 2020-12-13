import 'package:flutter/material.dart';
import 'package:news/news/presentation/widgets/build_data_view.dart';
import 'package:news/user/domain/use_cases/remove_favourite.dart';
import 'package:news_api_flutter_package/model/article.dart';

class FavouritesListView extends StatefulWidget {
  const FavouritesListView(this.articles);

  final List<Article> articles;

  @override
  _FavouritesListViewState createState() => _FavouritesListViewState();
}

class _FavouritesListViewState extends State<FavouritesListView> {
  List<String> items;

  @override
  void initState() {
    super.initState();
    items = List<String>.generate(widget.articles.length, (i) => '$i');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final article = widget.articles[index];
        return Card(
          child: Dismissible(
            key: Key(item),
            onDismissed: (direction) async {
              setState(() {
                items.removeAt(index);
              });
              await removeFavourite(article).then((value) {
                Scaffold.of(context).showSnackBar(
                  const SnackBar(content: Text('Removed from favourites')),
                );
              });
            },
            background: Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
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
