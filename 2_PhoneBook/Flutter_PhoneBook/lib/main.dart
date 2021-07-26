import 'package:flutter/material.dart';
import 'view/pages/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),

      debugShowCheckedModeBanner: false,

      // 라우트 설계 필요없음. GetX
      home: Home(),
    );
  }
}
