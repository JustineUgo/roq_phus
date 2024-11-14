import 'package:flutter/cupertino.dart';
import 'package:sisyphus/theme/theme.dart';
import 'package:sisyphus/util/extensions.dart';

class OrderSection extends StatefulWidget {
  const OrderSection({
    super.key,
  });

  @override
  State<OrderSection> createState() => _OrderSectionState();
}

class _OrderSectionState extends State<OrderSection> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      color: AppTheme.getTheme.cardColor,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                SizedBox(
                  child: CupertinoSlidingSegmentedControl(
                    thumbColor: context.isDarkMode
                        ? const Color(0xFF21262C)
                        : const Color(0xFFFFFFFF),
                    backgroundColor: context.isDarkMode
                        ? const Color(0xFF111111)
                        : CupertinoColors.tertiarySystemFill,
                    padding: const EdgeInsets.all(3),
                    groupValue: value,
                    children: {
                      0: SizedBox(
                        width: 152,
                        child: Center(
                          child: Text(
                            'Open Orders',
                            style: TextStyle(
                              color: value == 0
                                  ? AppTheme.getTheme.textColor
                                  : AppTheme.getTheme.iconColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      1: Container(
                        width: 152,
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            'Positions',
                            style: TextStyle(
                              color: value == 1
                                  ? AppTheme.getTheme.textColor
                                  : AppTheme.getTheme.iconColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      2: SizedBox(
                        width: 152,
                        child: Center(
                          child: Text(
                            'Order History',
                            style: TextStyle(
                              color: value == 2
                                  ? AppTheme.getTheme.textColor
                                  : AppTheme.getTheme.iconColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )
                    },
                    onValueChanged: (val) {
                      setState(() {
                        value = val ?? 0;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'No Open Orders',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: AppTheme.getTheme.textColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Id pulvinar nullam sit imperdiet\npulvinar.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppTheme.getTheme.iconColor),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
