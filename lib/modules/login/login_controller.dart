import '../../index.dart';

class LoginController extends GetxController {
  final ApiRepository apiRepository;
  final SharedPreferences storage;

  LoginController({
    required this.apiRepository,
    required this.storage,
  });

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool passwordVisible = false.obs;

  void login() async {
    if (loginFormKey.currentState!.validate()) {
      var res = await apiRepository.login(
        LoginRequest(
          username: usernameController.text,
          password: passwordController.text,
        ),
      );

      if (res != null && res.accessToken.isNotEmpty) {
        storage.setString(StorageConstants.token, res.accessToken);
        storage.setString(StorageConstants.userInfo, jsonEncode(res.user));

        Get.offAllNamed(Routes.HOME);
      }
    }
  }

  void register() {
    Get.toNamed(Routes.REGISTER);
  }

  void togglePasswordVisible() {
    passwordVisible.value = !passwordVisible.value;
  }
}
