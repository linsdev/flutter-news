import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:news/core/domain/repositories/shared_var.dart';
import 'package:news/user/domain/use_cases/get_favourites.dart';
import 'package:news/user/domain/use_cases/remove_all_favourites.dart';
import 'package:news/user/presentation/widgets/favourites_list_view.dart';

final bodyProvider =
    StateNotifierProvider.autoDispose((ref) => SharedWidget(null));

class FavouritesPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final body = watch(bodyProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
        actions: [_removeAllButtonBuilder(context)],
      ),
      body: body ??
          FutureBuilder(
            future: getFavourites(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List articles = snapshot.data;
                articles = articles.reversed.toList();
                if (articles.isEmpty) {
                  return SizedBox.shrink();
                }
                return FavouritesListView(articles);
              }
              return Center(child: const CircularProgressIndicator());
            },
          ),
    );
  }
}

Widget _removeAllButtonBuilder(BuildContext context) {
  return IconButton(
    icon: Icon(Icons.delete),
    tooltip: 'Remove all',
    onPressed: () async {
      await removeAllFavourite();
      context.read(bodyProvider).set(SizedBox.shrink());
    },
  );
}
