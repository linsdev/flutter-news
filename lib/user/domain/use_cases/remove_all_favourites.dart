import 'package:news/user/data/data_sources/firestore_names.dart';
import 'package:news/user/data/data_sources/firestore_user_doc.dart';

Future<void> removeAllFavourite() =>
    getUserDocRef().set({FirestoreNames.favouritesField: []});
