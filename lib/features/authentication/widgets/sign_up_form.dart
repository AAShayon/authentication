import 'package:excel_hrm/utils/constants/colors.dart';
import 'package:excel_hrm/utils/constants/sizes.dart';
import 'package:excel_hrm/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HMSignUpForm extends StatelessWidget {
  const HMSignUpForm({
    super.key,
    //required this.dark,
  });

  //final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// First & last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: HMTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: HMSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: HMTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: HMSizes.spaceBtwInputFields,
          ),

          /// Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: HMTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: HMSizes.spaceBtwInputFields,
          ),

          /// Email
          TextFormField(
            decoration: const InputDecoration(
                labelText: HMTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: HMSizes.spaceBtwInputFields,
          ),

          /// Phone Number
          TextFormField(
            decoration: const InputDecoration(
                labelText: HMTexts.phoneNo,
                prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: HMSizes.spaceBtwInputFields,
          ),

          /// Password
          TextFormField(
            decoration: const InputDecoration(
              labelText: HMTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),

          const SizedBox(
            height: HMSizes.spaceBtwInputFields,
          ),

          /// terms & Condition CheckBox
          Row(
            children: [
              SizedBox(
                  height: 24,
                  width: 24,
                  child:
                  Checkbox(value: true, onChanged: (value) {})),
              const SizedBox(
                width: HMSizes.spaceBtwItems,
              ),
              Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: '${HMTexts.iAgreeTo} ' ,style: Theme.of(context).textTheme.bodySmall
                    ),
                    TextSpan(
                      text: '${HMTexts.privacyPolicy} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                        decoration: TextDecoration.underline,
                       // decorationColor: dark ? HMColors.white : HMColors.primary
                    ),
                    ),
                    TextSpan(
                        text: '${HMTexts.and} ' ,style: Theme.of(context).textTheme.bodySmall
                    ),
                    TextSpan(
                      text: HMTexts.termOfuse, style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color:  HMColors.primary,
                        // color:  dark ? HMColors.white :  HMColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:HMColors.primary
                    ),
                    ),
                  ]

              ))
            ],
          ),
          const SizedBox(
            height: HMSizes.spaceBtwInputFields,
          ),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: ()
              {},
              // {
              //   Get.to(() => const VarifyEmailScreen());
              // },
              child: const Text(HMTexts.createAccount),
            ),
          ),
        ],
      ),

    );
  }
}