import 'package:flutter/material.dart';
import 'package:sisyphus/src/ui/widgets/order_bottomsheet.dart';
import 'package:sisyphus/theme/theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).bottomSheetTheme.backgroundColor,
        borderRadius: BorderRadius.zero,
        border: Border.all(
          color: AppTheme.getTheme.iconColor.withOpacity(.1),
          width: 1,
        ),
      ),
      child: Container(
        height: 32,
        margin: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.getTheme.green,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet<dynamic>(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext buildContext) {
                      return const OrderBottomSheet();
                    },
                  );
                },
                child: Text(
                  'Buy',
                  style: TextStyle(
                      color: AppTheme.getTheme.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.getTheme.red,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet<dynamic>(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext buildContext) {
                      return const OrderBottomSheet();
                    },
                  );
                },
                child: Text(
                  'Sell',
                  style: TextStyle(
                      color: AppTheme.getTheme.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
