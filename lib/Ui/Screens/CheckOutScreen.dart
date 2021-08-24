import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/Data/Bloc/orderBloc/order_bloc.dart';
import 'package:groceryapp/Data/Model/User.dart';
import 'package:groceryapp/Ui/Screens/OrderSummaryScreen.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _mobileNumber = new TextEditingController();
  final TextEditingController _userName = new TextEditingController();
  final TextEditingController _addressLineOne = new TextEditingController();
  final TextEditingController _addressLineTwo = new TextEditingController();
  final TextEditingController _pincode = new TextEditingController();
  final TextEditingController _landmark = new TextEditingController();
  final TextEditingController _cityName = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
        title: Center(
          child: Text('Check out'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Text(
                            '+91',
                            style: GoogleFonts.inter(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _mobileNumber,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              labelText: 'Enter your 10 digit mobile number',
                              labelStyle: GoogleFonts.inter(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Mobile number cannot be empty';
                            } else if (value.length != 10) {
                              return 'Mobile number should only be 10 digits';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: _userName,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Enter your name',
                      labelStyle: GoogleFonts.inter(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Name cannot be empty';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _addressLineOne,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Enter your Address line 1',
                        labelStyle: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Address cannot be empty';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _addressLineTwo,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Enter your Address line 2 (optional)',
                        labelStyle: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                    // validator: (String? value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Address cannot be empty';
                    //   }
                    //   return null;
                    // },
                  ),
                  TextFormField(
                    controller: _landmark,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Enter your location landmark (optional)',
                        labelStyle: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                    // validator: (String? value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Address cannot be empty';
                    //   }
                    //   return null;
                    // },
                  ),
                  TextFormField(
                    controller: _cityName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: 'Enter city name '),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'City name cannot be empty';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _pincode,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Enter your 6 digit pincode',
                        labelStyle: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Pincode cannot be empty';
                      } else if (value.length != 6) {
                        return 'Pincode should only be 6 digits';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: InkWell(
                      onTap: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<OrderBloc>(context).add(
                            PlaceOrderEvent(
                              userDetails: User(
                                  userFullName: _userName.text,
                                  userMobileNumber: _mobileNumber.text,
                                  userAddressLineOne: _addressLineOne.text,
                                  userAddressLineTwo: _addressLineTwo.text,
                                  userCityName: _cityName.text,
                                  userPincode: _pincode.text,
                                  userLandmark: _landmark.text),
                            ),
                          );
                          // Navigator.of(context).pushNamed('/orderSummary');
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderSummaryScreen(),
                              ),
                              (route) => false);
                          // print('address line one: ${_addressLineOne.text}');
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1 / 12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).accentColor),
                        child: Center(
                          child: Text(
                            'Place order',
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
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
      ),
    );
  }
}
