import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ticketapp/constants/constants.dart';

class AuthenticationController extends GetxController {
  final isLoading = false.obs;

  Future login({required String email, required String password}) async {
    try {
      isLoading.value = true;
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }

  Future register({
    required String email,
    required String password,
    required String name,
    required String dni,
    required String phone,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'email': email,
        'password': password,
        'name': name,
        'dni': dni,
        'phone': phone,
      };

      var response = await http.post(Uri.parse('${url}register'),
          headers: {
            'Accept': 'application/json',
          },
          body: data);

      if (response.statusCode == 201) {
        isLoading.value = false;
        debugPrint(jsonDecode(response.body));
      } else {
        isLoading.value = false;
        debugPrint(jsonDecode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }
}
