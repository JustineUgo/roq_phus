class Urls{
  static String kLines({required String symbol, required String interval}) => 'klines?symbol=$symbol&interval=$interval';
}