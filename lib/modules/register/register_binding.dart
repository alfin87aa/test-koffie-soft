import '../../index.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>((() => RegisterController(
          apiRepository: Get.find(),
          storage: Get.find(),
        )));
  }
}
