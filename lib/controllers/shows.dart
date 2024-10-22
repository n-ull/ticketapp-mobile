import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/constants/constants.dart';
import 'package:ticketapp/models/show_model.dart';

class ShowController extends GetxController {
  final isLoading = false.obs;
  Rx<List<ShowModel>> shows = Rx<List<ShowModel>>([]);

  final box = GetStorage();

  @override
  void onInit() {
    fetchShows();
    super.onInit();
  }

  Future fetchShows() async {
    try {
      isLoading.value = true;

      final token = box.read('token');

      /* bearer auth */
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var response = await http.get(Uri.parse('${url}shows'), headers: headers);

      if (response.statusCode == 200) {
        for (var item in json.decode(response.body)['data']) {
          shows.value.add(ShowModel.fromJson(item));
        }

        isLoading.value = false;
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        debugPrint(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }

  Future fetchShow(int id) async {
    try {
      isLoading.value = true;

      final token = box.read('token');

      /* bearer auth */
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var response =
          await http.get(Uri.parse('${url}shows/$id'), headers: headers);

      if (response.statusCode == 200) {
        isLoading.value = false;
        return ShowModel.fromJson(json.decode(response.body)['data']);
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        debugPrint(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }

  Future fetchShowByTitle(String title) async {
    try {
      isLoading.value = true;

      final token = box.read('token');

      /* bearer auth */
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var response = await http.get(Uri.parse('${url}shows/title/$title'),
          headers: headers);

      if (response.statusCode == 200) {
        isLoading.value = false;
        return ShowModel.fromJson(json.decode(response.body)['data'][0]);
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        debugPrint(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }
}
