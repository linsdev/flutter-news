import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_api_flutter_package/model/article.dart';

import 'package:news/user/domain/use_cases/add_favourite.dart';
import 'package:news/news/presentation/widgets/build_data_view.dart';

class WidgetValue extends StateNotifier<Widget> {
  WidgetValue() : super(Icon(Icons.favorite_border));
  void setWidget(Widget widget) {
    state = widget;
  }
}

final buttonIconProvider =
    StateNotifierProvider.autoDispose((ref) => WidgetValue());

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
              context.read(buttonIconProvider).setWidget(Icon(Icons.favorite));
              await addFavourite(article);
            },
          )
        ],
      ),
      body: buildArticleView(context, article),
    );
  }
}
