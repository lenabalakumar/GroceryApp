import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:groceryapp/Data/Model/Product.dart';

class ProductRepository {
  List<Product> topProducts = [];
  List<Product> topFruits = [];

  Product product = new Product(
      productID: 0,
      productName: '',
      productImageURL: '',
      productPrice: 0.00,
      productQuantity: 0,
      productInStock: false,
      productSKU: '');

  Future<List<Product>> fetchTopProducts() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("Product").get();

    snapshot.docs.forEach((productSnapshot) {
      product = Product(
          productID: productSnapshot.get("productID"),
          productName: productSnapshot.get("productName"),
          productImageURL: productSnapshot.get("productImageURL"),
          productPrice: productSnapshot.get("productPrice"),
          productQuantity: productSnapshot.get("productQuantity"),
          productInStock: productSnapshot.get("productInStock"),
          productSKU: productSnapshot.get("productSKU"));
      topProducts.add(product);
      print('TopProducts length: ${topProducts.length}');
    });
    return topProducts;
  }

  Future<List<Product>> fetchTopFruits() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("TopFruits").get();

    snapshot.docs.forEach((productSnapshot) {
      product = Product(
          productID: productSnapshot.get("productID"),
          productName: productSnapshot.get("productName"),
          productImageURL: productSnapshot.get("productImageURL"),
          productPrice: productSnapshot.get("productPrice"),
          productQuantity: productSnapshot.get("productQuantity"),
          productInStock: productSnapshot.get("productInStock"),
          productSKU: productSnapshot.get("productSKU"));
      topFruits.add(product);
      print('TopFruits length: ${topFruits.length}');
    });
    return topFruits;
  }
}
