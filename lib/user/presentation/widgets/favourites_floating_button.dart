import 'package:flutter/material.dart';
import 'package:news/app/domain/entities/app.dart';

Widget favouritesFloatingButton(BuildContext context) {
  return Container(
    alignment: Alignment.bottomCenter,
    padding: const EdgeInsets.all(15),
    child: FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, App.pageFavourites);
      },
      elevation: 15,
      tooltip: 'Go to favourites',
      child: const Icon(Icons.favorite),
    ),
  );
}
