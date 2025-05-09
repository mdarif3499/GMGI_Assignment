import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:interview_task/home/controller/home_controller.dart';

import '../../widget/custom_text.dart';
import '../model/data_model.dart';

class HomeScreen extends StatefulWidget {
  static const pageId = "/homeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController _homeCon = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User List')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder<List<User>>(
          future: _homeCon.fetchUsersDetails(), // from above
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No users found.'));
            } else {
              final users = snapshot.data!;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return getItem(user, index,
                      onBackToScreen: () {
                        // loadData();
                      });
                },
              );
            }
          },
        ),
      ),
    );
  }


  Widget getItem(User dataList, int index,
      {Function? onBackToScreen, bool isOnlyView = false}) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 17,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(5.0),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Colors.white,
            ],
          ),
          color: Colors.white),
      child: InkWell(

        child: Column(
          children: [
            Container(
              height: 50,
              alignment: Alignment.center,
              color: Colors.indigoAccent,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'User Details',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            getbItem(
                "Name", dataList.name ?? ""
            ),
            getbItem(
                "Email", dataList.email ?? ""
            ),
            getbItem(
                "Company Name", dataList.companyName ?? ""
            ),
            SizedBox(height: 20,)

          ],
        ),

      ),
    );
  }


  Widget getbItem(String title, String? body,) {
    return Container(
      padding: const EdgeInsets.only(top: 5,left: 10,right: 10,),
      child: Row(
        children: [
          [null, ""].contains(title)
              ? const SizedBox()
              : Expanded(
            flex: 1,
            child: CustomText(
              text: "$title",
              textAlign: TextAlign.left,
              color: Colors.black,
              size: 18,
              weight:FontWeight.normal,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                CustomText(
                  text: " ${[null, ""].contains(title+"  ")?"":"  : "}",
                  textAlign: TextAlign.left,
                  color: Colors.black,
                  size: 16,
                  weight: FontWeight.normal,
                ),
                Expanded(
                  child: CustomText(
                    text:[null, "null"].contains(body)?"": body!,
                    textAlign: TextAlign.left,
                    color: Colors.black,
                    size: 16,
                    weight:FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );;
  }


}
