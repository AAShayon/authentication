import 'package:excel_hrm/features/authentication/screens/sign_in_screen.dart';
import 'package:excel_hrm/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:excel_hrm/features/authentication/data/page_data/image_title.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

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
                const SizedBox(height: 20,),
                Center(child: Text('Excell HRM',style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),)),
                const SizedBox(height: 20,),
                Container(
                  width: 360,
                  // height: 760,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
                TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignInScreen())), child: const Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
