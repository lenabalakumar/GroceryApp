import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:groceryapp/Data/Model/Cart.dart';
import 'package:groceryapp/Data/Model/Product.dart';
import 'package:groceryapp/Data/Repository/CartRepository.dart';

part 'cart_provider_event.dart';
part 'cart_provider_state.dart';

class CartProviderBloc extends Bloc<CartProviderEvent, CartProviderState> {
  CartProviderBloc() : super(CartLoadingState());

  CartRepository cartRepository = new CartRepository();


  @override
  Stream<CartProviderState> mapEventToState(
    CartProviderEvent event,
  ) async* {
    yield CartLoadingState();
    try {
      if (event is AddItemToCart) {
        print('Adding item to cart ${event.product.productID}');
        cartRepository.addItemToCart(event.product);
      } else if (event is ReduceItemToCart) {
        print('Reducing item from cart ${event.product.productID}');
        cartRepository.reduceItemFromCart(event.product);
      } else if (event is RemoveItemToCart) {
        print('Removing item from cart ${event.product.productID}');
        cartRepository.deleteItemFromCart(event.product);
      }
      yield CartLoadedState(
          cartTotal: cartRepository.calculateTotal(),
          cartItems: Cart(cartItems: await cartRepository.loadCartItems()));
    } on Exception {
      yield CartErrorState();
    }
  }
}

// async* {
// yield CartLoadingState();
// try {
// if (event is AddItemToCart) {
// print('Adding item to cart ${event.product.productID}');
// cartRepository.addItemToCart(event.product);
// } else if (event is ReduceItemToCart) {
// print('Reducing item from cart ${event.product.productID}');
// cartRepository.reduceItemFromCart(event.product);
// } else if (event is RemoveItemToCart) {
// print('Removing item from cart ${event.product.productID}');
// cartRepository.deleteItemFromCart(event.product);
// }
// yield CartLoadedState(
// cartTotal: cartRepository.calculateTotal(),
// cartItems: Cart(cartItems: await cartRepository.loadCartItems()));
// } on Exception {
// yield CartErrorState();
// }
// }
