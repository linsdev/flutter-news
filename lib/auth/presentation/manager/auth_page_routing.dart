import 'package:news/app/domain/entities/app.dart';
import 'package:news/auth/domain/use_cases/check_auth_state.dart';

String authPageOr(String page) {
  return isUserSignedIn() ? page : App.PageSignIn;
}
