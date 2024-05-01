import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({
    super.key,
    required this.screenSize,
    required this.screenWidth,
  });

  final Size screenSize;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height / 1.2,
      constraints: BoxConstraints(minHeight: 350.0),
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Hi,\nI'm Pranav PS\nA Flutter Developer",
                style: TextStyle(
                  height: 1.5,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        CustomColor.yellowPrimary, // Background color
                  ),
                  onPressed: () {},
                  child: Text('Get in touch'),
                ),
              ),
            ],
          ),
          Image.asset(
            'assets/Flutter avatar.png',
            width: screenWidth / 2,
          )
        ],
      ),
    );
  }
}
