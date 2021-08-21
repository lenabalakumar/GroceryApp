import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryapp/Data/Bloc/cartBloc/cart_provider_bloc.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: TextButton(
            onPressed: () {
              // Navigator.of(context).pushNamed('/home');
              Navigator.pushReplacementNamed(context, '/home');
              BlocProvider.of<CartProviderBloc>(context).add(CartLoadingEvent());
            } ,
            child: Text('Home'),
          ),
        ),
      ),
    );
  }
}
