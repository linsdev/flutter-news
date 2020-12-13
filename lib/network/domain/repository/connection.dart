import 'dart:async';

import 'package:connectivity/connectivity.dart';

Future<void> waitForNetworkConnection() async {
  final connection = Connectivity()
      .onConnectivityChanged
      .skipWhile((element) => element == ConnectivityResult.none)
      .first;
  await connection;
}
