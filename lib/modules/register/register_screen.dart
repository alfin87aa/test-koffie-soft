import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../index.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mobileFormatter = NumberTextInputFormatter();
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(
              'register page'.tr,
              style: const TextStyle(color: ColorConstants.blue600),
            ),
          ),
          body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
                key: controller.registerFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          label: Text('email'.tr),
                          hintText: 'please input email'.tr,
                        ),
                        validator: (value) {
                          if (!Regex.isEmail(value!)) {
                            return 'format email is not valid'.tr;
                          }
                          if (value.isEmpty) {
                            return 'email is required'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      TextFormField(
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
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      TextFormField(
                        controller: controller.confirmPasswordController,
                        obscureText: !controller.confirmPasswordVisible.value,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(controller.confirmPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () =>
                                controller.toggleConfirmPasswordVisible(),
                          ),
                          label: Text('confirm password'.tr),
                          hintText: 'please reinput your password'.tr,
                        ),
                        validator: (value) {
                          if (controller.passwordController.text !=
                              controller.confirmPasswordController.text) {
                            return 'confirm Password is not consistence with Password'
                                .tr;
                          }

                          if (value!.isEmpty) {
                            return 'confirm Password is required'.tr;
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      TextFormField(
                        controller: controller.firstnameController,
                        decoration: InputDecoration(
                          label: Text('first name'.tr),
                          hintText: 'please input first name'.tr,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'first name is required'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      TextFormField(
                        controller: controller.lastnameController,
                        decoration: InputDecoration(
                          label: Text('last name'.tr),
                          hintText: 'please input last name'.tr,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'last name is required'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      TextFormField(
                        controller: controller.hpController,
                        keyboardType: TextInputType.phone,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          _mobileFormatter
                        ],
                        decoration: InputDecoration(
                          label: Text('phone number'.tr),
                          hintText: 'please input phone number'.tr,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'phone number is required'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text('gender'.tr),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text('mele'.tr),
                                leading: Radio(
                                    activeColor: ColorConstants.blue600,
                                    value: 1,
                                    groupValue:
                                        controller.jenisKelaminValue.value,
                                    onChanged: (int? value) {
                                      controller.jenisKelaminValue.value =
                                          value!;
                                    }),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text('female'.tr),
                                leading: Radio(
                                    activeColor: ColorConstants.blue600,
                                    value: 2,
                                    groupValue:
                                        controller.jenisKelaminValue.value,
                                    onChanged: (int? value) {
                                      controller.jenisKelaminValue.value =
                                          value!;
                                    }),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      TextFormField(
                        controller: controller.tglLahirController,
                        readOnly: true,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.calendar_month),
                          label: Text('birthdate'.tr),
                          hintText: 'please input birthdate'.tr,
                        ),
                        onTap: () async {
                          controller.tglLahir.value = (await showDatePicker(
                              context: context,
                              initialDate: controller.tglLahir.value,
                              firstDate: DateTime(
                                  1900), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime.now()))!;
                          controller.tglLahirController.text =
                              DateFormat(AppConfigs.dateDisplyaFormat)
                                  .format(controller.tglLahir.value);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'birthdate is required'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          label: Text('user group'.tr),
                          hintText: 'please select user group'.tr,
                        ),
                        items: controller.dropdownItems,
                        onChanged: (String? newValue) {
                          controller.group.value = newValue!;
                        },
                        validator: (value) =>
                            value == null ? "select a user group".tr : null,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      TextFormField(
                        controller: controller.referralCodeController,
                        decoration: InputDecoration(
                          label: Text('referral code'.tr),
                          hintText:
                              'if you have referal code you can input in here'
                                  .tr,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: (() => controller.register()),
                        child: Text('register'.tr),
                      ),
                    ],
                  ),
                )),
          ),
        ));
  }
}
