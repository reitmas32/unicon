import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/domain/models/simple_button.dart';
import 'package:unicon/ui/atoms/auth_button.dart';
import 'package:unicon/ui/organism/pre_register_dialog.dart';

class PreRegisterLayer extends StatelessWidget {
  const PreRegisterLayer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final buttons = [
      SimpleButtonModel(
        lable: "Pre Register",
        onPressed: () => preRegisterDialog(context),
      ),
    ];

    return Positioned(
      top: size.aspectRatio <= 1.1 ? 15 : 80,
      right: size.aspectRatio <= 1.1 ? 0 : 80,
      left: size.aspectRatio <= 1.1 ? 0 : null,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: buttons
              .map((e) => [
                    AuthButton(
                      label: e.lable,
                      onPress: e.onPressed,
                    ),
                    if (e != buttons.last)
                      Text(
                        " | ",
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 27,
                          fontWeight: FontWeight.w100,
                          color: Colors.white,
                        ),
                      ),
                  ])
              .expand((element) => element)
              .toList(),
        ),
      ),
    );
  }

  void preRegisterDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return const PreRegisterDialog();
        },
      );
}
