import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      final Map<String, dynamic> resBody = jsonDecode(response.body);
      final String message =
          resBody['msg'] ??
          resBody['message'] ??
          resBody['error'] ??
          'Something went wrong [400]';
      showSnackBar(context, message);
      break;
    case 500:
      final Map<String, dynamic> resBody = jsonDecode(response.body);
      final String message =
          resBody['msg'] ??
          resBody['message'] ??
          resBody['error'] ??
          'Server error [500]';
      showSnackBar(context, message);
      break;
    default:
      showSnackBar(
        context,
        response.body.isNotEmpty ? response.body : 'Unexpected error occurred.',
      );
  }
}
