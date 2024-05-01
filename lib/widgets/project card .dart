import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/utils/project_utils.dart';
import 'dart:js' as js;

class ProjectCardwidget extends StatelessWidget {
  ProjectCardwidget({
    super.key,
    required this.projectUtils,
  });
  final ProjectUtils projectUtils;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 290,
      width: 260,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: CustomColor.bgLight2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //project img
          Image.asset(
            'assets/Projects/ch1.png',
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            height: 140,
            width: 260,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              projectUtils.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          //Subtitle
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              projectUtils.subtitle,
              style: TextStyle(
                fontSize: 12,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ),
          //footer
          Spacer(),
          Container(
            color: CustomColor.bgLight1,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Text(
                  'Available on :',
                  style:
                      TextStyle(color: CustomColor.yellowPrimary, fontSize: 10),
                ),
                Spacer(),
                if (projectUtils.ioslink != null)
                  InkWell(
                    onTap: () {
                      js.context.callMethod('open', [projectUtils.ioslink]);
                    },
                    child: Image.asset(
                      'assets/android_icon.png',
                      width: 30,
                    ),
                  ),
                if (projectUtils.androidlink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                      onTap: () {
                        js.context
                            .callMethod('open', [projectUtils.androidlink]);
                      },
                      child: Image.asset(
                        'assets/android_icon.png',
                        width: 30,
                      ),
                    ),
                  ),
                if (projectUtils.weblink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod('open', [projectUtils.weblink]);
                      },
                      child: Image.asset(
                        'assets/android_icon.png',
                        width: 30,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
