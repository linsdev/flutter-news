import 'package:flutter_riverpod/flutter_riverpod.dart';

class StringValue extends StateNotifier<String> {
  StringValue() : super('');
  void setString(String text) {
    state = text;
  }
}

StateNotifierProvider<StringValue> stringProvider() {
  return StateNotifierProvider((ref) => StringValue());
}
