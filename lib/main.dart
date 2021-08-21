import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryapp/Data/Bloc/cartBloc/cart_provider_bloc.dart';
import 'package:groceryapp/Data/Bloc/orderBloc/order_bloc.dart';
import 'package:groceryapp/MyApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => OrderBloc(),
      ),
      BlocProvider(
        create: (context) => CartProviderBloc()
          ..add(
            CartLoadingEvent(),
          ),
      ),
    ], child: MyApp()),
  );
}
