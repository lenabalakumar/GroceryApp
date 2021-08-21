part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}

class PlaceOrderEvent extends OrderEvent {
  final String mobileNumber;

  PlaceOrderEvent({required this.mobileNumber});
}
