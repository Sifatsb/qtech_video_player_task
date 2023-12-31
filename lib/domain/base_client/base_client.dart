import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../app/data/constants/app_text.dart';
import '../../app/utilities/message/snack_bars.dart';
import 'api_exceptions.dart';

class ApiBaseClient {
  Future<dynamic> getData({
    required String url,
    Map<String, String>? header,
  }) async {
    debugPrint('Get Request: $url');
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: header,
          )
          .timeout(
            const Duration(seconds: 30),
          );

      return returnResponse(response);
    } on SocketException {
      showBasicFailedSnackBar(message: AppText.noInternetConnection);
      throw FetchDataException(AppText.noInternetConnection);
    } on TimeoutException {
      showBasicFailedSnackBar(message: AppText.tryAgainLater);
      throw FetchDataException(AppText.tryAgainLater);
    }
  }
}
