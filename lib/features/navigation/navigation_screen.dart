import 'package:chyoneemarketcap/constants/sizes.dart';
import 'package:chyoneemarketcap/features/navigation/widgets/nav_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          Offstage(
            offstage: false,
            child: Text("Hello"),
          )
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
            children: const [
              NavTab(
                isSelected: true,
                icon: FontAwesomeIcons.bitcoin,
                tabName: "Markets",
              ),
              NavTab(
                isSelected: false,
                icon: FontAwesomeIcons.magnifyingGlass,
                tabName: "Explore",
              ),
              NavTab(
                isSelected: false,
                icon: FontAwesomeIcons.chartPie,
                tabName: "Portfolio",
              ),
              NavTab(
                isSelected: false,
                icon: FontAwesomeIcons.towerBroadcast,
                tabName: "Community",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
