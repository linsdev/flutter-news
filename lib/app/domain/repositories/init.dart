import 'package:firebase_core/firebase_core.dart';

import 'package:news/network/domain/repository/connection.dart';
import 'package:news/news/data/data_sources/newsapi.dart';

final initApp = Future<void>(() async {
  await waitForNetworkConnection();
  await Firebase.initializeApp();
  await initNewsapi();
});
