import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/Data/Bloc/cartBloc/cart_provider_bloc.dart';
import 'package:groceryapp/Data/Model/Product.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
        title: Text('Shopping cart'),
      ),
      body: ShoppingCartBody(),
    );
  }
}

class ShoppingCartBody extends StatelessWidget {
  const ShoppingCartBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SingleChildScrollView(
            child: Center(
              child: BlocBuilder<CartProviderBloc, CartProviderState>(
                builder: (context, state) {
                  if (state is CartLoadingState) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('No items in cart')),
                    );
                  } else if (state is CartLoadedState) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: state.cartItems.cartItems.length > 0
                            ? state.cartItems.cartItems
                                .map((e) => _cartCard(context, e))
                                .toList()
                            : [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Center(child: Text('No items in cart')),
                                  ),
                                )
                              ],
                      ),
                    );
                  } else if (state is CartErrorState) {
                    return Text('Error loading cart');
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('No items in cart')),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 200,
              height: 50,
              child: BlocBuilder<CartProviderBloc, CartProviderState>(
                builder: (context, state) {
                  if (state is CartLoadedState) {
                    return state.cartItems.cartItems.length >= 1
                        ? InkWell(
                            onTap: () => Navigator.of(context)
                                .pushNamed('/checkout', arguments: {
                              'cartItems': state.cartItems,
                              'cartTotal': state.cartTotal,
                            }),
                            child: Container(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Due: Rs. ${state.cartTotal.toStringAsFixed(2)}'
                                            .toString(),
                                        style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          )
                        : Container();
                  } else
                    return Container();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cartCard(BuildContext context, Product product) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.0675),
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(0.5, 0.5),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    product.productImageURL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 180,
                height: 100,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.productName.toUpperCase(),
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            product.productSKU.toUpperCase(),
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Text(
                          'Rs. ${product.productPrice.toStringAsFixed(2)}'
                              .toString()
                              .toUpperCase(),
                          style: TextStyle(fontSize: 12)),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            InkWell(
                              onTap: () =>
                                  BlocProvider.of<CartProviderBloc>(context)
                                      .add(ReduceItemToCart(product: product)),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Text(
                                    '-',
                                    style: GoogleFonts.inter(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              child: Center(
                                child: Text(product.productQuantity.toString()),
                              ),
                            ),
                            InkWell(
                              onTap: () =>
                                  BlocProvider.of<CartProviderBloc>(context)
                                      .add(AddItemToCart(product: product)),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Text(
                                    '+',
                                    style: GoogleFonts.inter(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => BlocProvider.of<CartProviderBloc>(context)
                    .add(RemoveItemToCart(product: product)),
                child: Container(
                  width: 40,
                  height: 80,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Icon(
                    Icons.delete,
                    size: 32,
                    color: Colors.black.withOpacity(.25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
