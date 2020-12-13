import 'package:flutter/material.dart';
import 'package:news/app/domain/entities/app.dart';
import 'package:news/user/presentation/widgets/favourites_floating_button.dart';

import '../widgets/build_data_view.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              Navigator.pushNamed(context, App.pageNewsSearch);
            },
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          buildTopHeadlinesView(context),
          favouritesFloatingButton(context),
        ],
      ),
    );
  }
}
