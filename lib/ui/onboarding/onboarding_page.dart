import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_challenge_login/ui/onboarding/onboarding_animation.dart';
import 'package:flutter_challenge_login/ui/onboarding/tabs/signin_tab.dart';
import 'package:flutter_challenge_login/ui/onboarding/tabs/signup_tab.dart';
import 'package:flutter_challenge_login/utility/app_constant.dart';
import 'package:flutter_challenge_login/utility/color_utility.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>  with TickerProviderStateMixin {
  PageController _pageController;
  AnimationController animationController;
  OnBoardingEnterAnimation onBoardingEnterAnimation;
  ValueNotifier<double> selectedIndex = ValueNotifier<double>(0.0);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );

    animationController = new AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);

    onBoardingEnterAnimation = OnBoardingEnterAnimation(animationController);

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomPadding: false,
      body: _buildContent()
  );

  Widget _buildContent() {
    final Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Stack(
            children: <Widget>[

              _buildTopBubble(size.height, - size.height * 0.5, - size.width * 0.1, LinearGradient(
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight,
                colors: <Color>[
                  Color(getColorHexFromStr("#EA9F57")),
                  Color(getColorHexFromStr("#DD6F85")),
                ],
              )),


              _buildTopBubble(size.width, - size.width * 0.5, size.width * 0.5, LinearGradient(
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight,
                colors: <Color>[
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.2),
                ],
              )),
              _buildTopBubble(size.width, - size.width * 0.5, - size.width * 0.7, LinearGradient(
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight,
                colors: <Color>[
                  Colors.white.withOpacity(0.0),
                  Colors.white.withOpacity(0.2),
                ],
              )),
              _buildTopBubble(size.width, - size.width * 0.7, - size.width * 0.4, LinearGradient(
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight,
                colors: <Color>[
                  Colors.white.withOpacity(0.0),
                  Colors.white.withOpacity(0.2),
                ],
              )),
              _buildTopBubble(size.width, - size.width * 0.7, size.width * 0.2, LinearGradient(
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight,
                colors: <Color>[
                  Colors.white.withOpacity(0.0),
                  Colors.white.withOpacity(0.2),
                ],
              )),
              _buildTopBubble(size.width * 0.5, - size.width * 0.5, size.width * 0.5, LinearGradient(
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight,
                colors: <Color>[
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.0),
                ],
              )),

              _buildTopBubble(size.height * 0.5, size.height * 0.5,  - size.width * 0.5, LinearGradient(
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight,
                colors: <Color>[
                  Color(getColorHexFromStr("#EC5A7A")),
                  Color(getColorHexFromStr("#E17D73")),
                ],
              )),

              FadeTransition(
                opacity: onBoardingEnterAnimation.fadeTranslation,
                child: NotificationListener(
                  onNotification: (ScrollNotification notification) {
                    if (notification.depth == 0 &&
                        notification is ScrollUpdateNotification) {
                      selectedIndex.value = _pageController.page;
                      setState(() {});
                    }
                    return false;
                  },
                  child: PageView(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    physics: new NeverScrollableScrollPhysics(),
                    onPageChanged: (int index) {},
                    children: <Widget>[
                      SignInTab(onPressed: () {
                        _pageController.animateToPage(1, duration: Duration(milliseconds: 1000), curve: Curves.fastOutSlowIn);
                      },),
                      SignUpTab(onPressed: () {
                        _pageController.animateToPage(0, duration: Duration(milliseconds: 1000), curve: Curves.fastOutSlowIn);
                      }),
                    ],
                  ),
                ),
              ),


              Positioned(
                top: size.height* 0.75,
                left: size.width* 0.1,
                child: InkWell(onTap: () {
                  Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('Google')));
                },child: _buildSocialMediaAppButton(COLOR_GOOGLE, IMAGE_PATH_GOOGLE, 48, - selectedIndex.value)),
              ),

              Positioned(
                top: size.height* 0.8,
                left: size.width* 0.3,
                child: InkWell(onTap: () {
                  Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('Facebook')));
                },child: _buildSocialMediaAppButton(COLOR_FACEBOOK, IMAGE_PATH_FACEBOOK, 48, - selectedIndex.value)),
              ),

              Positioned(
                top: size.height* 0.85,
                left: size.width* 0.5,
                child: InkWell(onTap: () {
                  Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('Twitter')));
                },child: _buildSocialMediaAppButton(COLOR_TWITTER, IMAGE_PATH_TWITTER, 48, - selectedIndex.value)),
              ),

              Positioned(
                top: size.height* 0.05,
                left: size.width* 0.3,
                child: InkWell(onTap: () {
                  Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('Google')));
                },child: _buildSocialMediaAppButton(COLOR_GOOGLE, IMAGE_PATH_GOOGLE, 48,1 - selectedIndex.value )),
              ),

              Positioned(
                top: size.height* 0.1,
                left: size.width* 0.5,
                child: InkWell(onTap: () {
                  Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('Facebook')));
                },child: _buildSocialMediaAppButton(COLOR_FACEBOOK, IMAGE_PATH_FACEBOOK, 48,1 - selectedIndex.value )),
              ),

              Positioned(
                top: size.height* 0.15,
                left: size.width* 0.7,
                child: InkWell(onTap: () {
                  Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('Twitter')));
                },child: _buildSocialMediaAppButton(COLOR_TWITTER, IMAGE_PATH_TWITTER, 48, 1 - selectedIndex.value )),
              ),


            ],
          );
        });
  }

  Widget _buildSocialMediaAppButton(
      String color, String image, double size, double animatedValue) {
    return FadeTransition(
      opacity: onBoardingEnterAnimation.fadeTranslation,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.translationValues(animatedValue * MediaQuery.of(context).size.height, 0,  0.0),
        child: Container(
          height: size,
          width: size,
          padding: const EdgeInsets.all(8.0),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: Color(getColorHexFromStr(color)),
          ),
          child: Image.asset(image),
        ),
      ),
    );
  }

  Widget _buildTopBubble(double diameter, double top, double right, LinearGradient linearGradient) {
    return Positioned(
      top: top,
      right: right,
      child: Transform(
        transform: Matrix4.diagonal3Values(onBoardingEnterAnimation.scaleTranslation.value, onBoardingEnterAnimation.scaleTranslation.value, 0.0),
        child: Container(
            height: diameter,
            width: diameter,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(diameter / 2),
                gradient: linearGradient
            )
        ),
      ),
    );
  }

}
