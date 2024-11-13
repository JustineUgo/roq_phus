import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sisyphus/src/widgets/footer.dart';
import 'package:sisyphus/src/widgets/header.dart';
import 'package:sisyphus/theme/theme.dart';
import 'package:sisyphus/util/assets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          AssetsIcons.logo,
          colorFilter:
              ColorFilter.mode(AppTheme.getTheme.textColor, BlendMode.srcIn),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: const Color(0xFFF0A0A0),
              backgroundImage: AssetImage(AssetsImages.profile),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SvgPicture.asset(
              AssetsIcons.globeIcon,
              colorFilter: ColorFilter.mode(
                  AppTheme.getTheme.iconColor, BlendMode.srcIn),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SvgPicture.asset(
              AssetsIcons.menuIcon,
              colorFilter: ColorFilter.mode(
                  AppTheme.getTheme.iconColor, BlendMode.srcIn),
            ),
          ),
        ],
      ),
      bottomSheet: const Footer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8),
              const Header(),
              const SizedBox(height: 8),
              Container(
                height: 500,
                color: AppTheme.getTheme.cardColor,
              ),
              const SizedBox(height: 8),
              Container(
                height: 400,
                color: AppTheme.getTheme.cardColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
