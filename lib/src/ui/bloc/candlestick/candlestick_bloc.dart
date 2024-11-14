
import 'package:bloc/bloc.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sisyphus/injection/injection.dart';
import 'package:sisyphus/src/repositories/repository.dart';

part 'candlestick_state.dart';
part 'candlestick_event.dart';


@singleton
class CandlestickBloc extends Bloc<CandlestickEvent, CandlestickState> {
  final Repo repository = getIt<Repo>();
  CandlestickBloc() : super(CandlestickInitial()) {
    on<GetCandlesticks>(_getCandlesticks);
  }

  Future _getCandlesticks(GetCandlesticks event, Emitter<CandlestickState> emit) async {
    emit(CandlestickLoading());
    try {
      List<dynamic> response = await repository.getCandlesticks(symbol: event.symbol, interval: event.interval);
      List<Candle> candles = response.map((e) => Candle.fromJson(e))
        .toList()
        .reversed
        .toList();
      emit(CandlestickLoaded(candlesticks: candles));
    } 
    catch (e) {
      emit(CandlestickError(message: e.toString()));
    }
  }

}