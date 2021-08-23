part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}

class PlaceOrderEvent extends OrderEvent {
  final User userDetails;

  PlaceOrderEvent({required this.userDetails});
}
