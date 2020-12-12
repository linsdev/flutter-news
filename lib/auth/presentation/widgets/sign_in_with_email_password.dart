import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/app/domain/entities/app.dart';
import 'package:news/auth/data/repositories/email_validator.dart';
import 'package:news/auth/data/repositories/password_validator.dart';

import 'package:news/auth/domain/entities/email_password.dart';
import 'package:news/auth/domain/use_cases/signin_with_email_password.dart';
import 'package:news/core/presentation/manager/string_provider.dart';
import 'package:news/core/presentation/manager/text_editing_controller_provider.dart';
import 'package:news/core/presentation/widgets/error_snack_bar.dart';
import 'package:news/core/presentation/widgets/error_text.dart';

final emailTextFormProvider = textEditingControllerProvider();
final passwordTextFormProvider = textEditingControllerProvider();

final emailErrorProvider = stringProvider();
final passwordErrorProvider = stringProvider();

class SignInWithEmailAndPasswordCard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final emailController = watch(emailTextFormProvider);
    final passwordController = watch(passwordTextFormProvider);
    final emailError = watch(emailErrorProvider.state);
    final passwordError = watch(passwordErrorProvider.state);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            errorText(emailError),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            errorText(passwordError),
            SizedBox(height: 15),
            FlatButton(
              minWidth: 120,
              child: Text(
                'Sign In',
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).colorScheme.primary,
              onPressed: () async {
                final email = emailController.text;
                final password = passwordController.text;

                var emailErrorMessage = '';
                if (validateEmail(email) == EmailValidationResult.Invalid) {
                  emailErrorMessage = 'Email looks like fake';
                }
                context.read(emailErrorProvider).setString(emailErrorMessage);

                var passwordErrorMessage = '';
                switch (validatePassword(password)) {
                  case PasswordValidationResult.TooShort:
                    passwordErrorMessage =
                        'Must contains at least 6 characters';
                    break;
                  case PasswordValidationResult.InvalidCharacters:
                    passwordErrorMessage = 'Must consists from '
                        'letters, numbers, \nand _ @ & \$ symbols';
                    break;
                }
                context
                    .read(passwordErrorProvider)
                    .setString(passwordErrorMessage);

                final signInResult =
                    await signIn(EmailPassword(email, password));
                if (signInResult == SignInResult.Success) {
                  Navigator.pushReplacementNamed(context, App.PageNews);
                } else {
                  errorSnackBar(context, "Failed to Sign In");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
