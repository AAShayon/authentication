import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:excel_hrm/features/authentication/data/image_title.dart';

class SignInHomepage extends StatelessWidget {
  const SignInHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF274E9E),
                Color(0xFF3067AA),
                Color(0xFF3D89BA),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Center(child: Text('Excell HRM',style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.black),)),
                SizedBox(height: 20,),
                Container(
                  width: 360,
                  // Adjusted the height to fit the available space
                  height: 760,
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 155,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 15,
                    ),
                    itemBuilder: (_, index) => Container(
                      height: 50,
                      width: 120,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: Image.asset(
                                imageTitleList[index].imagUrl,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Text(imageTitleList[index].title),
                            ),
                          )
                        ],
                      ),
                    ),
                    itemCount: imageTitleList.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
