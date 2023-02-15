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
      "limit": 100,
      "meta": true,
    };
    String jsonBody = json.encode(body);
    final response = await http.post(
      url,
      headers: headers,
      body: jsonBody,
      encoding: Encoding.getByName('utf-8'),
    );
    if (response.statusCode == 200) {
      final tickerResponse = await http
          .get(Uri.parse("https://api.coinpaprika.com/v1/tickers?limit=100"));
      if (tickerResponse.statusCode == 200) {
        final List<dynamic> coins = jsonDecode(response.body);
        final List<dynamic> tickers = jsonDecode(tickerResponse.body);
        for (int i = 0; i < coins.length; i++) {
          final c = CoinListModel(
            cap: coins[i]['cap'],
            code: coins[i]['code'],
            png64: coins[i]['png64'],
            rank: coins[i]['rank'],
            rate: coins[i]['rate'],
            volume: coins[i]['volume'],
            change_24h: tickers[i]['quotes']['USD']['percent_change_24h'],
          );
          coinlist.add(c);
        }
        return coinlist;
      } else {
        throw Error();
      }
    }
    throw Error();
  }
}
