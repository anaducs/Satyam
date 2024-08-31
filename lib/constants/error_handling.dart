import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:satyam/constants/utils.dart';

void httpErrorHandler({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  final responseBody = jsonDecode(response.body);
  String message = 'an Unexpected error has occurred';
  String details = '';

  switch (response.statusCode) {
    case 200:
      onSuccess();
      return;
    case 400:
      message = responseBody['message'];
      details = responseBody['details'];
      break;
    case 500:
      message = responseBody['message'];
      details = responseBody['details'];
      break;

    default:
      message = responseBody['message'];
      details = responseBody['details'];
      break;
  }
  showSnackBar(context, '$message : $details');


}
