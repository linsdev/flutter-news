import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

dynamic textEditingControllerProvider() {
  return Provider.autoDispose((ref) {
    final controller = TextEditingController();
    ref.onDispose(controller.dispose);
    return controller;
  });
}
