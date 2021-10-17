import 'package:comics_marvel/modules/home/home_page.dart';
import 'package:comics_marvel/modules/home/home_page_bindigns.dart';
import 'package:comics_marvel/routes/my_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      home: const HomePage(),
      initialBinding: HomePageBinding(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       getPages: AppPages.pages,
//       home: const HomePage(),
//       initialBinding: HomePageBinding(),
//       fallbackLocale: const Locale('pt', 'BR'),
//     );
//   }
//}
