import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_nishant/globals/app_assets.dart';
import 'package:portfolio_nishant/globals/app_buttons.dart';
import 'package:portfolio_nishant/globals/app_colors.dart';
import 'package:portfolio_nishant/globals/app_links.dart';
import 'package:portfolio_nishant/globals/app_text_styles.dart';
import 'package:portfolio_nishant/globals/constants.dart';
import 'package:portfolio_nishant/helper%20class/helper_class.dart';
import 'package:portfolio_nishant/widgets/profile_animation.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final socialButtons = <String>[
    AppAssets.linkedIn,
    AppAssets.insta,
    AppAssets.github,
    AppAssets.leetcode
  ];
  final Links = <String>[
    Applinks.linkedinlink,
    Applinks.instagramlink,
    Applinks.githublink,
    Applinks.leetcodelink,
  ];

  var socialBI;
  final yourScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildHomePersonalInfo(size),
          Constants.sizedBox(height: 25.0),
        ],
      ),
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: Colors.transparent,
    );
  }

  Column buildHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            'Hello, It\'s Me',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInRight(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Nishant Bhujbal',
            style: AppTextStyles.headingStyles(),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Row(
            children: [
              Text(
                'And I\'m a ',
                style: AppTextStyles.montserratStyle(color: Colors.white),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Flutter Developer',
                    textStyle:
                        AppTextStyles.montserratStyle(color: Colors.lightBlue),
                  ),
                  TyperAnimatedText('Student',
                      textStyle: AppTextStyles.montserratStyle(
                          color: Colors.lightBlue)),
                ],
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              )
            ],
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInDown(
          duration: const Duration(milliseconds: 1600),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Passionate student and software developer, dedicated to building impactful applications and services that empower users.',
                  style: AppTextStyles.normalStyle(),
                ),
              ),
            ],
          ),
        ),
        Constants.sizedBox(height: 20.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1600),
          child: SizedBox(
            height: 48,
            child: Scrollbar(
              controller: yourScrollController,
              child: ListView.separated(
                itemCount: socialButtons.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                controller: yourScrollController,
                separatorBuilder: (context, child) =>
                    Constants.sizedBox(width: 8.0),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      html.window.open(Links[index], "");
                    },
                    onHover: (value) {
                      setState(() {
                        if (value) {
                          socialBI = index;
                        } else {
                          socialBI = null;
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(5.0),
                    hoverColor: AppColors.themeColor,
                    splashColor: AppColors.lawGreen,
                    child: buildSocialButton(
                        asset: socialButtons[index],
                        hover: socialBI == index ? true : false),
                  );
                },
              ),
            ),
          ),
        ),
        Constants.sizedBox(height: 18.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: AppButtons.buildMaterialButton(
              onTap: () {
                html.window.open(
                    "https://drive.google.com/drive/u/0/folders/13lryhwzX-7U6QiB05PF2-RxczTDx9Nsk",
                    "Resume");
              },
              buttonName: 'Download CV'),
        ),
      ],
    );
  }

  Ink buildSocialButton({required String asset, required bool hover}) {
    return Ink(
      width: 45,
      height: 45,
      // decoration: BoxDecoration(
      //   border: Border.all(color: AppColors.themeColor, width: 2.0),
      //   color: AppColors.bgColor,
      //   shape: BoxShape.circle,
      // ),
      padding: const EdgeInsets.all(6),
      child: Image.asset(
        asset,
        width: 10,
        height: 12,
        color: hover ? AppColors.bgColor : AppColors.themeColor,
        // fit: BoxFit.fill,
      ),
    );
  }
}
