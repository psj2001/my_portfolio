import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/nav%20items.dart';
import 'package:my_portfolio/styles/Styles.dart';
import 'package:my_portfolio/widgets/Site%20Logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key, required this.onNavItemTap});
  final Function(int) onNavItemTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: KHeaderDecoration,
      width: double.maxFinite,
      child: Row(
        children: [
          SiteLogo(
            onTap: () {},
          ),
          Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextButton(
                onPressed: () {
                  onNavItemTap(i);
                },
                child: Text(
                  navTitles[i],
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.whitePrimary),
                ),
              ),
            )
        ],
      ),
    );
  }
}
