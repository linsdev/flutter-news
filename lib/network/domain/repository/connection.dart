import 'dart:async';
import 'package:connectivity/connectivity.dart';

Future<bool> checkNetworkConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  return connectivityResult != ConnectivityResult.none;
}

Future<void> waitForNetworkConnection() async {
  final connection = Connectivity()
      .onConnectivityChanged
      .skipWhile((element) => element == ConnectivityResult.none)
      .first;
  await connection;
}
