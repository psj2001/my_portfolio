import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:my_portfolio/constants/Size.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/sns_links.dart';
import 'package:my_portfolio/widgets/Custon%20Textfeild.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({
    super.key,
    required this.getInputBorder,
  });

  final OutlineInputBorder getInputBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          //title
          Text(
            'Get in touch',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColor.whitePrimary,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 700,
                maxHeight: 100,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth >= kminDestopwidth) {
                    return buildnameEmailFieldDesktop();
                  }
                  return buildnameEmailFieldMobile();
                },
              )),
          SizedBox(
            height: 15,
          ),
          //message
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: CustomTexfeild(
              getInputBorder: getInputBorder,
              hinttext: 'your Message',
              maxline: 16,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: SizedBox(
              height: 40,
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      CustomColor.yellowPrimary, // Background color
                ),
                onPressed: () {},
                child: Text('Get in touch'),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 300), child: Divider()),

          SizedBox(
            height: 15,
          ),
          //sns icon button links.
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    js.context.callMethod('open', [SnsLinks.github]);
                  },
                  icon: Icon(Bootstrap.github)),
              IconButton(
                  onPressed: () {
                    js.context.callMethod('open', [SnsLinks.facebook]);
                  },
                  icon: Icon(Bootstrap.facebook)),
              IconButton(
                  onPressed: () {
                    js.context.callMethod('open', [SnsLinks.instagram]);
                  },
                  icon: Icon(Bootstrap.instagram)),
              IconButton(
                  onPressed: () {
                    js.context.callMethod('open', [SnsLinks.linkedin]);
                  },
                  icon: Icon(Bootstrap.linkedin)),
              IconButton(
                  onPressed: () {
                    js.context.callMethod('open', [SnsLinks.telegram]);
                  },
                  icon: Icon(Bootstrap.telegram)),
            ],
          )
        ],
      ),
    );
  }

  Row buildnameEmailFieldDesktop() {
    return Row(
      children: [
        //name
        Flexible(
          child: CustomTexfeild(
            getInputBorder: getInputBorder,
            hinttext: 'your name',
          ),
        ),
        SizedBox(
          width: 15,
        ),
        //email
        Flexible(
          child: CustomTexfeild(
            getInputBorder: getInputBorder,
            hinttext: 'your email',
          ),
        ),
      ],
    );
  }

  Column buildnameEmailFieldMobile() {
    return Column(
      children: [
        //name
        Flexible(
          child: CustomTexfeild(
            getInputBorder: getInputBorder,
            hinttext: 'your name',
          ),
        ),
        SizedBox(
          height: 15,
        ),
        //email
        Flexible(
          child: CustomTexfeild(
            getInputBorder: getInputBorder,
            hinttext: 'your email',
          ),
        ),
      ],
    );
  }
}
