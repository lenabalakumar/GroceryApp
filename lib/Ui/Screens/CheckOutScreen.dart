import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/Data/Bloc/orderBloc/order_bloc.dart';
import 'package:groceryapp/Data/Model/User.dart';

class CheckOutScreen extends StatelessWidget {
  final TextEditingController _mobileNumber = new TextEditingController();
  final TextEditingController _userName = new TextEditingController();
  final TextEditingController _addressLineOne = new TextEditingController();
  final TextEditingController _addressLineTwo = new TextEditingController();
  final TextEditingController _pincode = new TextEditingController();
  final TextEditingController _landmark = new TextEditingController();

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
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
                            errorText:
                                validateMobileNumber(_mobileNumber.text)),
                      ),
                    ),
                  ],
                ),
                TextField(
                  controller: _userName,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Full name',
                    errorText: validateMobileNumber(_userName.text),
                  ),
                ),
                TextField(
                  controller: _addressLineOne,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Address line 1',
                    errorText: validateMobileNumber(_addressLineOne.text),
                  ),
                ),
                TextField(
                  controller: _addressLineTwo,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Address line 2',
                    errorText: validateMobileNumber(_addressLineTwo.text),
                  ),
                ),
                TextField(
                  controller: _landmark,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Landmark',
                    errorText: validateMobileNumber(_landmark.text),
                  ),
                ),
                TextField(
                  controller: _pincode,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Pincode',
                    errorText: validateMobileNumber(_pincode.text),
                  ),
                ),
                InkWell(
                  onTap: () {
                    BlocProvider.of<OrderBloc>(context).add(
                      PlaceOrderEvent(
                        userDetails: User(
                            userFullName: _userName.text,
                            userMobileNumber: _mobileNumber.text,
                            userAddressLineOne: _addressLineOne.text,
                            userAddressLineTwo: _addressLineTwo.text,
                            userPincode: _pincode.text,
                            userLandmark: _landmark.text),
                      ),
                    );
                    Navigator.of(context).pushNamed('/orderSummary');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).accentColor,
                      ),
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
