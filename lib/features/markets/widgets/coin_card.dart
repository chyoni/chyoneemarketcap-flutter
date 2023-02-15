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
                  Container(
                    padding: const EdgeInsets.all(Sizes.size10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Sizes.size5,
                      ),
                      color: item.change_24h > 0
                          ? Colors.green.shade200
                          : Colors.red.shade200,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        item.change_24h > 0
                            ? Icon(
                                Icons.arrow_drop_up_sharp,
                                color: Colors.green.shade900,
                              )
                            : Icon(Icons.arrow_drop_down_sharp,
                                color: Colors.red.shade900),
                        Text(
                          item.change_24h > 0
                              ? "+${item.change_24h.toString()}"
                              : item.change_24h.toString(),
                          style: TextStyle(
                            color: item.change_24h > 0
                                ? Colors.green.shade900
                                : Colors.red.shade900,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ],
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
