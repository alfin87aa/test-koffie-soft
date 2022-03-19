import 'package:test_koffie_soft/index.dart';

class RegisterController extends GetxController {
  final ApiRepository apiRepository;
  final SharedPreferences storage;

  RegisterController({
    required this.apiRepository,
    required this.storage,
  });

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(child: Text("User Admin"), value: "ua"),
      DropdownMenuItem(child: Text("Member"), value: "member"),
      DropdownMenuItem(child: Text("Mitra"), value: "mitra"),
    ];
    return menuItems;
  }

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final hpController = TextEditingController();
  final tglLahirController = TextEditingController();
  final grupController = TextEditingController();
  final referralCodeController = TextEditingController();
  RxBool passwordVisible = false.obs;
  RxBool confirmPasswordVisible = false.obs;
  RxInt jenisKelaminValue = 0.obs;
  Rx<DateTime> tglLahir = DateTime.now().obs;
  RxString group = ''.obs;

  void register() async {
    if (registerFormKey.currentState!.validate()) {
      final res = await apiRepository.register(
        RegisterRequest(
          email: emailController.text,
          password: passwordController.text,
          firstname: firstnameController.text,
          lastname: lastnameController.text,
          jenisKelamin: jenisKelaminValue.value,
          tglLahir: tglLahir.value,
          hp: hpController.text,
          grup: group.value,
          referralCode: referralCodeController.text,
          role: '',
        ),
      );

      if (res != null && res.status.kode == 'success') {
        Get.defaultDialog(
            middleText: res.status.keterangan,
            title: res.status.kode,
            confirm: TextButton(
              onPressed: (() => Get.offAllNamed(Routes.LOGIN)),
              child: Text('ok'.tr),
            ));
      } else {
        EasyLoading.dismiss();
        String title = res?.status.kode ?? 'erorr'.tr;
        String msg = res?.status.keterangan ?? 'registration failed'.tr;
        Get.defaultDialog(
          title: title,
          middleText: msg,
        );
      }
    }
  }

  void togglePasswordVisible() {
    passwordVisible.value = !passwordVisible.value;
  }

  void toggleConfirmPasswordVisible() {
    confirmPasswordVisible.value = !confirmPasswordVisible.value;
  }

  @override
  void onClose() {
    super.onClose();

    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    hpController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    grupController.dispose();
    tglLahirController.dispose();
    referralCodeController.dispose();
  }
}
