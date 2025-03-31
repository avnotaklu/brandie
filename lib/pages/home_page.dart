import 'package:brandie/constants.dart';
import 'package:brandie/pages/content_page.dart';
import 'package:brandie/widgets/sales_popup.dart';
import 'package:brandie/widgets/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
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
            SizedBox(
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
              child: SizedBox(
                height: 32,
                width: 32,
                child: SvgPicture.asset(
                  "assets/images/bottom_bar_icons/1.svg",
                  fit: BoxFit.fill,
                ),
              ),
            ),

            SizedBox(
              height: 32,
              width: 32,
              child: SvgPicture.asset(
                "assets/images/bottom_bar_icons/2.svg",
                fit: BoxFit.fill,
              ),
            ),

            SizedBox(
              height: 32,
              width: 32,
              child: SvgPicture.asset(
                "assets/images/bottom_bar_icons/3.svg",
                fit: BoxFit.fill,
              ),
            ),

            SizedBox(
              height: 32,
              width: 32,
              child: SvgPicture.asset(
                "assets/images/bottom_bar_icons/4.svg",
                fit: BoxFit.fill,
              ),
            ),

            SizedBox(
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