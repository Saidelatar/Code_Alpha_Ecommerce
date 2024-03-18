import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music_notes_player_app_setup/models/favorit_model.dart';

import '../models/product_model.dart';

class ApiManger {
  static Future<DataModelProduct> getData() async {
    Uri url = Uri.parse("https://student.valuxapps.com/api/products");
    var response = await http.get(url);
    print(response.body);
    var json = jsonDecode(response.body);
    //var liat = ;

    var data = DataModelProduct.fromJson(json);

    /// data.data!.dataM!.length;
    print("${data.data!.dataM}>>>>>>>>>>>>>>>>>>>>>>");

    return data;
  }

  Future<List<FavoritModle>> searchData(String query) async {
    try {
      String encodedQuery = Uri.encodeComponent(query);
      Uri url = Uri.parse(
          "https://student.valuxapps.com/api/products?query=$encodedQuery");

      print("Search URL: $url"); // Debug statement to check the formed URL

      var response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        print(
            "Search API Response: $data"); // Debug statement to check the response data

        List<dynamic> results = data['data']['data'];
        List<FavoritModle> productList =
            results.map((json) => FavoritModle.fromJson(json)).toList();

        print(
            "Search Results: $productList"); // Debug statement to check the parsed results

        return productList;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print("Search Error: $e"); // Debug statement to check for any exceptions
      throw Exception('Failed: $e');
    }
  }
}
