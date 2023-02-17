import 'package:chyoneemarketcap/constants/gaps.dart';
import 'package:chyoneemarketcap/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LeftNavBarScreen extends StatefulWidget {
  const LeftNavBarScreen({super.key});

  @override
  State<LeftNavBarScreen> createState() => _LeftNavBarScreenState();
}

class _LeftNavBarScreenState extends State<LeftNavBarScreen> {
  bool _isOpenTools = true;
  bool _isOpenHelpCenter = false;

  void _onToolsExpansionChanged(bool value) {
    setState(() {
      _isOpenTools = value;
    });
  }

  void _onHCExpansionChanged(bool value) {
    setState(() {
      _isOpenHelpCenter = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                FaIcon(
                  FontAwesomeIcons.solidCircleUser,
                  color: Colors.grey.shade700,
                  size: Sizes.size96,
                ),
                Gaps.v9,
                const Text(
                  "Log In / Register",
                  style: TextStyle(
                    fontSize: Sizes.size28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v20,
                ExpansionTile(
                  initiallyExpanded: true,
                  textColor: Colors.black,
                  iconColor: Colors.grey.shade600,
                  onExpansionChanged: (value) =>
                      _onToolsExpansionChanged(value),
                  title: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.screwdriverWrench,
                        size: Sizes.size20,
                        color: Colors.grey.shade700,
                      ),
                      Gaps.h9,
                      Text(
                        "Tools",
                        style: TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: _isOpenTools
                                ? FontWeight.w600
                                : FontWeight.w400),
                      ),
                    ],
                  ),
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Sizes.size28),
                      child: Column(
                        children: const [
                          ListTile(
                            title: Text("Price Alert"),
                          ),
                          ListTile(
                            title: Text("Free Airdrop"),
                          ),
                          ListTile(
                            title: Text("Converter"),
                          ),
                          ListTile(
                            title: Text("Compare"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size16,
                    horizontal: Sizes.size16,
                  ),
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.gear,
                        size: Sizes.size20,
                        color: Colors.grey.shade700,
                      ),
                      Gaps.h9,
                      const Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ],
                  ),
                ),
                ExpansionTile(
                  initiallyExpanded: false,
                  textColor: Colors.black,
                  iconColor: Colors.grey.shade600,
                  onExpansionChanged: (value) => _onHCExpansionChanged(value),
                  title: Row(
                    children: [
                      Icon(
                        Icons.help,
                        size: Sizes.size20,
                        color: Colors.grey.shade700,
                      ),
                      Gaps.h9,
                      Text(
                        "Help Center",
                        style: TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: _isOpenHelpCenter
                                ? FontWeight.w600
                                : FontWeight.w400),
                      ),
                    ],
                  ),
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Sizes.size28),
                      child: Column(
                        children: const [
                          ListTile(
                            title: Text("Contact Us"),
                          ),
                          ListTile(
                            title: Text("FAQ"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size16,
                    horizontal: Sizes.size16,
                  ),
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.bitcoin,
                        size: Sizes.size20,
                        color: Colors.grey.shade700,
                      ),
                      Gaps.h9,
                      const Text(
                        "About Us",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
