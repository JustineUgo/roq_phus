class SymbolModel {
  final String symbol;
  final double price;

  SymbolModel({
    required this.symbol,
    required this.price,
  });

  factory SymbolModel.fromJson(Map<String, dynamic> json) {
    return SymbolModel(
      symbol: json['symbol'] as String,
      price: double.parse(json['price'] as String),
    );
  }
}