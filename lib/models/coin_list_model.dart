class CoinListModel {
  final String code;
  final int rate, volume, cap;

  CoinListModel.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        rate = json['rate'],
        volume = json['volume'],
        cap = json['cap'];
}
