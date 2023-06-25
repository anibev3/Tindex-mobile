import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tindex_mobile/app/modules/other/constants/utils.dart';

void statusCodeHandler({
  required BuildContext context,
  required http.Response response,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 201:
    case 200:
      onSuccess();
      break;
    case 400:
    case 409:
      showErrorMessage(
        context: context,
        title: "Error",
        message: jsonDecode(response.body)['message'],
        onTap: () => Navigator.pop(context),
      );
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body));
      break;
  }
}
