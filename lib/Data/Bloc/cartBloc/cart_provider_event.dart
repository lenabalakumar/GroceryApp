part of 'cart_provider_bloc.dart';

abstract class CartProviderEvent extends Equatable {
  const CartProviderEvent();
}

class CartLoadingEvent extends CartProviderEvent {
  @override
  List<Object?> get props => [];
}

class AddItemToCart extends CartProviderEvent {
  final Product product;

  AddItemToCart({required this.product});

  @override
  List<Object?> get props => [];
}

class ReduceItemToCart extends CartProviderEvent {
  final Product product;

  ReduceItemToCart({required this.product});

  @override
  List<Object?> get props => [];
}

class RemoveItemToCart extends CartProviderEvent {
  final Product product;

  RemoveItemToCart({required this.product});

  @override
  List<Object?> get props => [];
}
