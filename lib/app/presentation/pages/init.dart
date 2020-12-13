import 'package:flutter/material.dart';
import 'package:news/app/domain/entities/app.dart';
import 'package:news/app/domain/repositories/init.dart';
import 'package:news/auth/presentation/manager/auth_page_routing.dart';
import 'package:news/core/domain/use_cases/wait_for_future.dart';

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: waitFor(
          future: Future(() async {
            await initApp;
            await Navigator.of(context)
                .pushReplacementNamed(authPageOr(App.PageNews));
          }),
          onWait: waitFor(
            future: Future.delayed(Duration(seconds: 5)),
            onWait: const CircularProgressIndicator(),
            onDone: Text('Please check your Internet connection'),
          ),
          onDone: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
