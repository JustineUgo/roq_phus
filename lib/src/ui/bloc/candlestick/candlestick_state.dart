part of 'candlestick_bloc.dart';


abstract class CandlestickState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CandlestickInitial extends CandlestickState {}

class CandlestickLoading extends CandlestickState  {}

class CandlestickLoaded extends CandlestickState {
  final List<Candle> candlesticks;
  final SymbolModel symbol;

  CandlestickLoaded({required this.candlesticks, required this.symbol});

  @override
  List<Object?> get props => [candlesticks, symbol];
}

class CandlestickError extends CandlestickState {
  final String message;
  CandlestickError({required this.message});
}