import 'package:flutter/material.dart';
import 'package:nftmakrket/Colors/colors.dart';
import 'package:nftmakrket/Screens/Home.dart';
import 'package:nftmakrket/Screens/detailsAssets.dart';
import 'package:nftmakrket/Screens/listAssets.dart';

import 'Screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: fourth,
          secondary: first,
        ),
      ),
      home: const MySplash(),
      routes: {
        Home.routeName: (_) => const Home(),
        Details.routeName: (_) => const Details(id: ''),
        DetailsAssets.routeName: (_) => const DetailsAssets(idAssets: ''),
      },
    );
  }
}
