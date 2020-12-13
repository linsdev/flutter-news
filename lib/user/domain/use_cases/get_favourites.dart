import 'package:news/user/data/data_sources/firestore_user_doc.dart';
import 'package:news/user/domain/repositories/firestore_get_favourites.dart';
import 'package:news_api_flutter_package/model/article.dart';

Future<List<Article>> getFavourites() async {
  final favourites = await getFavouritesInJson(getUserDocRef());
  return favourites.map((e) => Article.fromJson(e)).toList();
}
