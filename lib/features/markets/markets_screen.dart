import 'package:chyoneemarketcap/constants/gaps.dart';
import 'package:chyoneemarketcap/constants/sizes.dart';
import 'package:chyoneemarketcap/models/coin_list_model.dart';
import 'package:chyoneemarketcap/services/api_service.dart';
import 'package:chyoneemarketcap/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final tabs = [
  "Coins",
  "Watchlists",
  "Chains",
  "Dex Pairs",
  "Categories",
  "Exchanges",
];

class PricesScreen extends StatefulWidget {
  const PricesScreen({super.key});

  @override
  State<PricesScreen> createState() => _PricesScreenState();
}

class _PricesScreenState extends State<PricesScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  final Future<List<CoinListModel>> coinlist = ApiService.getAllCoins();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(
              FontAwesomeIcons.solidCircleUser,
              size: Sizes.size28,
              color: Colors.grey.shade500,
            ),
          ),
          title: Text(
            "Market Cap",
            style: TextStyle(
              fontSize: Sizes.size16,
              color: Theme.of(context).primaryColor,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: Sizes.size20,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.diamond,
                      color: Theme.of(context).primaryColor,
                      size: Sizes.size28,
                    ),
                  ),
                  Gaps.h20,
                  GestureDetector(
                    child: Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            )
          ],
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            splashFactory: NoSplash.splashFactory,
            isScrollable: true,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            labelPadding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
              vertical: Sizes.size16,
            ),
            indicatorColor: Theme.of(context).primaryColor,
            indicatorWeight: 4,
            tabs: [
              for (var tab in tabs) Text(tab),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            FutureBuilder(
              future: coinlist,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size20,
                      vertical: Sizes.size12,
                    ),
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: Sizes.size16,
                    ),
                    itemBuilder: (context, index) {
                      final item = snapshot.data![index];
                      return Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: Sizes.size32,
                                child: Center(
                                  child: Text(
                                    item.rank.toString(),
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: Sizes.size16 + Sizes.size1,
                                    ),
                                  ),
                                ),
                              ),
                              Gaps.h16,
                              Image.network(
                                item.png64,
                                width: Sizes.size28,
                              ),
                              Gaps.h12,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.code),
                                  Text(Utils.getBnFormat(item.cap)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              },
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(tab),
              )
          ],
        ),
      ),
    );
  }
}
