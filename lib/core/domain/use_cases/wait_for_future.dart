import 'package:flutter/widgets.dart';

Widget waitFor({
  @required Future<void> future,
  @required Widget onWait,
  @required Widget onDone,
}) {
  return FutureBuilder(
    future: Future.wait([future]),
    builder: (_, snapshot) => snapshot.hasData ? onDone : onWait,
  );
}

Widget waitForBool({
  @required Future<bool> future,
  @required Widget onWait,
  @required Widget onTrue,
  @required Widget onFalse,
}) {
  return FutureBuilder(
    future: Future.wait([future]),
    builder: (_, snapshot) {
      if (snapshot.hasData) {
        return snapshot.data ? onTrue : onFalse;
      }
      return onWait;
    }, //=> snapshot.hasData ? done : wait,
  );
}
