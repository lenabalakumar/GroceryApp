import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/Data/Bloc/cartBloc/cart_provider_bloc.dart';
import 'package:groceryapp/Data/Model/Product.dart';

Widget productCard(BuildContext context,Product product) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: MediaQuery.of(context).size.width * 1 / 2,
      height: MediaQuery.of(context).size.height * 1 / 3,
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
                  width: MediaQuery.of(context).size.width * 1 / 2 -
                      MediaQuery.of(context).size.width * 1 / 20,
                  height: MediaQuery.of(context).size.height * 1 / 3 -
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
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black.withOpacity(.25),
                    ),
                    child: Center(
                      child: product.productInStock ? Text(
                        'In stock',
                        style:
                        GoogleFonts.inter(fontSize: 14, color: Colors.white),
                      ) : Text(
                        'Out of stock',
                        style:
                        GoogleFonts.inter(fontSize: 12, color: Colors.red),
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
                    product.productName,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  Text(
                    product.productSKU,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w200,
                        fontSize: 16,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rs. ${product.productPrice}'.toString(),
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontStyle: FontStyle.italic),
                ),
                product.productInStock ?
                InkWell(
                  onTap: () => BlocProvider.of<CartProviderBloc>(context).add(AddItemToCart(product: product)),
                  child: Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).accentColor,
                    ),
                    child: Center(
                      child: Text(
                        'Buy now',
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ) : Container(
                  width: 90,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green.withOpacity(.75),
                  ),
                  child: Center(
                    child: Text(
                      'Out of stock',
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.white,
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