class Urls{
  static String kLines({required String interval}) => 'klines?symbol=BTCUSDT&interval=$interval';
  static String get binanceWS => 'wss://stream.binance.com:9443/ws';
  static String get price => 'ticker/price?symbols=["BTCUSDT"]';
}