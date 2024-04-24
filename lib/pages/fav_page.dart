import 'package:flutter/material.dart';
import 'package:namer_app/providers/word_provider.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Use final instead of var whenever possible
    final provider = context.watch<WordProvider>();

    if (provider.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.', ),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${provider.favorites.length} favorites:'),
        ),
        for (var pair in provider.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asSnakeCase),
          ),
      ],
    );
  }
}
