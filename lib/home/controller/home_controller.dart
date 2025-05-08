import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../util/Toast.dart';
import '../model/data_model.dart';

class HomeController extends GetxController{

  Future<List<User>> fetchUsersDetails() async {
    try {
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

      if (response.statusCode == 200) {
        toastmessage(" Successful", color: Colors.blueAccent);

        final List data = jsonDecode(response.body);
        return data.map((json) => User.fromJson(json)).toList();

      } else {
        toastmessage("Failed to load users: ${response.statusCode}", color: Colors.blueAccent);

        throw Exception("Failed to load users: ${response.statusCode}");
      }
    } catch (e) {
      toastmessage("Error: $e", color: Colors.blueAccent);

      throw Exception("Error: $e");
    }
  }

}