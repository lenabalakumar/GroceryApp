// import 'package:equatable/equatable.dart';
import 'package:groceryapp/Data/Model/Product.dart';

class CartRepository {
  CartRepository._privateConstructor();

  static final CartRepository _instance = CartRepository._privateConstructor();

  factory CartRepository() {
    return _instance;
  }

  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  set cartItems(List<Product> value) {
    _cartItems = value;
  }

  void addItemToCart(Product productAddedToCart) {
    int itemIndex = _cartItems.indexWhere((existingProductInCart) =>
        existingProductInCart.productID == productAddedToCart.productID);

    if (itemIndex == -1) {
      _cartItems.add((productAddedToCart));
      calculateTotal();
    } else {
      if (_cartItems[itemIndex].productQuantity >= 9) {
        _cartItems[itemIndex].productQuantity = 10;
      } else {
        _cartItems[itemIndex].productQuantity =
            _cartItems[itemIndex].productQuantity + 1;
      }
    }
    calculateTotal();
  }

  void reduceItemFromCart(Product productToReduce) {
    int itemIndex = _cartItems.indexWhere((existingProductInCart) =>
        existingProductInCart.productID == productToReduce.productID);

    if (itemIndex != -1) {
      if (productToReduce.productQuantity > 1) {
        _cartItems[itemIndex].productQuantity =
            _cartItems[itemIndex].productQuantity - 1;
      } else
        _cartItems.remove(productToReduce);
    }
    calculateTotal();
  }

  void deleteItemFromCart(Product productToDelete) {
    productToDelete.productQuantity = 1;
    _cartItems.remove(productToDelete);
    calculateTotal();
  }

  int get cartLength => _cartItems.length;

  double calculateTotal() {
    double totalCartValue = 0;

    _cartItems.forEach((itemsInCart) {
      totalCartValue += itemsInCart.productPrice * itemsInCart.productQuantity;
    });
    print("Total value inside cRepo ---- $totalCartValue");
    return totalCartValue;
  }

  double get totalCValue => calculateTotal();

  Future<List<Product>> loadCartItems() =>
      Future.delayed(Duration(microseconds: 2000), () => _cartItems);
}
