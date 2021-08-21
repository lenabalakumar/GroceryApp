class Product {
  int productID;
  String productName;
  String productImageURL;
  double productPrice;
  int productQuantity;
  bool productInStock;
  String productSKU;

  Product(
      {required this.productID,
      required this.productName,
      required this.productImageURL,
      required this.productPrice,
      required this.productQuantity,
      required this.productInStock,
      required this.productSKU});

  Product.fromJson(Map<String, dynamic> json)
      : productID = json['productID'],
        productName = json['productName'],
        productImageURL = json['productImageURL'],
        productPrice = json['productPrice'],
        productQuantity = json['productQuantity'],
        productInStock = json['productInStock'],
        productSKU = json['productSKU'];

  //   factory Vaccination.fromJson(Map<dynamic, dynamic> json) => _VaccinationFromJson(json);

  Map<String, dynamic> toJson() => _productToJson(this);

  @override
  String toString() => "Product<$productID>";
}

Map<String, dynamic> _productToJson(Product product) => <String, dynamic>{
      'productID': product.productID,
      'productName': product.productName,
      'productImageURL': product.productImageURL,
      'productPrice': product.productPrice,
      'productQuantity': product.productQuantity,
      'productInStock': product.productInStock,
      'productSKU': product.productSKU
    };

// class Vaccination {
//   // 1
//   String vaccination;
//   DateTime date;
//   bool done;
//   // 2
//   DocumentReference reference;
//   // 3
//   Vaccination(this.vaccination, {this.date, this.done, this.reference});
//   // 4
//   factory Vaccination.fromJson(Map<dynamic, dynamic> json) => _VaccinationFromJson(json);
//   // 5
//   Map<String, dynamic> toJson() => _VaccinationToJson(this);
//   @override
//   String toString() => "Vaccination<$vaccination>";
// }
