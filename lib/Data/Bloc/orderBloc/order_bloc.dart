import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:groceryapp/Data/Repository/CartRepository.dart';
import 'package:groceryapp/Data/Repository/OrderRepository.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial());

  CartRepository cartRepository = new CartRepository();
  OrderRepository orderRepository = OrderRepository();

  @override
  Stream<OrderState> mapEventToState(
    OrderEvent event,
  ) async* {
    yield OrderInitial();
    try {
      if (event is PlaceOrderEvent) {
        orderRepository.placeOrder(
          cartRepository.cartItems,
          cartRepository.totalCValue,
          event.mobileNumber,
          Uuid().v4(),
          DateTime.now()
        );
      }
    } on Exception {}
  }
}