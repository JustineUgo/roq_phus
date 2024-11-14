class DepthUpdateModel {
  final String? eventType;
  final int? eventTime;
  final String? symbol;
  final int? firstUpdateId;
  final int? finalUpdateId;
  final List<dynamic>? bids;
  final List<dynamic>? asks;

  DepthUpdateModel({
    this.eventType,
    this.eventTime,
    this.symbol,
    this.firstUpdateId,
    this.finalUpdateId,
    this.bids,
    this.asks,
  });

  factory DepthUpdateModel.fromJson(Map<String, dynamic> json) {
    return DepthUpdateModel(
      eventType: json['e'] as String?,
      eventTime: json['E'] as int?,
      symbol: json['s'] as String?,
      firstUpdateId: json['U'] as int?,
      finalUpdateId: json['u'] as int?,
      bids: json['b'] as List<dynamic>?,
      asks: json['a'] as List<dynamic>?,
    );
  }
}