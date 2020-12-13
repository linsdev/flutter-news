import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SharedString extends StateNotifier<String> {
  SharedString(String initialValue) : super(initialValue);

  // ignore: use_setters_to_change_properties
  void set(String value) => state = value;
}

class SharedWidget extends StateNotifier<Widget> {
  SharedWidget(Widget initialValue) : super(initialValue);

  // ignore: use_setters_to_change_properties
  void set(Widget value) => state = value;
}
