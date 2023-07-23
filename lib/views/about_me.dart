
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_nishant/globals/app_assets.dart';
import 'package:portfolio_nishant/globals/app_colors.dart';
import 'package:portfolio_nishant/globals/constants.dart';
import 'package:portfolio_nishant/helper%20class/helper_class.dart';

import '../globals/app_buttons.dart';
import '../globals/app_text_styles.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildAboutMeContents(),
          Constants.sizedBox(height: 35.0),
          // buildProfilePicture(),
        ],
      ),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // buildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents())
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // buildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents())
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  FadeInRight buildProfilePicture() {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: Image.asset(
        AppAssets.profile2,
        height: 450,
        width: 400,
      ),
    );
  }

  Column buildAboutMeContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: RichText(
            text: TextSpan(
              text: 'About ',
              style: AppTextStyles.headingStyles(fontSize: 40.0),
              children: [
                TextSpan(
                  text: 'Me!',
                  style: AppTextStyles.headingStyles(
                      fontSize: 30, color: AppColors.robinEdgeBlue),
                )
              ],
            ),
          ),
        ),
        Constants.sizedBox(height: 6.0),
        // FadeInLeft(
        //   duration: const Duration(milliseconds: 1400),
        //   child: Text(
        //     'Flutter Developer!',
        //     style: AppTextStyles.montserratStyle(color: Colors.white),
        //   ),
        // ),
        Constants.sizedBox(height: 8.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1600),
          child: Text(
            'Greetings! I am  a senior at Indian Institute of Information Technology, Kottayam, with a passion for pushing the boundaries of technology. Proficient in Flutter, React JS, and C++, I have crafted impactful projects and contributed to open-source events. I thrive on learning new tech stacks swiftly, making me a flexible and adaptive developer.',
            style: AppTextStyles.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        // FadeInUp(
        //   duration: const Duration(milliseconds: 1800),
        //   child: AppButtons.buildMaterialButton(
        //       onTap: () {}, buttonName: 'Read More'),
        // )
      ],
    );
  }
}
