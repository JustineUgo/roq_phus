part of 'orderbook_bloc.dart';

class OrderbookEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubscribeEvent extends OrderbookEvent {
  SubscribeEvent({required this.symbol});
  final String symbol;
  @override
  List<Object?> get props => [symbol];
}

class UnsubscribeEvent extends OrderbookEvent {
  UnsubscribeEvent({required this.symbol});
  final String symbol;
  @override
  List<Object?> get props => [symbol];
}