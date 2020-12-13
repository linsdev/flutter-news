import 'package:news/core/domain/repositories/string_provider.dart';
import 'package:news/core/presentation/manager/text_editing_controller_provider.dart';

final emailTextFormProvider = textEditingControllerProvider();
final passwordTextFormProvider = textEditingControllerProvider();

final emailErrorProvider = sharedVarProvider('');
final passwordErrorProvider = sharedVarProvider('');
