import 'package:flutter/material.dart';
import 'package:music_notes_player_app_setup/models/favorit_model.dart';
import 'package:music_notes_player_app_setup/search/search_card.dart';

class SearchList extends StatelessWidget {
  // Replace 'Movie' with your actual data model
  final List<FavoritModle> searchList;
  const SearchList({
    Key? key,
    required this.searchList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, index) {
          return SearchCard(
            favoritModle: searchList[index],
          );
        },
      ),
    );
  }
}
