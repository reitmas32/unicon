import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/domain/services/pre_register.dart';
import 'package:unicon/ui/providers/theme.dart';

class PreRegisterView extends ConsumerStatefulWidget {
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
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.87,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: size.aspectRatio > 1.5 ? 300 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pre Register",
              style: GoogleFonts.jetBrainsMono(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustonTextField(
                    lable: "First Name's *",
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 10),
                    controller: firstNameController,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Expanded(
                  flex: 1,
                  child: CustonTextField(
                    lable: "Last Names's *",
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 10),
                    controller: lastNameController,
                  ),
                ),
              ],
            ),
            CustonTextField(
              lable: "Email *",
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              controller: emailController,
            ),
            CustonTextField(
              lable: "University / Companie",
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              controller: universityNameController,
            ),
            CustonTextField(
              lable: "Why are you interested in Unicon?",
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              controller: commentsController,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  const Spacer(),
                  TextButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AppTheme.purple, // Color del fondo del botón
                      foregroundColor:
                          Colors.black, // Color del texto del botón
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // Bordes cuadrados
                        side: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ), // Borde blanco
                      ),
                    ),
                    onPressed: () async {
                      final router = PreRegister();
                      router.post(
                        PreRegisterRequest(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          email: emailController.text,
                          comments: commentsController.text,
                          university: universityNameController.text,
                        ),
                      );
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
            )
          ],
        ),
      ),
    );
  }
}

class CustonTextField extends StatelessWidget {
  const CustonTextField({
    super.key,
    required this.lable,
    this.padding,
    this.controller,
  });

  final String lable;

  final EdgeInsetsGeometry? padding;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                lable,
                style: GoogleFonts.jetBrainsMono(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(12.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    borderRadius:
                        BorderRadius.zero, // O cualquier otro radio que desees
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
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
