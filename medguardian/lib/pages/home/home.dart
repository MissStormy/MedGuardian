import 'package:flutter/material.dart';
import 'package:medguardian/widgets/app_bar.dart';
import 'package:medguardian/widgets/bottom_nav_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //###################### AppBar ##########################
      appBar: const CustomAppBar(),
      //###################### Body ##########################
      body: Container(),
      //###################### BottomNavBar ##########################
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}