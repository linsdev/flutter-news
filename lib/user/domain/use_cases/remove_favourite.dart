import 'package:news/user/data/data_sources/firestore_names.dart';
import 'package:news/user/data/data_sources/firestore_user_doc.dart';
import 'package:news/user/domain/repositories/firestore_get_favourites.dart';
import 'package:news_api_flutter_package/model/article.dart';

Future<void> removeFavourite(Article article) async {
  final userDocRef = getUserDocRef();
  final favourites = await getFavouritesInJson(userDocRef);
  favourites.removeWhere((e) => e['url'] == article.url);
  await userDocRef.set({FirestoreNames.favouritesField: favourites});
}
