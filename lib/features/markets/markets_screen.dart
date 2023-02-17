import 'package:chyoneemarketcap/constants/gaps.dart';
import 'package:chyoneemarketcap/constants/sizes.dart';
import 'package:chyoneemarketcap/features/markets/left_nav_bar_screen.dart';
import 'package:chyoneemarketcap/features/markets/widgets/coin_card.dart';
import 'package:chyoneemarketcap/models/coin_list_model.dart';
import 'package:chyoneemarketcap/services/api_service.dart';
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
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final GlobalKey<AnimatedListState> _animatedKey =
      GlobalKey<AnimatedListState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late final TabController _tabController;

  Future<List<CoinListModel>> coinlist = ApiService.getAllCoins();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  Future<void> _onRefresh() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    setState(() {
      coinlist = ApiService.getAllCoins();
    });
  }

  void _onUserTap() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const LeftNavBarScreen(),
        appBar: AppBar(
          leading: GestureDetector(
            onTap: _onUserTap,
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
                  return RefreshIndicator(
                    key: _refreshIndicatorKey,
                    onRefresh: _onRefresh,
                    child: AnimatedList(
                      key: _animatedKey,
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size20,
                        vertical: Sizes.size12,
                      ),
                      initialItemCount: snapshot.data!.length,
                      itemBuilder:
                          (context, index, Animation<double> animation) {
                        final item = snapshot.data![index];
                        return Column(
                          children: [
                            FadeTransition(
                              key: UniqueKey(),
                              opacity: animation,
                              child: SizeTransition(
                                sizeFactor: animation,
                                child: CoinRecord(item: item),
                              ),
                            ),
                            const SizedBox(
                              height: Sizes.size16,
                            ),
                          ],
                        );
                      },
                    ),
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
