import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/build_data_view.dart';

class WidgetValue extends StateNotifier<Widget> {
  WidgetValue() : super(SizedBox.shrink());
  void setWidget(Widget widget) {
    state = widget;
  }
}

final contentProvider = StateNotifierProvider((ref) => WidgetValue());

class NewsSearchPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final content = watch(contentProvider.state);
    final noneUnderlineInputBorder =
        UnderlineInputBorder(borderSide: BorderSide(style: BorderStyle.none));
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
            if (!query.trim().isEmpty) {
              context
                  .read(contentProvider)
                  .setWidget(buildEverythingView(context, query));
            }
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: content,
    );
  }
}
