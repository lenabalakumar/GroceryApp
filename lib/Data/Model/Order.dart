import 'package:groceryapp/Data/Model/Product.dart';
import 'package:groceryapp/Data/Model/User.dart';

class Order {
  List<Product> productsFromCart;
  double totalCartValue;
  User user;
  String orderID;
  DateTime orderPlacedTime;

  Order(
      {
      required this.totalCartValue,
      required this.productsFromCart,
      required this.user,
      required this.orderID,
      required this.orderPlacedTime});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'orderID': orderID,
        'orderPlacedTime': orderPlacedTime,
        'totalCartValue': totalCartValue,
        'User': User(
                userFullName: this.user.userFullName,
                userAddressLineOne: this.user.userAddressLineOne,
                userAddressLineTwo: this.user.userAddressLineTwo,
                userMobileNumber: this.user.userMobileNumber,
                userCityName: this.user.userCityName,
                userPincode: this.user.userPincode,
                userLandmark: this.user.userLandmark)
            .toJson(),
        'productsFromCart':
            List<dynamic>.from(productsFromCart.map((e) => e.toJson())),
      };
}
