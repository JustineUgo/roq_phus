import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sisyphus/src/ui/widgets/drawer.dart';
import 'package:sisyphus/src/ui/widgets/footer.dart';
import 'package:sisyphus/src/ui/widgets/header.dart';
import 'package:sisyphus/src/ui/widgets/main_section.dart';
import 'package:sisyphus/src/ui/widgets/order_section.dart';
import 'package:sisyphus/theme/theme.dart';
import 'package:sisyphus/util/assets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
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
          InkWell(
            onTap: () {
              if (_scaffoldKey.currentState!.isEndDrawerOpen) {
                _scaffoldKey.currentState?.closeEndDrawer();
              } else {
                _scaffoldKey.currentState?.openEndDrawer();
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset(
                AssetsIcons.menuIcon,
                colorFilter: ColorFilter.mode(
                    AppTheme.getTheme.iconColor, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: const Footer(),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8),
              Header(),
              SizedBox(height: 8),
              MainSection(),
              SizedBox(height: 8),
              OrderSection()
            ],
          ),
        ),
      ),
      endDrawer: FloatingDrawer(scaffoldKey: _scaffoldKey),
    );
  }
}
