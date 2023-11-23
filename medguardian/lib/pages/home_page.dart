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
      //# The top of the screen will have the settings and     #
      //# profile buttons, plus a welcome for the user, with   #
      //# their image and personalised welcome.                #
      //########################################################
      appBar: CustomAppBar(),

      //###################### Body ##########################
      //# The body will be a scroll-pane, and has:           #
      //# · My medication: A list of the pills they have to  #
      //#   take that day, with a photo of the pill, the     #
      //#   name of the pill and a button with the hour that #
      //#   they have to take it. If you push it, it takes   #
      //#   you to the alarms page (WIP).                    #
      //# · Calendar button                                  #
      //# · Two containers: (WIP) Future doctor appointments #
      //#   and the buying list for when the pills are low   #
      //######################################################
      body: Container(),
      //###################### BottomNavBar #####################
      //# The lower zone will have the navigation bar, it has:  #
      //# · Creation button: It opens to the creation page and  #
      //#   you can choose to create a medication, or a         #
      //#   treatment.                                          #
      //# · Map button: It takes you to the page with the map   #
      //# · Home button: Returns you to the home page           #
      //# · List button: Takes you to the list of the pills     #
      //# · Alarms button: Takes you to the list of alarms      #
      //#########################################################
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
