import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ticketapp/constants/constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ticketapp/views/home.dart';

class AuthenticationController extends GetxController {
  final isLoading = false.obs;
  final token = ''.obs;

  final box = GetStorage();

  Future register({
    required String email,
    required String password,
    required String name,
    required String dni,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'email': email,
        'password': password,
        'name': name,
        'dni': dni,
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
        Get.snackbar(
          'Error',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        debugPrint(jsonDecode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }

  Future login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      var data = {
        'email': email,
        'password': password,
      };

      var response = await http.post(Uri.parse('${url}login'),
          headers: {
            'Accept': 'application/json',
          },
          body: data);

      if (response.statusCode == 201) {
        isLoading.value = false;
        var token = json.decode(response.body)['token'];
        box.write('token', token);
        Get.offAll(() => const Home());
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        debugPrint(jsonDecode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }
}
