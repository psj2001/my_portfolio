import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:js' as js;
import 'package:icons_plus/icons_plus.dart';
import 'package:my_portfolio/constants/Size.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/nav%20items.dart';
import 'package:my_portfolio/constants/sns_links.dart';
import 'package:my_portfolio/utils/project_utils.dart';
import 'package:my_portfolio/widgets/Custon%20Textfeild.dart';
import 'package:my_portfolio/widgets/Drawer%20Mobile.dart';
import 'package:my_portfolio/widgets/HeaderMobile.dart';
import 'package:my_portfolio/widgets/Home%20Desktop.dart';
import 'package:my_portfolio/widgets/MainDesktop.dart';
import 'package:my_portfolio/widgets/Projects.dart';
import 'package:my_portfolio/widgets/Skills%20desktop.dart';
import 'package:my_portfolio/widgets/Skills%20mobile.dart';
import 'package:my_portfolio/widgets/contact%20section.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/project%20card%20.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollcontroller = ScrollController();
  final List<GlobalKey> navbarkeys =
      List.generate(navTitles.length, (index) => GlobalKey());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          key: scaffoldKey,
          endDrawer: constraints.maxWidth >= kminDestopwidth
              ? null
              : DrawerMobile(
                  onNavItemTap: (int navIndex) {
                    scaffoldKey.currentState?.closeEndDrawer();
                    scrollTosection(navIndex);
                  },
                ),
          backgroundColor: CustomColor.scaffoldBg,
          body: SingleChildScrollView(
            controller: scrollcontroller,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                //Main
                SizedBox(
                  key: navbarkeys.first,
                ),
                if (constraints.maxWidth >= kminDestopwidth)
                  HeaderDesktop(
                    onNavItemTap: (int Navindex) {
                      scrollTosection(Navindex);
                    },
                  )
                else
                  HeaderMobile(
                    onLogoTap: () {},
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
                if (constraints.maxWidth >= kminDestopwidth)
                  MainDesktop(screenSize: screenSize, screenWidth: screenWidth)
                else
                  MainMobile(
                      screenHeight: screenHeight, screenWidth: screenWidth),
                //
                // ConstrainedBox(
                //   constraints: BoxConstraints(maxWidth: screenWidth),
                //   child: Container(
                //     alignment: Alignment.center,
                //     //color: CustomColor.bgLight1,
                //     padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                //     width: screenWidth,
                //     child: Column(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         //title
                //         const Text(
                //           'About Me',
                //           style: TextStyle(
                //             fontSize: 24,
                //             fontWeight: FontWeight.bold,
                //             color: CustomColor.whitePrimary,
                //           ),
                //         ),
                //         SizedBox(
                //           height: 30,
                //         ),
                //         AnimatedTextKit(
                //           isRepeatingAnimation: false,
                //           animatedTexts: [
                //             TyperAnimatedText(
                //               speed: Duration(milliseconds: 5),
                //               'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
                //             ),
                //           ],
                //         ),
                //         Text(''),
                //       ],
                //     ),
                //   ),
                // ),
                //Skills
                Container(
                  key: navbarkeys[1],
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  width: screenWidth,
                  color: CustomColor.bgLight1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //title
                      const Text(
                        'What I can do',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      //Platforms and skills
                      if (constraints.maxWidth >= kmedDestopwidth)
                        SkillsDesktop()
                      else
                        SkillsMobile()
                    ],
                  ),
                ), //Projects
                SizedBox(
                  height: 30,
                ),
                Projects(
                  screenWidth: screenWidth,
                  key: navbarkeys[2],
                ),
                //contact
                SizedBox(
                  height: 30,
                ),
                ContactSection(
                  getInputBorder: getInputBorder,
                  key: navbarkeys[3],
                ),
                SizedBox(
                  height: 30,
                ),
                //Footer
                Footer()
              ],
            ),
          ));
    });
  }

  void scrollTosection(int navIndex) {
    if (navIndex == 4) {
      js.context.callMethod('open', [SnsLinks.blog]);
      //Open Blog page.
      return;
    }
    final key = navbarkeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  OutlineInputBorder get getInputBorder {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none);
  }
}
