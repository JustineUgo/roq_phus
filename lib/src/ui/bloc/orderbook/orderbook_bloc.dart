import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sisyphus/src/model/depth_update_model.dart';
import 'package:sisyphus/util/urls.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'orderbook_state.dart';
part 'orderbook_event.dart';

@singleton
class OrderbookBloc extends Bloc<OrderbookEvent, OrderbookState> {
  final channel = WebSocketChannel.connect(Uri.parse(Urls.binanceWS));

  OrderbookBloc() : super(OrderbookInitial()) {
    on<SubscribeEvent>(_subscribe);
  }

  void _subscribe(SubscribeEvent event, Emitter<OrderbookState> emit) async {
    try {
      emit(OrderbookLoading());
      channel.sink.add(json.encode(
        {
          "method": "SUBSCRIBE",
          "params": ["${event.symbol.toLowerCase()}@depth"],
          "id": 1
        },
      ));

      await for (final String value in channel.stream) {
        value;
        Map<String, dynamic> map = json.decode(value) as Map<String, dynamic>;
        if (map['e'] == 'depthUpdate') {
          final depthUpdate = DepthUpdateModel.fromJson(map);
          emit(OrderbookLoaded(depthUpdate: depthUpdate));
        }
      }
    } catch (e) {
      emit(OrderbookError(message: e.toString()));
    }
  }
}
