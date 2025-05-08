import 'package:get/get.dart';
import 'package:interview_task/home/controller/home_controller.dart';



class HomeScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());

  }
}