import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:nftmakrket/Screens/Home.dart';

class MySplash extends StatefulWidget {
  const MySplash({Key? key}) : super(key: key);

  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyWidget(nextScreen: const Home());
  }
}

class MyWidget extends StatelessWidget {
  Widget nextScreen;
  MyWidget({required this.nextScreen, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 50,
      nextScreen: nextScreen,
      splashTransition: SplashTransition.fadeTransition,
      splash: const Text('NFT market', style: TextStyle(fontSize: 80)),
      splashIconSize: 400,
      backgroundColor: Color.fromARGB(255, 183, 184, 204),
    );
  }
}
