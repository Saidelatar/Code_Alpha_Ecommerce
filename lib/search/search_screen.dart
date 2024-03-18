import 'package:flutter/material.dart';
import 'package:music_notes_player_app_setup/const.dart';
import 'package:music_notes_player_app_setup/helper/http_hlper.dart';
import 'package:music_notes_player_app_setup/models/favorit_model.dart';
import 'package:music_notes_player_app_setup/search/search_list.dart';
import 'package:music_notes_player_app_setup/widegt/custom_text.dart';
import 'package:music_notes_player_app_setup/widegt/custom_text_field.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'searchScreen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late String query;

  @override
  void initState() {
    super.initState();
    query = ''; // Initialize query
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const CustomText(text: 'Product Search', size: 20, color: color),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              hint: 'Enter a Product name',
              onChanged: (value) {
                setState(() {
                  query = value; // Update the query when text changes
                });
              },
            ),
            const SizedBox(height: 16),
            FutureBuilder(
              future: ApiManger().searchData(query),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  List<FavoritModle> searchList =
                      snapshot.data as List<FavoritModle>;
                  return SearchList(searchList: searchList);
                } else {
                  return const Text('No data found');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
