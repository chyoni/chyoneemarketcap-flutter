class CoinListModel {
  final String code, png64;
  final double rate;
  final int volume, cap, rank;
  final dynamic change_24h;

  const CoinListModel({
    required this.png64,
    required this.rate,
    required this.volume,
    required this.cap,
    required this.rank,
    required this.code,
    required this.change_24h,
  });

  // CoinListModel.fromJson(Map<String, dynamic> json)
  //     : code = json['code'],
  //       png64 = json['png64'],
  //       rate = json['rate'],
  //       volume = json['volume'],
  //       cap = json['cap'],
  //       rank = json['rank'],
  //       change_24h = json['change_24h'];
}
