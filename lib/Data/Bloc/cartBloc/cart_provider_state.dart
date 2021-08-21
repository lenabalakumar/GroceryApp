part of 'cart_provider_bloc.dart';

abstract class CartProviderState extends Equatable {
  const CartProviderState();
}

class CartLoadingState extends CartProviderState {
  @override
  List<Object?> get props => [];
}

class CartLoadedState extends CartProviderState {
  final Cart cartItems;
  final double cartTotal;

  const CartLoadedState({this.cartItems = const Cart(), required this.cartTotal});

  @override
  List<Object?> get props => [cartItems, cartTotal];
}

class CartErrorState extends CartProviderState {

  @override
  List<Object?> get props => [];
}
