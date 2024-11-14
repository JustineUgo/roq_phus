class Urls{
  static String kLines({required String symbol, required String interval}) => 'klines?symbol=$symbol&interval=$interval';
  static String get binanceWS => 'wss://stream.binance.com:9443/ws';
}