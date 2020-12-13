import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/app/domain/entities/app.dart';
import 'package:news/news/data/data_sources/newsapi.dart';
import 'package:news_api_flutter_package/model/article.dart';

Widget buildTopHeadlinesView(BuildContext context, {String country = 'ua'}) {
  return FutureBuilder<List<Article>>(
      future: newsAPI.getTopHeadlines(country: country),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? snapshot.hasData
                ? _buildArticleListView(context, snapshot.data)
                : const SizedBox.shrink()
            : _buildProgress();
      });
}

Widget buildEverythingView(BuildContext context, String query) {
  return FutureBuilder<List<Article>>(
      future: newsAPI.getEverything(query: query),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? snapshot.hasData
                ? _buildArticleListView(context, snapshot.data)
                : const SizedBox.shrink()
            : _buildProgress();
      });
}

Widget buildCardContent(BuildContext context, Article article, int index) {
  return ListTile(
    title: Text(article.title ?? '', maxLines: 2),
    subtitle: Text(article.description ?? '', maxLines: 3),
    leading: article.urlToImage == null
        ? null
        : Image.network(article.urlToImage,
            width: 70, alignment: Alignment.topLeft),
    onTap: () {
      Navigator.pushNamed(
        context,
        App.pageNewsDetails,
        arguments: article,
      );
    },
    onLongPress: () {},
  );
}

Widget _buildArticleListView(BuildContext context, List<Article> articles) {
  return ListView.builder(
    itemCount: articles.length,
    itemBuilder: (context, index) {
      final article = articles[index];
      return Card(child: buildCardContent(context, article, index));
    },
  );
}

Widget buildArticleView(BuildContext context, Article article) {
  var dateStr = '';
  try {
    if (article.publishedAt != null) {
      dateStr = DateFormat('dd.MM.yyyy HH:mm')
          .format(DateTime.parse(article.publishedAt));
    }
    // ignore: empty_catches
  } on Exception {}

  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        Text(
          article.title ?? '',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.only(top: 3),
          constraints: const BoxConstraints.tightFor(width: double.maxFinite),
          child: dateStr.isEmpty
              ? const SizedBox.shrink()
              : Text(dateStr, style: const TextStyle(color: Colors.black54)),
        ),
        const SizedBox(height: 10),
        if (article.urlToImage == null)
          const SizedBox.shrink()
        else
          Image.network(article.urlToImage),
        const SizedBox(height: 10),
        Text(article.description ?? '', textAlign: TextAlign.justify),
      ],
    ),
  );
}

Widget _buildProgress() {
  return const Center(child: CircularProgressIndicator());
}
