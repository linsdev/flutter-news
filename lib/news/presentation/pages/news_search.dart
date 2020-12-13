import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:news/core/domain/repositories/shared_var.dart';
import '../widgets/build_data_view.dart';

final contentProvider =
    StateNotifierProvider((ref) => SharedWidget(SizedBox.shrink()));

const noneUnderlineInputBorder = UnderlineInputBorder(
  borderSide: BorderSide(style: BorderStyle.none),
);

class NewsSearchPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final content = watch(contentProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style: TextStyle(color: Colors.white),
          autofocus: true,
          decoration: new InputDecoration(
            border: noneUnderlineInputBorder,
            enabledBorder: noneUnderlineInputBorder,
            disabledBorder: noneUnderlineInputBorder,
            focusedBorder: noneUnderlineInputBorder,
            errorBorder: noneUnderlineInputBorder,
            focusedErrorBorder: noneUnderlineInputBorder,
            hintStyle: TextStyle(color: Colors.white60),
            hintText: 'Type to search',
          ),
          onSubmitted: (query) {
            if (query.trim().isNotEmpty) {
              context
                  .read(contentProvider)
                  .set(buildEverythingView(context, query));
            }
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: content,
    );
  }
}
