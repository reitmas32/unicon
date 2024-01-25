import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/ui/providers/theme.dart';

class PreRegisterView extends ConsumerStatefulWidget {
  const PreRegisterView({
    super.key,
  });

  @override
  ConsumerState<PreRegisterView> createState() => _PreRegisterViewState();
}

class _PreRegisterViewState extends ConsumerState<PreRegisterView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.87,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 300),
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
            const Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustonTextField(
                    lable: "First Name's *",
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Expanded(
                  flex: 1,
                  child: CustonTextField(
                    lable: "Last Names's *",
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                  ),
                ),
              ],
            ),
            const CustonTextField(
              lable: "Email *",
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
            ),
            const CustonTextField(
              lable: "University / Companie",
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
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
                    onPressed: () {
                      // TODO: Call API
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
  const CustonTextField({super.key, required this.lable, this.padding});

  final String lable;

  final EdgeInsetsGeometry? padding;

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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
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
