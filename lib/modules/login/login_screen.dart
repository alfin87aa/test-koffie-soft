import '../../index.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'login page'.tr,
          style: const TextStyle(color: ColorConstants.blue600),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
            key: controller.loginFormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: controller.usernameController,
                    decoration: InputDecoration(
                      label: Text('username'.tr),
                      hintText: 'please input email or phone number'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'username is required'.tr;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Obx(() => TextFormField(
                        controller: controller.passwordController,
                        obscureText: !controller.passwordVisible.value,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(controller.passwordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () => controller.togglePasswordVisible(),
                          ),
                          label: Text('password'.tr),
                          hintText: 'please input your password'.tr,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password is required'.tr;
                          }

                          if (value.length < 6 || value.length > 15) {
                            return 'password should be 6~15 characters'.tr;
                          }

                          return null;
                        },
                      )),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: (() => controller.login()),
                    child: Text('login'.tr),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "dont have an account".tr,
                      ),
                      GestureDetector(
                        onTap: (() => controller.register()),
                        child: Text(
                          "sign up".tr,
                          style: const TextStyle(color: ColorConstants.blue600),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
