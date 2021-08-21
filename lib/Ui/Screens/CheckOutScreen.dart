import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/Data/Bloc/orderBloc/order_bloc.dart';

class CheckOutScreen extends StatelessWidget {
  final TextEditingController _mobileNumber = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
        title: Text('Check out'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Text('+91'),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _mobileNumber,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: 'Enter your mobile number',
                          errorText: validateMobileNumber(_mobileNumber.text)),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                BlocProvider.of<OrderBloc>(context)
                    .add(PlaceOrderEvent(mobileNumber: _mobileNumber.text));
                Navigator.of(context).pushNamed('/orderSummary');
              },
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green),
                  child: Center(
                    child: Text(
                      'Place order',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String validateMobileNumber(String mobileNumber) {
    if (mobileNumber.length < 10) {
      return "Please enter a valid mobile number";
    } else
      return '';
  }
}
