part of 'candlestick_bloc.dart';

class CandlestickEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCandlesticks extends CandlestickEvent {
  GetCandlesticks({required this.interval});
  final String interval;
  @override
  List<Object?> get props => [interval];
}
