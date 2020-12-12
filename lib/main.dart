import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/domain/entities/app.dart';

void main() {
  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
