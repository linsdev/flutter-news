import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/core/domain/repositories/shared_var.dart';
import 'package:news/core/presentation/manager/text_editing_controller_provider.dart';

// ignore: type_annotate_public_apis
final emailTextFormProvider = textEditingControllerProvider();
// ignore: type_annotate_public_apis
final passwordTextFormProvider = textEditingControllerProvider();

final emailErrorProvider = StateNotifierProvider((ref) => SharedString(''));
final passwordErrorProvider = StateNotifierProvider((ref) => SharedString(''));
