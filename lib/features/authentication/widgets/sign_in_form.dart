import 'dart:developer';

import 'package:excel_hrm/features/authentication/provider/auth_provider.dart';
import 'package:excel_hrm/features/authentication/screens/sign_up_screen.dart';
import 'package:excel_hrm/features/home/screens/home_screen.dart';
import 'package:excel_hrm/utils/constants/sizes.dart';
import 'package:excel_hrm/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _isAnimated = false;
  bool _splashTextVisible = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String splashText =
      '''We make things you need arrive on time. You focus on what you need to do''';

  final formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  String forgetResponse = "";
  //
  // @override
  // // void initState() {
  //   super.initState();
  //   startAnimation();
  // }

  /// For Login Rider
  void loginUser() async {
    if (formKey.currentState!.validate()) {
      String _email = _emailController.text.trim();
      String _password = _passwordController.text.trim();

      if (_email.isEmpty) {
        showErrorSnackBar('Please enter an email');
      } else if (_password.isEmpty) {
        showErrorSnackBar('Please enter a password');
      } else {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        await authProvider.login(context, _email, _password  ).then((value) {
          log("value check : $value");
          if (value==true)
         //
          {
           return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));

          } else {

            showErrorSnackBar(authProvider.message.toString());
            // showErrorSnackBar('Login failed. Please try again.');
          }
        });
      }
    }
  }

  void showErrorSnackBar(String errorMessage) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ),
    );
  }

  /// For start animation
  // Future startAnimation() async {
  //   await Future.delayed(const Duration(milliseconds: 2500));
  //   setState(() {
  //     _isAnimated = true;
  //     _splashTextVisible = false;
  //   });
  // }

  String emailError = '';
  String passWordError = '';

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: HMSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: HMTexts.email,
              ),
            ),

            const SizedBox(
              height: HMSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.direct_right),
                labelText: HMTexts.password,
                suffixIcon: IconButton(
                  icon: Icon(_obscureText ? Iconsax.eye : Iconsax.eye),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: HMSizes.spaceBtwInputFields / 2,
            ),

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

                /// Forget Password
                TextButton(
                  onPressed: () {
                    // Implement forget password logic here
                  },
                  child: const Text(HMTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(
              height: HMSizes.spaceBtwSections,
            ),

            // Sign In Button
            authProvider.isLoading ==false ?
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  loginUser();
                },
                child: const Text(HMTexts.signIn),
              ),
            ): Center(child: CircularProgressIndicator()),

            const SizedBox(height: HMSizes.spaceBtwItems),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignUpScreen()));
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
