import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import '../../data/models/login_request_model.dart';
import '../../domain/usecases/login_usecase.dart';
import '../widgets/base_view.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  var isLoading = false.obs;
  var isFormValid = false.obs;

  LoginController(this.loginUseCase) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailController.addListener(validateForm);
    passwordController.addListener(validateForm);
  }

  void validateForm() {
    isFormValid.value =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  void login() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      String email = emailController.text;
      String password =
          sha256.convert(utf8.encode(passwordController.text)).toString();
      var loginRequest = LoginRequestModel(email: email, password: password);
      var result = await loginUseCase(loginRequest);
      isLoading.value = false;
      if (result) {
        Get.to(() => const BaseView());
      } else {
        Get.snackbar('Error', 'Invalid ID Password');
      }
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
