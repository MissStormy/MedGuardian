import 'package:flutter/material.dart';
import 'package:medguardian/widgets/app_bar.dart';
import 'package:medguardian/widgets/bottom_nav_bar.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Top section with user image and name
          Row(
            children: [
              //Rounded image (icon for now)
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[200]),
                child: Icon(Icons.person, size: 40, color: Colors.black),
              ),
              SizedBox(width: 16),
              //Username
              Text("Agapito",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: 16),

          //First accordion
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[400]!, blurRadius: 5, spreadRadius: 2)
                ]),
            //The accordion is called expansiontile... good name
            //So, information expansionTile
            child: ExpansionTile(
              title: Text("Informacion personal"),
              children: [
                ListTile(
                  title: Text("Email: AgapitoDiSousa@gmail.com"),
                ),
                ListTile(
                  title: Text("Edad: 69"),
                )
              ],
            ),
          ),
          SizedBox(height: 16),
          //Button list
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[400]!,
                        blurRadius: 5,
                        spreadRadius: 2)
                  ]),
              child: Column(
                children: [
                  //Credits button
                  ListTile(
                    title: Text("Creditos"),
                    onTap: () {},
                  ),
                  //Terms of Service button
                  ListTile(
                    title: Text("Terminos de servicio"),
                    onTap: () {},
                  ),
                  //Erase account button
                  ListTile(
                    title: Text("Borrar cuenta",
                        style: TextStyle(color: Colors.red)),
                    onTap: () {},
                  )
                ],
              ))
        ]),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
