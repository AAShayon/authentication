import 'package:excel_hrm/features/authentication/screens/sign_up_screen.dart';
import 'package:excel_hrm/features/home/screens/home_screen.dart';
import 'package:excel_hrm/utils/constants/sizes.dart';
import 'package:excel_hrm/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:hm_e_commerce/features/authentication/screens/password_configuration/forget_password.dart';
// import 'package:hm_e_commerce/features/authentication/screens/signup/sign_up_page.dart';
// import 'package:hm_e_commerce/navigation%20_menu.dart';
// import 'package:hm_e_commerce/utils/constants/sizes.dart';
// import 'package:hm_e_commerce/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: HMSizes.spaceBtwSections),
        child: Column(
          children: [
            //Email
            TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: HMTexts.email
                )
            ),

            const SizedBox(
              height: HMSizes.spaceBtwInputFields,
            ),

            // Password

            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: HMTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(
              height: HMSizes.spaceBtwInputFields / 2,
            ),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(HMTexts.rememberMe),
                  ],
                ),

                ///Forget Password
                TextButton(
                    onPressed: (){},
                    //     () => Get.to(() => ForgetPassword();
                    // ),
                    child: const Text(HMTexts.forgetPassword)),
              ],
            ),
            const SizedBox(
              height: HMSizes.spaceBtwSections,
            ),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeScreen()));
                },
                // {
                //   Get.to(() => const NavigationMenu());
                // },
                child: const Text(HMTexts.signIn),
              ),
            ),

            const SizedBox(height: HMSizes.spaceBtwItems),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: ()
                {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUpScreen()));
                  // Get.to(() => const SignUpScreen());
                },
                child: const Text(HMTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
