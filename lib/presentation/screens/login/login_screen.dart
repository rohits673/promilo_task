import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:promilo_task/presentation/widgets/base_view.dart';

import '../../../domain/usecases/login_usecase.dart';
import '../../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller =
      Get.put(LoginController(Get.find<LoginUseCase>()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('promilo'),
        centerTitle: true,
        actions: [_skipButton()],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Hi, Welcome Back!',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        _emailField(),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Sign In with OTP",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _passwordField(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                const Text('Remember Me'),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _submitButton(),
                        const SizedBox(height: 30),
                        _dividerWithText(),
                        const SizedBox(height: 30),
                        _socialMediaIcons(),
                        const Spacer(),
                        _footerLinks(),
                        const SizedBox(height: 40),
                        _privacyTerms(),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  TextButton _skipButton() {
    return TextButton(
      onPressed: () {
        Get.to(() => const BaseView());
      },
      child: const Row(
        children: [
          Text(
            "Skip",
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
          Icon(Icons.arrow_forward_ios, size: 18, color: Colors.blue)
        ],
      ),
    );
  }

  Text _privacyTerms() {
    return const Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
            text: 'By continuing, you agree to\nPromilo\'s ',
            style: TextStyle(fontSize: 14),
            children: [
              TextSpan(
                text: 'Terms of Use & Privacy Policy.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )
            ]));
  }

  Obx _submitButton() {
    return Obx(
      () => ElevatedButton(
        onPressed: controller.isFormValid.value ? controller.login : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[100],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: controller.isLoading.value
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ))
            : const Text('Submit'),
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      controller: controller.emailController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        labelText: 'Enter Email or Mob No.',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email or mobile number';
        } else if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value) &&
            !RegExp(r'^[0-9]+$').hasMatch(value)) {
          return 'Please enter a valid email address or mobile number';
        }
        return null;
      },
    );
  }

  Widget _passwordField() {
    return TextFormField(
      controller: controller.passwordController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        labelText: 'Enter Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }

  Widget _dividerWithText() {
    return Row(children: [
      const Expanded(child: Divider()),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: const Text(
          'or',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      const Expanded(child: Divider()),
    ]);
  }

  Widget _socialMediaIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (Rect bounds) => const SweepGradient(
            center: Alignment.center,
            stops: [0, 0.25, 0.5, 0.75],
            colors: [
              Colors.blue,
              Colors.green,
              Colors.yellow,
              Colors.red,
            ],
          ).createShader(bounds),
          child: const Icon(FontAwesomeIcons.google, size: 40),
        ),
        const Icon(FontAwesomeIcons.linkedin, color: Colors.blue, size: 40),
        const Icon(FontAwesomeIcons.facebook,
            color: Colors.blueAccent, size: 40),
        const Icon(FontAwesomeIcons.instagram, color: Colors.red, size: 40),
        const Icon(FontAwesomeIcons.whatsapp, color: Colors.green, size: 40),
      ],
    );
  }

  Widget _footerLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            // Handle Business User Login
          },
          child: const Text.rich(TextSpan(
              text: 'Business User?\n',
              style: TextStyle(fontSize: 16),
              children: [
                TextSpan(
                  text: 'Login Here',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ])),
        ),
        GestureDetector(
          onTap: () {
            // Handle Sign Up
          },
          child: const Text.rich(
              textAlign: TextAlign.right,
              TextSpan(
                  text: 'Don\'t have an account?\n',
                  style: TextStyle(fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ])),
        ),
      ],
    );
  }
}
