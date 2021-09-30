import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/Data/Bloc/cartBloc/cart_provider_bloc.dart';
import 'package:groceryapp/Data/Model/Product.dart';

Widget productCard(BuildContext context,Product product) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
    child: Container(
      width: MediaQuery.of(context).size.width * 2 / 5,
      height: MediaQuery.of(context).size.height * 2 / 7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.25),
              offset: Offset(5, 5),
              blurRadius: 20.0),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 2 / 5 -
                      MediaQuery.of(context).size.width * 1 / 20,
                  height: MediaQuery.of(context).size.height * 2 / 7 -
                      MediaQuery.of(context).size.height * 1 / 10,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    child: Image.network(
                      product.productImageURL,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    width: 70,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black.withOpacity(.25),
                    ),
                    child: Center(
                      child: product.productInStock ? Text(
                        'In stock'.toUpperCase(),
                        style:
                        GoogleFonts.inter(fontSize: 6, color: Colors.white),
                      ) : Text(
                        'Out of stock'.toUpperCase(),
                        style:
                        GoogleFonts.inter(fontSize: 6, color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.productName.toUpperCase(),
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                  Text(
                    product.productSKU,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
                        fontStyle: FontStyle.normal),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rs. ${product.productPrice.toStringAsFixed(2)}'.toString().toUpperCase(),
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      fontStyle: FontStyle.normal,),
                ),
                product.productInStock ?
                    product.productQuantity < 2 ?
                InkWell(
                  onTap: () => BlocProvider.of<CartProviderBloc>(context).add(AddItemToCart(product: product)),
                  child: Container(
                    width: 70,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).accentColor,
                    ),
                    child: Center(
                      child: Text(
                        'Buy now'.toUpperCase(),
                        style: GoogleFonts.inter(
                            fontSize: 8,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ): Container(child: Text('hello'),) : Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      'Out of stock'.toUpperCase(),
                      style: GoogleFonts.inter(
                          fontSize: 7,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}