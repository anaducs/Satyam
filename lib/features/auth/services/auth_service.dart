import 'package:flutter/cupertino.dart';
import 'package:satyam/constants/error_handling.dart';
import 'package:satyam/constants/utils.dart';
import 'package:satyam/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:satyam/constants/global_variable.dart';

class AuthService {
  //signup function
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    if(password.length<6){

    }
    try {
      User user = User(
          id: '',
          name: name,
          password: password,
          email: email,
          type: '',
          token: '');
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),body: user.toJson(),
      headers: <String, String>{
        'Content-Type':'application/json; charset=UTF-8',
      });
      if(context.mounted){
        httpErrorHandler(response: res, context:context, onSuccess: (){
          if(context.mounted){
            showSnackBar(context, 'Account Created');
          }

        });
      }
    } catch (e) {
      if(context.mounted){
        showSnackBar(context, e.toString());
      }
    }
  }
}
