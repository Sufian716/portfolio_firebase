import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:portfolio/const/colors.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/providers/nav_bar_provider.dart';
import 'package:portfolio/providers/project_provider.dart';
import 'package:provider/provider.dart';




await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProjectProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        }),
        title: 'Sufian Bourkha Tahiri - Portfolio',
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: ConstColors.primaryColor,
        ),
        home: const HomePage(),
      ),
    );
  }
}

