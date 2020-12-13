import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';

NewsAPI newsAPI;

Future<void> initNewsapi() async {
  final remoteConfig = await RemoteConfig.instance;

  await remoteConfig.fetch(expiration: const Duration(hours: 1));
  await remoteConfig.activateFetched();

  newsAPI = NewsAPI(remoteConfig.getString('na'));
}
