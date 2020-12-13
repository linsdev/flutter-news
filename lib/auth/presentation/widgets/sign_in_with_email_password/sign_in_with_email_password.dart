import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:news/core/presentation/widgets/error_text.dart';
import 'provides.dart';
import 'sign_in_button.dart';

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
            SignInButton(),
          ],
        ),
      ),
    );
  }
}
