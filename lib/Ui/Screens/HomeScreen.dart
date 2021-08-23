import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryapp/Data/Bloc/cartBloc/cart_provider_bloc.dart';
import 'package:groceryapp/Ui/Screens/HomeScreenBody.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/shoppingCart');
                  },
                  icon: Icon(Icons.shopping_bag_outlined, color: Colors.white,),
                ),
                Positioned(
                  top: 2,
                  right: 2,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Theme.of(context).accentColor),
                    child: Center(
                      child: BlocBuilder<CartProviderBloc, CartProviderState>(
                        builder: (context, state) {
                          if(state is CartLoadingState) {
                            return Text('0');
                          } else if (state is CartLoadedState) {
                            return Text(state.cartItems.cartItems.length.toString());
                          } else
                          return Text('0');
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: HomeScreenBody(),
    );
  }
}
