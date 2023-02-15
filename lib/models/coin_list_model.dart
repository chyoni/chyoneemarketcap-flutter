class CoinListModel {
  final String code, png64;
  final double rate;
  final int volume, cap, rank;

  CoinListModel.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        png64 = json['png64'],
        rate = json['rate'],
        volume = json['volume'],
        cap = json['cap'],
        rank = json['rank'];
}
