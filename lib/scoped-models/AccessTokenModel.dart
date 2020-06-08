import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import './connected_scoped_model.dart';

mixin AccessTokenModel on ConnectedScopedModel {
  Future<Map<String, dynamic>> fetchAccessToken() async {
    final Map<String, dynamic> collectedAuthData = {
      'api_token': 'rJ3m7AiOWSJe9RqfwEmwf4HF26sbNVQz0Tdp5FY9WmfjsRgDWjnYEsVZCLgn',
    };

    bool hasError = true;
    bool status=false;
    String token='';
    String message = '';
    setLoadingState = true;
    notifyListeners();

    try {
      http.Response response;
      response = await http.post(baseURL + 'user/get-access-token',
          body: json.encode(collectedAuthData),
          headers: {'Content-Type': 'application/json',
            'Accept':'application/json'
          }
          );
      Map<String, dynamic> fetchTokenResponse = json.decode(response.body);
      print(fetchTokenResponse);
      // Check for routes errors
      if (fetchTokenResponse['status'] == 'error') {
        message = fetchTokenResponse['message'];
        hasError = true;
      }
      // Check for validation errors
      else {
        status = fetchTokenResponse['status'];
        token=fetchTokenResponse['access_token'];
        hasError = false;
      }
    } catch (errorMessage) {
      hasError = true;
      message = errorMessage.toString();
    }
    setLoadingState = false;
    notifyListeners();
    return {
      'status': !hasError,
      'message': message,
      'token':token
    };
  }
}
