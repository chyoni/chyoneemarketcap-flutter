import 'package:chyoneemarketcap/constants/gaps.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavTab extends StatelessWidget {
  final String tabName;
  final IconData icon;
  final bool isSelected;
  final void Function() onTapFn;

  const NavTab({
    super.key,
    required this.tabName,
    required this.icon,
    required this.isSelected,
    required this.onTapFn,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFn,
      child: AnimatedOpacity(
        opacity: isSelected ? 1 : 0.6,
        duration: const Duration(milliseconds: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              icon,
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade600,
            ),
            Gaps.v6,
            Text(
              tabName,
              style: TextStyle(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
