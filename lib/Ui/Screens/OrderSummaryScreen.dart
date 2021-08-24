import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/Data/Bloc/cartBloc/cart_provider_bloc.dart';
import 'package:groceryapp/Ui/Screens/HomeScreen.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Success'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Thank you',
                  style: GoogleFonts.inter(
                      fontSize: 28, fontWeight: FontWeight.w500,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'We have received your order and will contact you shortly',
                  style: GoogleFonts.inter(
                    fontSize: 14, fontWeight: FontWeight.w500,),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('To navigate to home'),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).pushNamed('/home');
                        // Navigator.pushReplacementNamed(context, '/home');
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                          (route) => false,
                        );
                        BlocProvider.of<CartProviderBloc>(context)
                            .add(CartLoadingEvent());
                      },
                      child: Text('Home'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('To modify your order'),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).pushNamed('/home');
                        // Navigator.pushReplacementNamed(context, '/home');
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                              (route) => false,
                        );
                        BlocProvider.of<CartProviderBloc>(context)
                            .add(CartLoadingEvent());
                      },
                      child: Text('Contact us'),
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
}
