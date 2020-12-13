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
