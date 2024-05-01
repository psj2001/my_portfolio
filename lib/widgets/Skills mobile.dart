import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/skills_items.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
      child: Column(
        children: [
          //Platforms.
          for (int i = 0; i < platformItems.length; i++)
            Container(
              margin: EdgeInsets.only(bottom: 5.0),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: CustomColor.bgLight2,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                leading: Image.asset(
                  platformItems[i]['img'],
                  width: 26.0,
                ),
                title: Text(platformItems[i]['title']),
              ),
            ),
          SizedBox(
            height: 50,
          ),
          //skills
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < skillItems.length; i++)
                Chip(
                  backgroundColor: CustomColor.bgLight2,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  label: Text(skillItems[i]['title']),
                  avatar: Image.asset(skillItems[i]['img']),
                )
            ],
          )
        ],
      ),
    );
  }
}
