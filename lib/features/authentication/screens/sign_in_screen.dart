import 'package:excel_hrm/features/authentication/widgets/sign_in_form.dart';
import 'package:excel_hrm/features/authentication/widgets/sign_in_header.dart';
import 'package:excel_hrm/utils/constants/image_strings.dart';
import 'package:excel_hrm/utils/constants/sizes.dart';
import 'package:excel_hrm/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(
                height: 75,
              ),
              /// Header
              SignInHeader(),

              SignInForm()


              ///  Sign In


            ],
          ),
        ),
      ),
    );
  }
}

