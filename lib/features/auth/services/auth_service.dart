import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce_application/models/user.dart';
import 'package:e_commerce_application/constants/utils.dart';
import 'package:e_commerce_application/constants/global_vars.dart';
import 'package:e_commerce_application/constants/error_handling.dart';

class AuthService {

  void signUpUser({
    required String name,
    required String email,
    required String password,
    required BuildContext context,

  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          type: '',
          email: email,
          token: '',
          address: '',
          password: password
      );
      http.Response res = await http.post(
          Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String> {
            'Content-Type': 'application/json; charset=UTF-8'
          },
      );
      httpErrorHandle(context: context, response: res, onSuccess: () {
        showSnackBar(context, 'Account created! Login with the same credentials');
      });
    } catch(e) {
      showSnackBar(context, e.toString());
    }
  }
}