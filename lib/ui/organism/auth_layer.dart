import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/domain/models/simple_button.dart';
import 'package:unicon/ui/atoms/auth_button.dart';
import 'package:unicon/ui/organism/register_dialog.dart';
import 'package:unicon/ui/organism/siging_dialog.dart';

/// Auth Layer of Buttons
class AuthLayer extends StatelessWidget {
  /// Constructor
  const AuthLayer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SimpleButtonModel> buttons = <SimpleButtonModel>[
      SimpleButtonModel(
        label: 'Log In',
        onPressed: () => sigInDialog(context),
      ),
      SimpleButtonModel(
        label: 'Register',
        onPressed: () => registerDialog(context),
      ),
    ];

    return Positioned(
      top: 80,
      right: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: buttons
            .map(
              (SimpleButtonModel e) => <StatelessWidget>[
                AuthButton(
                  label: e.label,
                  onPress: e.onPressed,
                ),
                if (e != buttons.last)
                  Text(
                    ' | ',
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 27,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                    ),
                  ),
              ],
            )
            .expand((List<StatelessWidget> element) => element)
            .toList(),
      ),
    );
  }

  /// CallBack function by signIn
  void sigInDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return const SigInDialog();
        },
      );

  /// CallBack function by register
  void registerDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return const RegisterDialog();
        },
      );
}
