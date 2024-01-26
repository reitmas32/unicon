import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/domain/models/simple_button.dart';
import 'package:unicon/ui/atoms/auth_button.dart';
import 'package:unicon/ui/organism/pre_register_dialog.dart';

class PreRegisterLayer extends StatelessWidget {
  const PreRegisterLayer({super.key});

  @override
  Widget build(BuildContext context) {
    final buttons = [
      SimpleButtonModel(
        lable: "Pre Register",
        onPressed: () => preRegisterDialog(context),
      ),
    ];

    return Positioned(
      top: 80,
      right: 80,
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
    );
  }

  void preRegisterDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return const PreRegisterDialog();
        },
      );
}
