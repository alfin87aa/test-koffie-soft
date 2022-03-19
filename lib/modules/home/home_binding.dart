import '../../index.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    var storage = Get.find<SharedPreferences>();

    Get.lazyPut<HomeController>((() => HomeController(
        userInfo: User.fromJson(
            jsonDecode(storage.getString(StorageConstants.userInfo) ?? '')))));
  }
}
