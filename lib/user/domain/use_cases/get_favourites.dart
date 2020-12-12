import 'package:news_api_flutter_package/model/article.dart';

import 'package:news/user/data/data_sources/firestore_user_doc.dart';

Future<List<Article>> getFavourites() async {
  final userDoc = await getUserDocRef().get();
  final List favourites = userDoc.data()['favourites'];
  return favourites.map((e) => Article.fromJson(e)).toList();
}
