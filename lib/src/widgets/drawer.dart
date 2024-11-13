import 'package:flutter/material.dart';
import 'package:sisyphus/theme/theme.dart';

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
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        child: Padding(
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