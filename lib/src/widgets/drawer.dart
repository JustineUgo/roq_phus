import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sisyphus/theme/theme.dart';
import 'package:sisyphus/util/extensions.dart';

class FloatingDrawer extends StatelessWidget {
  const FloatingDrawer({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 65,
          right: 10,
          child: Container(
            width: 214,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                'Search',
                'Exchange',
                'Wallets',
                'Roqqu Hub',
                'Log out',
              ]
                  .map(
                    (option) => InkWell(
                      onTap: () {
                        if (scaffoldKey.currentState!.isEndDrawerOpen) {
                          scaffoldKey.currentState?.closeEndDrawer();
                        }
                      },
                      child: option == 'Search'
                          ? (context.isDarkMode
                              ? const SizedBox.shrink()
                              : Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppTheme.getTheme.iconColor
                                            .withOpacity(.2)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                  ),
                                  child: TextField(
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: AppTheme.getTheme.textColor,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.only(
                                          left: 18, top: 12),
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        color: AppTheme.getTheme.iconColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      suffixIcon: const Icon(
                                        CupertinoIcons.search,
                                        color: Color(0xFF2764FF),
                                      ),
                                    ),
                                  ),
                                ))
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 13),
                              child: Row(
                                children: [
                                  Text(
                                    option,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: AppTheme.getTheme.textColor),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
