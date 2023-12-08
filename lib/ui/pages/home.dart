import 'package:flutter/material.dart';
import 'package:unicon/ui/atoms/simple_button.dart';
import 'package:unicon/ui/organism/background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundWidget(
        child: Center(
          child: SimpleButton(
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
