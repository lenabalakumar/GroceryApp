// import 'package:groceryapp/Data/Bloc/orderBloc/order_bloc.dart';
import 'package:groceryapp/Data/Model/Product.dart';

class Order {
  List<Product> productsFromCart;
  double totalCartValue;
  String userMobileNumber;
  String orderID;
  DateTime orderPlacedTime;

  Order(
      {required this.userMobileNumber,
      required this.totalCartValue,
      required this.productsFromCart,
      required this.orderID,
      required this.orderPlacedTime});

  Map<String, dynamic> toJson() =>
      //     _orderToJson(this);
      //
      //
      // Map<String, dynamic> _orderToJson(Order order) =>
      <String, dynamic>{
        'orderID': orderID,
        'orderPlacedTime': orderPlacedTime,
        'userMobileNumber': userMobileNumber,
        'totalCartValue': totalCartValue,
        // 'productsFromCart': List<dynamic>.from(productsFromCart.map((e) =>
        //     Product(
        //         productID: e.productID,
        //         productName: e.productName,
        //         productImageURL: e.productImageURL,
        //         productPrice: e.productPrice,
        //         productQuantity: e.productQuantity,
        //         productInStock: e.productInStock,
        //         productSKU: e.productSKU))),
        'productsFromCart':
            List<dynamic>.from(productsFromCart.map((e) => e.toJson())),
      };

  // factory Order.fromJson(Map<String, dynamic> json) {
  //   return Order(userMobileNumber: json['userMobilenumber'] as String,
  //       totalCartValue: json['totalCartValue'] as double,
  //       productsFromCart: List<Product>.from(json["product"]));
  // }
  //
  // List<Product> _convertProductsFromCart(List productMap) {
  //
  //   List<Product> product = [];
  //   productMap.forEach((element) {
  //     product.add(Product.fromJson(element));
  //   });
  //   return product;
  // }

  // factory Photo.fromJson(Map<String, dynamic> json) {
  //   return Photo(
  //     albumId: json['albumId'] as int,
  //     id: json['id'] as int,
  //     title: json['title'] as String,
  //     url: json['url'] as String,
  //     thumbnailUrl: json['thumbnailUrl'] as String,
  //   );
  // }
}
//
// Order _orderFromJson(Map<String, dynamic> json) {
//   return Order(
//       userMobileNumber: json['userMobileNumber'] as String,
//       totalCartValue: json['totalCartValue'] as double,
//       productsFromCart:
//           _convertProductsFromCart(json['productFromCart'] as List));
// }
