import 'package:flutter/material.dart';
import 'package:news/app/domain/entities/app.dart';
import 'package:news/user/presentation/widgets/favourites_floating_button.dart';

import '../widgets/build_data_view.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              Navigator.pushNamed(context, App.PageNewsSearch);
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
