import 'package:chyoneemarketcap/constants/gaps.dart';
import 'package:chyoneemarketcap/constants/sizes.dart';
import 'package:chyoneemarketcap/models/coin_list_model.dart';
import 'package:chyoneemarketcap/utils.dart';
import 'package:flutter/material.dart';

class CoinRecord extends StatelessWidget {
  const CoinRecord({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CoinListModel item;

  @override
  Widget build(BuildContext context) {
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
            Gaps.h36,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    Utils.getPriceFormat(item.rate),
                    style: const TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    item.change_24h.toString(),
                    style: const TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
