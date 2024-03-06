import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Center(child: Text("Excel HRM DashBoard")),

                Column(
                  //crossAxisAlignment: CrossAxisAlignment.,
                  children: [

                  ],
                )

              ],
            ),
          ),
        ),

    );
  }
}
