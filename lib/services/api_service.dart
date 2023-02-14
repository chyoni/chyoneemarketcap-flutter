import 'dart:convert';

import 'package:chyoneemarketcap/models/coin_list_model.dart';
import 'package:chyoneemarketcap/services/api_key.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseURL = "https://api.livecoinwatch.com";
  static final Map<String, String> headers = {
    "Content-Type": "application/json",
    "x-api-key": coinAPiKey,
  };

  static Future<List<CoinListModel>> getAllCoins() async {
    final List<CoinListModel> coinlist = [];
    final url = Uri.parse('$baseURL/coins/list');
    Map<String, dynamic> body = {
      "currency": "USD",
      "sort": "rank",
      "order": "ascending",
      "offset": 0,
      "limit": 2,
      "meta": false,
    };
    String jsonBody = json.encode(body);
    final response = await http.post(
      url,
      headers: headers,
      body: jsonBody,
      encoding: Encoding.getByName('utf-8'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> coins = jsonDecode(response.body);
      for (var coin in coins) {
        final c = CoinListModel.fromJson(coin);
        coinlist.add(c);
      }
      return coinlist;
    }
    throw Error();
  }
}
