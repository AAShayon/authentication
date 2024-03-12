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

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String splashText = '''We make things you need arrive on time. You focus on what you need to do''';

  final formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  String forgetResponse = "";

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  /// For Login Rider
  void loginUser() async {
    if (formKey.currentState!.validate()) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showErrorSnackBar('Please enter an email');
      } else if (password.isEmpty) {
        showErrorSnackBar('Please enter a password');
      } else {
        // Use AuthProvider to handle login
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        await authProvider.login(context, email, password).then((value) {
          if (value == true) {

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));

          } else {
            // Show error message if login is unsuccessful
            showErrorSnackBar(authProvider.message.toString());

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
  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    setState(() {
      _isAnimated = true;
      _splashTextVisible = false;
    });
  }

  String emailError = '';
  String passWordError = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: HMSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: HMTexts.email,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                }
                return null;
              },
            ),

            const SizedBox(
              height: HMSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  loginUser();
                },
                child: const Text(HMTexts.signIn),
              ),
            ),

            const SizedBox(height: HMSizes.spaceBtwItems),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpScreen()));
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
