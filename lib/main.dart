import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sisyphus/injection/injection.dart';
import 'package:sisyphus/src/ui/bloc/candlestick/candlestick_bloc.dart';
import 'package:sisyphus/src/ui/bloc/orderbook/orderbook_bloc.dart';
import 'package:sisyphus/src/ui/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CandlestickBloc>(create: (context)=> CandlestickBloc() ),
        BlocProvider<OrderbookBloc>(create: (context)=> OrderbookBloc()),
      ],
      child: MaterialApp(
        title: 'Sisyphus',
        theme: ThemeData(
          fontFamily: 'Satoshi',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light,
          scaffoldBackgroundColor: const Color(0xFFF8F8F9),
          appBarTheme:
              const AppBarTheme(backgroundColor: Color(0xFFFFFFFF), elevation: 0),
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Color(0xFFFFFFFF)),
        ),
        darkTheme: ThemeData(
          fontFamily: 'Satoshi',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF1C2127),
          appBarTheme:
              const AppBarTheme(backgroundColor: Color(0xFF17181B), elevation: 0),
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Color(0xFF20252B)),
        ),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}
