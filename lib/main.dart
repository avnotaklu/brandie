
import 'dart:math';
import 'dart:ui';

import 'package:brandie/constants.dart';
import 'package:brandie/content.dart';
import 'package:brandie/edit_caption_page.dart';
import 'package:brandie/widgets/sales_popup.dart';
import 'package:brandie/widgets/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oriflame',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily:
            GoogleFonts.poppins().fontFamily, // Global font for all text
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
          displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),

          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),

          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),

          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),

          labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ).copyWith(primary: Color(0xff7EC086)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  late PageController _pageController;

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Container(
              height: h * 0.1,
              child: Stack(
                children: [
                  TopBar(),
                  Positioned(
                    right: 30,
                    top: 30,
                    child: Container(
                      height: h * 0.045,
                      width: h * 0.045,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: greenAccent,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _controller,
          padding: EdgeInsets.all(0),
          labelPadding: EdgeInsets.all(0),
          
          dividerColor: Colors.transparent,
          labelStyle: TextStyle(
            color: greenAccent,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          indicator: BoxDecoration(),
          unselectedLabelStyle: TextStyle(
            color: grey,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          tabs: [
            Tab(text: "Smart Post"),
            Tab(text: "Library"),
            Tab(text: "Communities"),
            Tab(text: "Share&Win"),
          ],
        ),
      ),

      body: TabBarView(
        controller: _controller,
        children: [
          ContentScreen(),

          // PageView.builder(
          //   controller: _pageController,
          //   scrollDirection: Axis.vertical,
          //   itemBuilder:
          //       (context, i) => ContentScreen(
          //         image: contentImages[i],
          //         content: contentBody[i],
          //         songAndArtist: songAndArtist[i],
          //       ),
          // ),
          Container(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ).copyWith(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (contxt) => SalesPopUpWidget(),
                );
              },
              child: Container(
                height: 32,
                width: 32,
                child: SvgPicture.asset(
                  "assets/images/bottom_bar_icons/1.svg",
                  fit: BoxFit.fill,
                ),
              ),
            ),

            Container(
              height: 32,
              width: 32,
              child: SvgPicture.asset(
                "assets/images/bottom_bar_icons/2.svg",
                fit: BoxFit.fill,
              ),
            ),

            Container(
              height: 32,
              width: 32,
              child: SvgPicture.asset(
                "assets/images/bottom_bar_icons/3.svg",
                fit: BoxFit.fill,
              ),
            ),

            Container(
              height: 32,
              width: 32,
              child: SvgPicture.asset(
                "assets/images/bottom_bar_icons/4.svg",
                fit: BoxFit.fill,
              ),
            ),

            Container(
              height: 32,
              width: 32,
              child: SvgPicture.asset(
                "assets/images/bottom_bar_icons/5.svg",
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
    );
  }
}