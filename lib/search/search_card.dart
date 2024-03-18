import 'package:flutter/material.dart';
import 'package:music_notes_player_app_setup/models/favorit_model.dart';

class SearchCard extends StatelessWidget {
  final FavoritModle favoritModle;
  const SearchCard({
    super.key,
    required this.favoritModle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(favoritModle.image!),
        title: Text(favoritModle.name!),
      ),
    );
  }
}
