import 'package:news/user/data/data_sources/firestore_names.dart';
import 'package:news/user/data/data_sources/firestore_user_doc.dart';
import 'package:news/user/domain/repositories/firestore_get_favourites.dart';
import 'package:news_api_flutter_package/model/article.dart';

Future<void> addFavourite(Article article) async {
  final userDocRef = getUserDocRef();
  final favourites = await getFavouritesInJson(userDocRef);

  if (!(favourites.any((e) => e['url'] == article.url))) {
    favourites.add({
      'adding_date': DateTime.now().millisecondsSinceEpoch,
      'author': article.author,
      'title': article.title,
      'description': article.description,
      'url': article.url,
      'urlToImage': article.urlToImage,
      'publishedAt': article.publishedAt,
      'content': '',
      'source': {
        'id': article.source.id,
        'name': article.source.name,
        'description:': article.source.description,
        'url': article.source.url,
        'category': article.source.category,
        'language': article.source.language,
        'country': article.source.country,
      },
    });
    await userDocRef.set({FirestoreNames.FavouritesField: favourites});
  }
}
