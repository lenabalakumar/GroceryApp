import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:groceryapp/Data/Model/Order.dart';
import 'package:groceryapp/Data/Model/Product.dart';
import 'package:groceryapp/Data/Model/User.dart';
import 'package:groceryapp/Data/Repository/CartRepository.dart';

class OrderRepository extends Equatable {
  List<Order> orders = [];

  CartRepository cartRepository = CartRepository();

  void placeOrder(
      List<Product> cartItems, double cartTotal, String orderID, DateTime orderPlacedTime, User user) {
    orders.add(Order(
      orderID: orderID,
        orderPlacedTime: orderPlacedTime,
        totalCartValue: cartTotal,
        productsFromCart: cartItems,
    user: user));
    addOrderToFirebase(cartItems, cartTotal, orderID, orderPlacedTime, user);
  }

  Future<void> addOrderToFirebase(List<Product> cartItems, double cartTotal,
      String orderID, DateTime orderPlacedTime, User user) async {
    final CollectionReference collection =
        FirebaseFirestore.instance.collection("Orders");

    // Map<String, dynamic> data = <String, dynamic>{
    //   "UserMobileNumber": userMobileNumber,
    //   "OrderTotal": cartTotal,
    //   "Product": cartItems.map((e) => {
    //         "ProductID": e.productID,
    //         "ProductName": e.productName,
    //         "ProductQuantity": e.productQuantity
    //       })
    // };

    Order order = new Order(
      orderID: orderID,
        orderPlacedTime: orderPlacedTime,
        totalCartValue: cartTotal,
        productsFromCart: cartItems.map((e) {
          return Product(
              productID: e.productID,
              productName: e.productName,
              productImageURL: e.productImageURL,
              productPrice: e.productPrice,
              productQuantity: e.productQuantity,
              productInStock: e.productInStock,
              productSKU: e.productSKU);
        }).toList(), user: user);

    await collection.add(order.toJson()).whenComplete(() => cartRepository.cartItems = []);

  }

  @override
  List<Object?> get props => [];
}
