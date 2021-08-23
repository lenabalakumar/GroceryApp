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

  Map<String, dynamic> toJson() => <String, dynamic>{
    'productID': this.productID,
    'productName': this.productName,
    'productImageURL': this.productImageURL,
    'productPrice': this.productPrice,
    'productQuantity': this.productQuantity,
    'productInStock': this.productInStock,
    'productSKU': this.productSKU
  };

  @override
  String toString() => "Product<$productID>";
}