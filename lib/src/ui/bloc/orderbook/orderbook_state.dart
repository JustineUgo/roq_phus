part of 'orderbook_bloc.dart';


abstract class OrderbookState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OrderbookInitial extends OrderbookState {}

class OrderbookLoading extends OrderbookState  {}

class OrderbookLoaded extends OrderbookState {
  final DepthUpdateModel depthUpdate;

  OrderbookLoaded({required this.depthUpdate});

  @override
  List<Object?> get props => [depthUpdate];
}

class OrderbookError extends OrderbookState {
  final String message;
  OrderbookError({required this.message});
}