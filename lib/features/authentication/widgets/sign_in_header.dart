import 'package:excel_hrm/utils/constants/image_strings.dart';
import 'package:excel_hrm/utils/constants/sizes.dart';
import 'package:excel_hrm/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          height: 150,
          image: AssetImage(HMImages.lightApplogo),
        ),
        Text(HMTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: HMSizes.sm),
        Text(HMTexts.onBoardingSubTitle1,
            style: Theme.of(context).textTheme.bodyMedium)
      ],
    );
  }
}
