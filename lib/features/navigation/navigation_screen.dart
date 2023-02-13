import 'package:chyoneemarketcap/constants/sizes.dart';
import 'package:chyoneemarketcap/features/communities/communities_screen.dart';
import 'package:chyoneemarketcap/features/explores/explore_screen.dart';
import 'package:chyoneemarketcap/features/markets/prices_screen.dart';
import 'package:chyoneemarketcap/features/navigation/widgets/nav_tab.dart';
import 'package:chyoneemarketcap/features/portfolios/portfolios_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: selectedIndex != 0,
            child: const PricesScreen(),
          ),
          Offstage(
            offstage: selectedIndex != 1,
            child: const ExploreScreen(),
          ),
          Offstage(
            offstage: selectedIndex != 2,
            child: const PortfoliosScreen(),
          ),
          Offstage(
            offstage: selectedIndex != 3,
            child: const CommunitiesScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size12,
            horizontal: Sizes.size32,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavTab(
                isSelected: selectedIndex == 0,
                icon: FontAwesomeIcons.bitcoin,
                tabName: "Markets",
                onTapFn: () => _onTap(0),
              ),
              NavTab(
                isSelected: selectedIndex == 1,
                icon: FontAwesomeIcons.magnifyingGlass,
                tabName: "Explore",
                onTapFn: () => _onTap(1),
              ),
              NavTab(
                isSelected: selectedIndex == 2,
                icon: FontAwesomeIcons.chartPie,
                tabName: "Portfolio",
                onTapFn: () => _onTap(2),
              ),
              NavTab(
                isSelected: selectedIndex == 3,
                icon: FontAwesomeIcons.towerBroadcast,
                tabName: "Community",
                onTapFn: () => _onTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
