import 'package:busca_cep/app/home/home_controller.dart';
import 'package:busca_cep/app/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/repository/repository.dart';
import 'app/modules/repository/repository_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
            binding: BindingsBuilder(() {
              Get.lazyPut(() => HomeController());
              Get.lazyPut<Repository>(() => RepositoryImpl());
            }),
            name: '/',
            page: () => const HomePage()),
      ],
    );
  }
}
