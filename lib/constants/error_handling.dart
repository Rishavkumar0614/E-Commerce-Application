import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce_application/constants/utils.dart';

void httpErrorHandle({
  required BuildContext context,
  required http.Response response,
  required VoidCallback onSuccess,
}) {
  switch(response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context, response.body);
  }
}