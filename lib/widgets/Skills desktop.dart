import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/skills_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //platforms .
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 450,
          ),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              for (int i = 0; i < platformItems.length; i++)
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: CustomColor.bgLight2,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10,
                    ),
                    leading: Image.asset(
                      platformItems[i]["img"],
                      width: 26.0,
                      height: 100,
                    ),
                    title: Text(platformItems[i]["title"]),
                  ),
                )
            ],
          ),
        ),
        SizedBox(
          width: 50,
        ),
        //Skills
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            child: Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                for (int i = 0; i < skillItems.length; i++)
                  Chip(
                    backgroundColor: CustomColor.bgLight2,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    label: Text(skillItems[i]['title']),
                    avatar: Image.asset(skillItems[i]['img']),
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MainMobile extends StatelessWidget {
  const MainMobile({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      height: screenHeight,
      constraints: BoxConstraints(
        minHeight: 560,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //avatar image
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                CustomColor.scaffoldBg,
                CustomColor.scaffoldBg.withOpacity(0.6)
              ]).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset(
              'assets/Flutter avatar.png',
              width: screenWidth,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //intro text
          Text(
            "Hi,\nI'm Pranav PS\nA Flutter Developer",
            style: TextStyle(
              height: 1.5,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 190,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.yellowPrimary, // Background color
              ),
              onPressed: () {},
              child: Text('Get in touch'),
            ),
          ),
          //bn
        ],
      ),
    );
  }
}
