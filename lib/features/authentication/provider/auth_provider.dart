import 'dart:developer';

import 'package:excel_hrm/features/authentication/data/model/base/api_response.dart';
import 'package:excel_hrm/features/authentication/data/model/base/error_response.dart';
import 'package:excel_hrm/features/authentication/data/repository/auth_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo;
  AuthProvider({required this.authRepo});

  bool _isLoading = false;
  bool _isRemember = false;
  int _selectedIndex = 0;
  int get selectedIndex =>_selectedIndex;

  bool get isLoading => _isLoading;

  dynamic message = '';

  Future<bool> login(BuildContext context, dynamic email, dynamic password) async {
    bool _isLogin=false;
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.login(email, password);
    _isLoading = false;
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      dynamic token = '';

      try{
        _isLogin=true;
        notifyListeners();
        message = map["success"];
        if (kDebugMode) {
          log("--------------message----------------------->>>>>$message");
        }
        token = map["user"]["token"];
        if (kDebugMode) {
          log("--------------token----------------------->>>>>" + token);
        }

        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          elevation: 6.0,
          duration: Duration(seconds: 2),
          backgroundColor: Theme.of(context).primaryColor,
        ));
        // return true;

      }catch(e){
        log(e.toString());
        _isLogin=false;
      }

      // callback(true, token, temporaryToken, message);
      notifyListeners();
    } else {
      _isLogin=false;
      String errorMessage;
      if (apiResponse.error is String) {
        log(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
        //
        // ScaffoldMessenger.of(context).removeCurrentSnackBar();
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text('${errorMessage}'),
        //   backgroundColor: Colors.red,
        // ));

      } else {
        ErrorResponse errorResponse = apiResponse.error;
        log(errorResponse.error![0].message);
        errorMessage = errorResponse.error![0].message;

        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${errorMessage}'),
          backgroundColor: Colors.red,
        ));
      }
      // callback(false, '', '' , errorMessage);
      notifyListeners();
    }
    // log(apiResponse.response!.data["success"]);
    return _isLogin;
  }

  updateSelectedIndex(int index){
    _selectedIndex = index;
    notifyListeners();
    return false;

  }

  bool get isRemember => _isRemember;
  bool _isLoadingforgetPassword = false;
  bool get isLoadingforgetPassword => _isLoadingforgetPassword;


  void updateRemember(bool value) {
    _isRemember = value;
    notifyListeners();
  }
  /// For save auth token
  Future authToken(String authToken ) async{
    authRepo.saveAuthToken(authToken);
    notifyListeners();
  }


  Future<dynamic> logOut(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.logOut();

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {

      _isLoading = false;
      notifyListeners();
      Map map = apiResponse.response!.data;

      String message = '';
      try{
        message = map["message"];
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${message}'),
          elevation: 6.0,
          duration: Duration(seconds: 1),
          backgroundColor: Theme.of(context).primaryColor,

        ));

      }catch(e){

      }
      notifyListeners();
    } else {
      _isLoading=false;
      notifyListeners();
      Map map = apiResponse.response!.data;

      String message = '';
      try{
        message = map["message"];
        if (kDebugMode) {
          print("--------------message----------------------->>>>>" + message);
        }

        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${message}'),
          elevation: 6.0,
          duration: Duration(seconds: 2),
          backgroundColor: Theme.of(context).primaryColor,
        ));

      }catch(e){
      }
      notifyListeners();
    }
    return apiResponse.response!.statusCode;
  }


  /// forget password

  String forgetApiSuccessResponse = "";

  Future<dynamic> forgetPassword(dynamic number,BuildContext context) async {
    _isLoadingforgetPassword = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.forgetPassword(number);
    _isLoadingforgetPassword = false;

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {

      Map map = apiResponse.response!.data;

      try{
        forgetApiSuccessResponse = map["message"];
        if (kDebugMode) {
          print("--------------message----------------------->>>>>$forgetApiSuccessResponse");
        }

      }catch(e){

      }
      notifyListeners();
    } else {
      _isLoadingforgetPassword=false;
      Map map = apiResponse.response!.data;

      try{
        forgetApiSuccessResponse = map["message"];
        if (kDebugMode) {
          print("--------------message----------------------->>>>>$forgetApiSuccessResponse");
        }
      }catch(e){
      }
      notifyListeners();
    }
    return apiResponse.response!.data["success"];
  }






  bool _isPhoneNumberVerificationButtonLoading = false;

  bool get isPhoneNumberVerificationButtonLoading => _isPhoneNumberVerificationButtonLoading;
  String _verificationMsg = '';

  String get verificationMessage => _verificationMsg;
  String _email = '';
  String _phone = '';

  String get email => _email;
  String get phone => _phone;

  updateEmail(String email) {
    _email = email;
    notifyListeners();
  }
  updatePhone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  void clearVerificationMessage() {
    _verificationMsg = '';
  }


  /// for verification Code
  String _verificationCode = '';

  String get verificationCode => _verificationCode;
  bool _isEnableVerificationCode = false;

  bool get isEnableVerificationCode => _isEnableVerificationCode;

  updateVerificationCode(String query) {
    if (query.length == 4) {
      _isEnableVerificationCode = true;
    } else {
      _isEnableVerificationCode = false;
    }
    _verificationCode = query;
    notifyListeners();
  }


  /// for user Section
  dynamic getUserToken(){
    print(authRepo.getUserToken());
    return authRepo.getUserToken();
  }

  /// remove user Section
  void removeUserToken(){
    print(authRepo.removeUserToken());
    authRepo.removeUserToken();
  }

  /// get auth token
  // for user Section
  String getAuthToken() {
    return authRepo.getAuthToken();
  }


  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  /// For clear shared data
  Future<bool> clearSharedData() async {
    return await authRepo.clearSharedData();
  }

  /// for  Remember Email
  void saveUserEmail(String email, String password) {
    authRepo.saveUserEmailAndPassword(email, password);
  }

  /// For get user email
  String getUserEmail() {
    return authRepo.getUserEmail() ?? "";
  }

  /// For clear user email and password
  Future<bool> clearUserEmailAndPassword() async {
    return authRepo.clearUserEmailAndPassword();
  }


  /// For get user password
  String getUserPassword() {
    return authRepo.getUserPassword() ?? "";
  }


}



