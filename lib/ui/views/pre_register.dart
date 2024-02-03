import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/domain/services/pre_register.dart';
import 'package:unicon/ui/providers/theme.dart';

///
class PreRegisterView extends ConsumerStatefulWidget {
  ///
  const PreRegisterView({
    super.key,
  });

  @override
  ConsumerState<PreRegisterView> createState() => _PreRegisterViewState();
}

class _PreRegisterViewState extends ConsumerState<PreRegisterView> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController universityNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController commentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: size.aspectRatio > 1.5 ? 300 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Pre Register',
            style: GoogleFonts.jetBrainsMono(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: size.aspectRatio >= 1.5 ? 100 : 10,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CustonTextField(
                  lable: "First Name's *",
                  controller: firstNameController,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Expanded(
                child: CustonTextField(
                  lable: "Last Names's *",
                  controller: lastNameController,
                ),
              ),
            ],
          ),
          CustonTextField(
            lable: 'Email *',
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            controller: emailController,
          ),
          CustonTextField(
            lable: 'University / Companie',
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            controller: universityNameController,
          ),
          CustonTextField(
            lable: 'Why are you interested in Unicon?',
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            controller: commentsController,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: <Widget>[
                const Spacer(),
                TextButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppTheme.purple, // Color del fondo del botón
                    foregroundColor: Colors.black, // Color del texto del botón
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(), // Borde blanco
                    ),
                  ),
                  onPressed: () async {
                    final PreRegister router = PreRegister();

                    String message = '';

                    if (firstNameController.text.isEmpty) {
                      message = 'First name is required*';
                    } else if (lastNameController.text.isEmpty) {
                      message = 'Last name is required*';
                    } else if (emailController.text.isEmpty) {
                      message = 'Email is required*';
                    } else if (!isEmail(emailController.text)) {
                      message = 'Email incorrect';
                    }

                    if (message != '') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.black,
                          content: Text(
                            message,
                            style: GoogleFonts.jetBrainsMono(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    } else {
                      router.post(
                        PreRegisterRequest(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          email: emailController.text,
                          comments: commentsController.text,
                          university: universityNameController.text,
                        ),
                      );

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: SizedBox(
                              width: 300,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SvgPicture.asset(
                                    'assets/unicon.svg',
                                    height: 100,
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    '''
¡Tu preregistro ha sido enviado con éxito! Por favor, revisa tu bandeja de correo electrónico, ya que te informaremos allí sobre los próximos pasos. ¡Gracias!''',
                                    style: GoogleFonts.jetBrainsMono(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.white, // Color del borde
                              ),
                            ),
                            backgroundColor: Colors.black,
                            actions: <Widget>[
                              TextButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme
                                      .purple, // Color del fondo del botón
                                  foregroundColor:
                                      Colors.black, // Color del texto del botón
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(), // Borde blanco
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'Confirm',
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text(
                    'Confirm',
                    style: GoogleFonts.jetBrainsMono(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }

  bool isEmail(String email) {
    // Expresión regular para validar un correo electrónico
    final RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return regex.hasMatch(email);
  }
}

///
class CustonTextField extends StatelessWidget {
  ///
  const CustonTextField({
    super.key,
    required this.lable,
    this.padding,
    this.controller,
  });

  ///
  final String lable;

  ///
  final EdgeInsetsGeometry? padding;

  ///
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                lable,
                style: GoogleFonts.jetBrainsMono(
                  color: Colors.white,
                  fontSize: size.height > 1000 ? 20 : 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(size.height > 1000 ? 12 : 8),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius:
                        BorderRadius.zero, // O cualquier otro radio que desees
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
