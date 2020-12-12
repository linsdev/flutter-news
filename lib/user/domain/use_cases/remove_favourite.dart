import 'package:news/user/data/data_sources/firestore_user_doc.dart';
import 'package:news_api_flutter_package/model/article.dart';

Future<void> removeFavourite(Article article) async {
  final userDocRef = getUserDocRef();
  final List favourites = (await userDocRef.get()).data()['favourites'];
  favourites.removeWhere((e) => e['url'] == article.url);
  await userDocRef.set({'favourites': favourites});
}
