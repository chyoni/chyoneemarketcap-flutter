import 'package:chyoneemarketcap/constants/gaps.dart';
import 'package:chyoneemarketcap/constants/sizes.dart';
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const Center(
        child: Text("Markets"),
      ),
    );
  }
}
