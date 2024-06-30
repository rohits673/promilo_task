import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/providers/auth_provider.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/login_usecase.dart';
import 'presentation/screens/login/login_screen.dart';

void main() {
  Get.put<AuthProvider>(AuthProvider());
  Get.put<AuthRepository>(AuthRepositoryImpl(Get.find<AuthProvider>()));
  Get.put<LoginUseCase>(LoginUseCase(Get.find<AuthRepository>()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
