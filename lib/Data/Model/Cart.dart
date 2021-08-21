import 'package:equatable/equatable.dart';
import 'package:groceryapp/Data/Model/Product.dart';

class Cart extends Equatable{
  final List<Product> cartItems;

  const Cart({this.cartItems = const <Product>[]});

  @override
  List<Object?> get props => [];
}