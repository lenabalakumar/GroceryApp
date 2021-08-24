class User {
  String userFullName;
  String userMobileNumber;
  String userAddressLineOne;
  String userAddressLineTwo;
  String userPincode;
  String userLandmark;

  User(
      {required this.userFullName,
      required this.userMobileNumber,
      required this.userAddressLineOne,
      required this.userAddressLineTwo,
      required this.userPincode,
      required this.userLandmark});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userName': userFullName,
        'userMobileNumber': userMobileNumber,
        'userAddressLineOne': userAddressLineOne,
        'userAddressLineTwo': userAddressLineTwo,
        'userPincode': userPincode,
        'userLandmark': userLandmark,
      };
}
