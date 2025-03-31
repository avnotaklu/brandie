
import 'dart:math';
import 'dart:ui';

import 'package:brandie/constants.dart';
import 'package:flutter/material.dart';

class SalesPopUpWidget extends StatefulWidget {
  const SalesPopUpWidget({super.key});

  @override
  State<SalesPopUpWidget> createState() => _SalesPopUpWidgetState();
}

class _SalesPopUpWidgetState extends State<SalesPopUpWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final strings = [
    'Generating your sales link..',
    'Copying the caption to clipboard',
    'Saving the content to your profile',
    'Preparing the content for social media',
  ];
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4), // Animation duration
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addListener(() {
      if(_animation.value == 1.0) {
        Navigator.pop(context);
      }
    });
    super.initState();
  }

  void startAnimation() {
    _controller.forward(from: 0.0); // Restart animation
  }

  void pauseAnimation() {
    _controller.stop();
  }

  int curStep = 1;

  Stream<int?> imageEvents() async* {
    while (true) {
      curStep += 1;
      if (curStep - 1 <= 4) {
        yield curStep - 1;
      }
      await Future.delayed(Duration(seconds: 1));
    }
  }

  int progress = 0;

  @override
  Widget build(BuildContext context) {
    startAnimation();

    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                color: Colors.black.withOpacity(0.3), // Optional dark overlay
              ),
            ),

          Center(
            child: Container(
              height: h * 0.3,
              width: w * 0.6,
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/oriflame_o.png'),
                  SizedBox(height: 20),
          
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Text(
                        strings[(min(_animation.value, .99) * 4).floor()],
                        textAlign: TextAlign.center,
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge?.copyWith(color: Color(0xffb1b1b1)),
                      );
                    },
                  ),
          
                  SizedBox(height: 20),
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return LinearProgressIndicator(
                        value: _animation.value,
                        backgroundColor: Colors.grey[300],
                        color: greenAccent,
                        minHeight: 10,
                        borderRadius: BorderRadius.circular(10),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // child: StreamBuilder(
      //     stream: imageEvents().take(4),

      //     builder: (c, s) {
      //       return Con;
      //     },
      //   ),
    );
  }
}