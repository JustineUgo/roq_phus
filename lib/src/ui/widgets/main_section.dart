import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sisyphus/src/ui/bloc/candlestick/candlestick_bloc.dart';
import 'package:sisyphus/src/ui/bloc/orderbook/orderbook_bloc.dart';
import 'package:sisyphus/theme/theme.dart';
import 'package:sisyphus/util/assets.dart';
import 'package:sisyphus/util/extensions.dart';

class MainSection extends StatefulWidget {
  const MainSection({
    super.key,
  });

  @override
  State<MainSection> createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection> {
  PageController pageController = PageController();

  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: AppTheme.getTheme.cardColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CupertinoSlidingSegmentedControl(
                padding: const EdgeInsets.all(5),
                groupValue: selectedValue,
                children: {
                  0: Container(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Charts',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.getTheme.textColor,
                          fontWeight: selectedValue == 0
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  1: Container(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Orderbook',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.getTheme.textColor,
                          fontWeight: selectedValue == 1
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  2: Container(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Recent trades',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.getTheme.textColor,
                          fontWeight: selectedValue == 2
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                },
                onValueChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                  pageController.jumpToPage((value ?? 0).toInt());
                },
              ),
            ),
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: const [
                ChartWidget(),
                OrderBookWidget(),
                Center(child: Text('Recent trades')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChartWidget extends StatefulWidget {
  const ChartWidget({super.key});

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  String timeline = '1D';
  String symbol = 'BTCUSDT';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Time',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppTheme.getTheme.iconColor,
                  ),
                ),
              ),
              ...['1H', '2H', '4H', '1D', '1M'].map((time) {
                bool isSelected = timeline == time;
                return InkWell(
                  onTap: () {
                    setState(() {
                      timeline = time;
                    });

                    BlocProvider.of<CandlestickBloc>(context)
                        .add(GetCandlesticks(interval: timeline));
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color:
                          isSelected ? AppTheme.getTheme.selectionColor : null,
                    ),
                    child: Text(
                      time,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: isSelected
                            ? AppTheme.getTheme.textColor
                            : AppTheme.getTheme.iconColor,
                      ),
                    ),
                  ),
                );
              }),
              DropdownButton<String>(
                value: '',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.getTheme.iconColor),
                underline: const SizedBox.shrink(),
                icon:
                    Icon(Icons.expand_more, color: AppTheme.getTheme.iconColor),
                items: <String>['', '1H', '2H', '4H', '1D', '1W', '1M']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    timeline = value ?? '1D';
                  });

                  BlocProvider.of<CandlestickBloc>(context)
                      .add(GetCandlesticks(interval: timeline));
                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                        color: AppTheme.getTheme.iconColor.withOpacity(.3)),
                    left: BorderSide(
                        color: AppTheme.getTheme.iconColor.withOpacity(.3)),
                  ),
                ),
                child: SvgPicture.asset(AssetsIcons.candleIcon),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, top: 6, bottom: 6),
                child: Text(
                  'Fx Indicators',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppTheme.getTheme.iconColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                  color: AppTheme.getTheme.iconColor.withOpacity(.2)),
              bottom: BorderSide(
                  color: AppTheme.getTheme.iconColor.withOpacity(.2)),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: !context.isDarkMode ? 8 : 0),
            child: Row(
              children: [
                if (context.isDarkMode)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    decoration: BoxDecoration(
                        color: AppTheme.getTheme.selectionColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      'Trading view',
                      style: TextStyle(
                        color: AppTheme.getTheme.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                if (context.isDarkMode)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Depth',
                      style: TextStyle(
                        color: AppTheme.getTheme.iconColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                SvgPicture.asset(
                  AssetsIcons.expandIcon,
                  colorFilter: ColorFilter.mode(
                      AppTheme.getTheme.iconColor, BlendMode.srcIn),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Container(
                width: 16,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                        color: AppTheme.getTheme.iconColor.withOpacity(.2)),
                  ),
                ),
              ),
              Expanded(
                child: BlocConsumer<CandlestickBloc, CandlestickState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      bool isLoaded = state is CandlestickLoaded;
                      return Candlesticks(
                        actions: !isLoaded
                            ? []
                            : [
                                ToolBarAction(
                                  width: 80,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(right: 8),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color:
                                                  AppTheme.getTheme.iconColor),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Icon(Icons.expand_more,
                                            size: 14,
                                            color: AppTheme.getTheme.textColor),
                                      ),
                                      Text(
                                        'BTC/USD',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                          color: AppTheme.getTheme.iconColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                                ...[
                                  {'O': state.candlesticks.first.open},
                                  {'H': state.candlesticks.first.high},
                                  {'L': state.candlesticks.first.low}
                                ].map((property) {
                                  return ToolBarAction(
                                    width: 80,
                                    child: Row(
                                      children: [
                                        Text(
                                          '${property.keys.first} ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                            color: AppTheme.getTheme.iconColor,
                                          ),
                                        ),
                                        Text(
                                          '${property.values.first}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                            color: AppTheme.getTheme.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {},
                                  );
                                }),
                              ],
                        candles: !isLoaded ? [] : state.candlesticks,
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OrderBookWidget extends StatefulWidget {
  const OrderBookWidget({super.key});

  @override
  State<OrderBookWidget> createState() => _OrderBookWidgetState();
}

class _OrderBookWidgetState extends State<OrderBookWidget> {
  int indicatorIndex = 0;
  List<Widget> indicators = [
    SvgPicture.asset(AssetsIcons.indicator1),
    SvgPicture.asset(AssetsIcons.indicator2),
    SvgPicture.asset(AssetsIcons.indicator3)
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(3, (index) {
                    bool isSelected = index == indicatorIndex;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          indicatorIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(
                            vertical: 11, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: isSelected
                              ? AppTheme.getTheme.selectionColor
                              : null,
                        ),
                        child: indicators[index],
                      ),
                    );
                  }).toList(),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  decoration: BoxDecoration(
                    color: AppTheme.getTheme.selectionColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: DropdownButton<String>(
                    isDense: true,
                    value: '10',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.getTheme.textColor),
                    underline: const SizedBox.shrink(),
                    icon: Icon(Icons.expand_more,
                        color: AppTheme.getTheme.iconColor),
                    items: <String>['10'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.getTheme.iconColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '(USDT)',
                      style: TextStyle(
                          fontSize: 10,
                          color: AppTheme.getTheme.iconColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Amounts',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.getTheme.iconColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '(BTC)',
                      style: TextStyle(
                          fontSize: 10,
                          color: AppTheme.getTheme.iconColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.getTheme.iconColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 4),
            BlocConsumer<OrderbookBloc, OrderbookState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is OrderbookLoading) {
                  return Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).gold,
                    ),
                  );
                }
                if (state is OrderbookLoaded) {
                  return Column(
                    children: [
                      Column(
                        children:
                            (state.depthUpdate.asks ?? []).take(5).map((asks) {
                          String price = (double.tryParse(asks[0]) ?? 0)
                              .toStringAsFixed(2);
                          String amount = (double.tryParse(asks[1]) ?? 0)
                              .toStringAsFixed(2);
                          double total =
                              double.parse(price) * double.parse(amount);
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    price.toString(),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.getTheme.red,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    amount.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.getTheme.textColor,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    total.toStringAsFixed(2),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.getTheme.textColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (double.tryParse(state.depthUpdate.asks![0][0]) ??
                                      0)
                                  .toStringAsFixed(2),
                              style: TextStyle(
                                color: AppTheme.getTheme.green,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(
                                Icons.north,
                                size: 18,
                                color: AppTheme.getTheme.green,
                              ),
                            ),
                            Text(
                              (double.tryParse(state.depthUpdate.bids![0][0]) ??
                                      0)
                                  .toStringAsFixed(2),
                              style: TextStyle(
                                color: AppTheme.getTheme.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children:
                            (state.depthUpdate.bids ?? []).take(5).map((bids) {
                          String price = (double.tryParse(bids[0]) ?? 0)
                              .toStringAsFixed(2);
                          String amount = (double.tryParse(bids[1]) ?? 0)
                              .toStringAsFixed(2);
                          double total =
                              double.parse(price) * double.parse(amount);
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    price.toString(),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.getTheme.green,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    amount.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.getTheme.textColor,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    total.toStringAsFixed(2),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.getTheme.textColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  );
                }
                return const Center(
                  child: Text('Orderbook'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
