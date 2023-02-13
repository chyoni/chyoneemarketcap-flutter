import 'package:chyoneemarketcap/constants/gaps.dart';
import 'package:chyoneemarketcap/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PricesScreen extends StatelessWidget {
  const PricesScreen({super.key});

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
                    FontAwesomeIcons.gem,
                    color: Theme.of(context).primaryColor,
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
      ),
      body: const Center(
        child: Text("Markets"),
      ),
    );
  }
}
