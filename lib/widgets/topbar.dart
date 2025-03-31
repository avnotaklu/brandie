import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: h * 0.08,
          child: Center(
            child: Image.asset('assets/images/oriflame.webp', fit: BoxFit.fill),
          ),
        ),
      ],
    );
  }
}
