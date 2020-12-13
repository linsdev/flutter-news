import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SharedString extends StateNotifier<String> {
  SharedString(String initialValue) : super(initialValue);

  void set(String value) {
    state = value;
  }
}

class SharedWidget extends StateNotifier<Widget> {
  SharedWidget(Widget initialValue) : super(initialValue);

  void set(Widget value) {
    state = value;
  }
}
