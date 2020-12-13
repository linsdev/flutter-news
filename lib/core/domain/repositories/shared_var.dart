import 'package:flutter_riverpod/flutter_riverpod.dart';

class SharedVar<T> extends StateNotifier<T> {
  SharedVar(T initialValue) : super(initialValue);

  void set(T value) {
    state = value;
  }
}

StateNotifierProvider<SharedVar<T>> sharedVarProvider<T>(T initialValue) {
  return StateNotifierProvider((ref) => SharedVar(initialValue));
}

sharedAutoDisposeVarProvider<T>(T initialValue) {
  return StateNotifierProvider.autoDispose((ref) => SharedVar(initialValue));
}
