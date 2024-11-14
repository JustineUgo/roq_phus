import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sisyphus/src/ui/bloc/candlestick/candlestick_bloc.dart';
import 'package:sisyphus/theme/theme.dart';
import 'package:sisyphus/util/assets.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.getTheme.cardColor,
      padding: const EdgeInsets.only(bottom: 16.0, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const SizedBox(width: 16.0),
                    SvgPicture.asset(AssetsIcons.btuUsd),
                    const SizedBox(width: 8),
                    DropdownButton<String>(
                      value: 'BTC/USDT',
                      style: TextStyle(
                        color: AppTheme.getTheme.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                      underline: const SizedBox.shrink(),
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: SvgPicture.asset(
                          AssetsIcons.dropdownIcon,
                          colorFilter: ColorFilter.mode(
                              AppTheme.getTheme.textColor, BlendMode.srcIn),
                        ),
                      ),
                      items: <String>['BTC/USDT'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              BlocConsumer<CandlestickBloc, CandlestickState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return state is CandlestickLoaded
                        ? Text(
                            '\$${state.symbol.price}',
                            style: TextStyle(
                              color: AppTheme.getTheme.green,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          )
                        : const Text('--');
                  }),
            ],
          ),
          const SizedBox(height: 14.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HeaderBand(
                  textColor: AppTheme.getTheme.green,
                  icon: Icons.access_time_rounded,
                  iconSize: 18,
                ),
                HeaderBand(
                  textColor: AppTheme.getTheme.textColor,
                  icon: Icons.north,
                ),
                HeaderBand(
                  textColor: AppTheme.getTheme.textColor,
                  icon: Icons.south,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderBand extends StatelessWidget {
  const HeaderBand({
    super.key,
    required this.textColor,
    required this.icon,
    this.iconSize = 14.0,
  });
  final Color textColor;
  final IconData icon;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: AppTheme.getTheme.iconColor.withOpacity(.1)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppTheme.getTheme.iconColor, size: iconSize),
              const SizedBox(width: 6),
              Text(
                '24h change',
                style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.getTheme.iconColor,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '520.80 +1.25%',
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
