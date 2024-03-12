import 'package:excel_hrm/features/authentication/data/model/base/api_response.dart';
import 'package:excel_hrm/features/authentication/data/model/base/error_response.dart';
import 'package:excel_hrm/features/authentication/data/repository/auth_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo;
  AuthProvider({required this.authRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  dynamic message = '';

  Future<dynamic> login(BuildContext context, dynamic email, dynamic password) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.login(email, password);
    _isLoading = false;
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {

      Map map = apiResponse.response!.data;
      dynamic token = '';

      try{
        notifyListeners();
        message = map["message"];
        if (kDebugMode) {
          print("--------------message----------------------->>>>>$message");
        }
        token = map["token_info"]["access_token"];
        if (kDebugMode) {
          print("--------------token----------------------->>>>>" + token);
        }

        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          elevation: 6.0,
          duration: Duration(seconds: 2),
          backgroundColor: Theme.of(context).primaryColor,
        ));

      }catch(e){

      }

      // callback(true, token, temporaryToken, message);
      notifyListeners();
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();

        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${errorMessage}'),
          backgroundColor: Colors.red,
        ));

      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.error![0].message);
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
    print(apiResponse.response!.data["success"]);
    return apiResponse.response!.data["success"];
  }


}


