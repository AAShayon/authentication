import 'package:excel_hrm/features/authentication/widgets/sign_up_form.dart';
import 'package:excel_hrm/utils/constants/sizes.dart';
import 'package:excel_hrm/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark= HMHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HMSizes.defaultSpace),
          child: Column(
            children: [
              /// Title
              Text(HMTexts.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: HMSizes.spaceBtwSections),

              /// Form
              // HMSignUpForm(dark: dark),
              HMSignUpForm(),
              const SizedBox(
                height: HMSizes.spaceBtwSections,
              ),
              ///Divider
              //form_divider(dividerText: HMTexts.orSignUpWith.capitalize!),
              const SizedBox(
                height: HMSizes.spaceBtwSections,
              ),

              /// Social Buttons
              //const social_buttons(),

            ],
          ),
        ),
      ),
    );
  }
}




