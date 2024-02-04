import 'package:flutter/material.dart';
import 'package:unicon/domain/models/simple_button.dart';
import 'package:unicon/ui/atoms/auth_button.dart';
import 'package:unicon/ui/organism/pre_register_dialog.dart';

/// Layer of PreRegister of Buttons
class PreRegisterLayer extends StatelessWidget {
  /// Constructor
  const PreRegisterLayer({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<SimpleButtonModel> buttons = <SimpleButtonModel>[
      SimpleButtonModel(
        label: 'Pre Register',
        onPressed: () => _preRegisterDialog(context),
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
              .map(
                (SimpleButtonModel e) => <StatelessWidget>[
                  AuthButton(
                    label: e.label,
                    onPress: e.onPressed,
                  ),
                ],
              )
              .expand((List<StatelessWidget> element) => element)
              .toList(),
        ),
      ),
    );
  }

  void _preRegisterDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return const PreRegisterDialog();
        },
      );
}
