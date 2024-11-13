import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sisyphus/theme/theme.dart';

class OrderBottomSheet extends StatefulWidget {
  const OrderBottomSheet({super.key});

  @override
  State<OrderBottomSheet> createState() => _OrderBottomSheetState();
}

class _OrderBottomSheetState extends State<OrderBottomSheet> {
  int selectedValue = 0;
  String activeOption = 'Limit';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 34, 30, 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              child: Column(
                children: [
                  CupertinoSlidingSegmentedControl(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    thumbColor:
                        Theme.of(context).bottomSheetTheme.backgroundColor!,
                    padding: const EdgeInsets.all(1),
                    groupValue: selectedValue,
                    children: {
                      0: Container(
                        width: 300,
                        padding: const EdgeInsets.all(10),
                        decoration: selectedValue != 0
                            ? null
                            : BoxDecoration(
                                border:
                                    Border.all(color: AppTheme.getTheme.green),
                                borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text('Buy',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: selectedValue == 0
                                      ? AppTheme.getTheme.textColor
                                      : AppTheme.getTheme.iconColor)),
                        ),
                      ),
                      1: Container(
                        width: 300,
                        padding: const EdgeInsets.all(10),
                        decoration: selectedValue != 1
                            ? null
                            : BoxDecoration(
                                border:
                                    Border.all(color: AppTheme.getTheme.green),
                                borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text('Sell',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: selectedValue == 1
                                      ? AppTheme.getTheme.textColor
                                      : AppTheme.getTheme.iconColor)),
                        ),
                      ),
                    },
                    onValueChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['Limit', 'Market', 'Stop-Limit'].map((option) {
                bool isSelected = activeOption == option;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      activeOption = option;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color:
                          isSelected ? AppTheme.getTheme.selectionColor : null,
                    ),
                    child: Center(
                      child: Text(
                        option,
                        style: TextStyle(
                          fontWeight:
                              isSelected ? FontWeight.w700 : FontWeight.w500,
                          fontSize: 14,
                          color: isSelected
                              ? AppTheme.getTheme.textColor
                              : AppTheme.getTheme.iconColor,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            Row(
              children: [
                SizedBox(
                  width: 20,
                  child: Checkbox(
                    value: false,
                    fillColor: WidgetStateProperty.all(
                        Theme.of(context).bottomSheetTheme.backgroundColor!),
                    checkColor: AppTheme.getTheme.iconColor,
                    side: BorderSide(color: AppTheme.getTheme.borderColor),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Post Only',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.getTheme.iconColor),
                ),
                const SizedBox(width: 5),
                Icon(Icons.info_outline,
                    size: 18, color: AppTheme.getTheme.iconColor),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.getTheme.iconColor),
                ),
                Text(
                  '0.00',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.getTheme.iconColor),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff483BEB),
                    Color(0xff7847E1),
                    Color(0xffDD568D),
                  ],
                ),
              ),
              child: Center(
                child: Text('Buy BTC',
                    style: TextStyle(
                        color: AppTheme.getTheme.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
              ),
            ),
            const SizedBox(height: 15),
            Divider(color: AppTheme.getTheme.iconColor.withOpacity(.2)),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total account value',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.getTheme.iconColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '0.00',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.getTheme.textColor),
                    ),
                  ],
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    children: [
                      Text(
                        'NGN',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.getTheme.iconColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Icon(Icons.expand_more,
                            color: AppTheme.getTheme.iconColor),
                      ),
                    ],
                  ),
                ])
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Open Orders',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.getTheme.iconColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '0.00',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.getTheme.textColor),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.getTheme.iconColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '0.00',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.getTheme.textColor),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                  backgroundColor:
                      WidgetStateProperty.all(const Color(0xFF2764FF))),
              child: Text('Deposit',
                  style: TextStyle(
                      color: AppTheme.getTheme.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}