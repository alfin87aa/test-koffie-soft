import '../../index.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>((() => LoginController(
          apiRepository: Get.find(),
          storage: Get.find(),
        )));
  }
}
