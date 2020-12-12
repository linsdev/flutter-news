import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:news/user/domain/use_cases/get_favourites.dart';
import 'package:news/user/domain/use_cases/remove_all_favourites.dart';
import 'package:news/user/presentation/widgets/favourites_list_view.dart';

class WidgetValue extends StateNotifier<Widget> {
  WidgetValue() : super(SizedBox.shrink());

  void setWidget(Widget widget) {
    state = widget;
  }
}

final bodyProvider = StateNotifierProvider.autoDispose((ref) => WidgetValue());

class FavouritesPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final body = watch(bodyProvider.state);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            tooltip: 'Remove all',
            onPressed: () async {
              await removeAllFavourite();
              context.read(bodyProvider).setWidget(null);
            },
          )
        ],
      ),
      body: body != null
          ? FutureBuilder(
              future: getFavourites(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List articles = snapshot.data;
                  articles = articles.reversed.toList();
                  return FavouritesListView(articles);
                }
                return Center(
                  child: const CircularProgressIndicator(),
                );
              },
            )
          : SizedBox.shrink(),
    );
  }
}
