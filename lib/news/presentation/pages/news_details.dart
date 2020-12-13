import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/core/domain/repositories/shared_var.dart';
import 'package:news/news/presentation/widgets/build_data_view.dart';
import 'package:news/user/domain/use_cases/add_favourite.dart';
import 'package:news_api_flutter_package/model/article.dart';

final buttonIconProvider = StateNotifierProvider.autoDispose(
    (ref) => SharedWidget(Icon(Icons.favorite_border)));

class NewsDetailsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final buttonIcon = watch(buttonIconProvider.state);
    final Article article = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(article.author ?? ''),
        actions: [
          IconButton(
            icon: buttonIcon,
            tooltip: 'Add to favourites',
            onPressed: () async {
              context.read(buttonIconProvider).set(Icon(Icons.favorite));
              await addFavourite(article);
            },
          )
        ],
      ),
      body: buildArticleView(context, article),
    );
  }
}
