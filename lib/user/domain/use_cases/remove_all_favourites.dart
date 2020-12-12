import 'package:news/user/data/data_sources/firestore_user_doc.dart';

Future<void> removeAllFavourite() async {
  final userDocRef = getUserDocRef();
  await userDocRef.set({'favourites': []});
}
