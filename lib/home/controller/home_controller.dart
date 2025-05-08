import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../widget/dialog_builder.dart';
import '../model/data_model.dart';

class HomeController extends GetxController{

  Future<List<User>> fetchUsersDetails() async {
try{

  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    List jsonData = json.decode(response.body);

    return jsonData.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load users');
  }

}


catch (e){
  return [];
}

  }


}