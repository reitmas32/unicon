import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_widget/widget/markdown.dart';
import 'package:unicon/ui/providers/section_reader.dart';
import 'package:unicon/ui/providers/theme.dart';

class PreRegisterDialog extends ConsumerWidget {
  const PreRegisterDialog({
    super.key,
  });

  final String text = """
# ¿Te Interesa Asistir a UniCon?
¡Excelente! Regístrate ahora para estar en nuestra lista de espera y acceder a beneficios exclusivos. Aquí te explicamos cómo funciona:

Regístrate Aquí: Completa el formulario con tu información. Esto te añadirá a nuestra lista de espera.

Acceso Pre y Descuento: Al estar en la lista, tendrás la oportunidad de acceder al registro oficial antes que nadie y recibirás un descuento del 10% en tu entrada.

Atención Importante: Este registro no es un registro oficial para el evento. Es un paso preliminar que te permitirá ser de los primeros en saber cuándo se abre el registro oficial.

Notificación Vía Email: Te enviaremos un correo electrónico en cuanto el registro oficial esté disponible. ¡Asegúrate de registrarte oficialmente en ese momento para confirmar tu asistencia y aprovechar tu descuento!

Estadísticas y Organización: Recopilamos estas inscripciones preliminares para estimar el interés en el evento y asegurarnos de que todo esté perfectamente organizado para nuestros asistentes.
""";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ref.watch(sectionsReaderProvider);
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      content: SizedBox(
        width: size.aspectRatio > 1.5 ? size.width / 3 : size.width / 1.2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/unicon.svg",
              height: 100,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "PreRegister",
              style: GoogleFonts.jetBrainsMono(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: size.height / 2,
              child: MarkdownWidget(data: text),
            ),
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(
          color: Colors.white, // Color del borde
          width: 1.0, // Grosor del borde
        ),
      ),
      backgroundColor: Colors.black,
      actions: [
        TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                AppTheme.purple.withAlpha(30), // Color del fondo del botón
            foregroundColor: Colors.white, // Color del texto del botón
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // Bordes cuadrados
              side: BorderSide(
                  color: AppTheme.purple.withAlpha(30),
                  width: 1.0), // Borde blanco
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Cierra el diálogo
          },
          child: const Text(
            'Cancel',
          ),
        ),
        TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.purple, // Color del fondo del botón
            foregroundColor: Colors.black, // Color del texto del botón
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // Bordes cuadrados
              side: BorderSide(color: Colors.black, width: 1.0), // Borde blanco
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            scrollController.animateTo(size.height * 3,
                duration: const Duration(seconds: 1), curve: Curves.linear);
          },
          child: const Text(
            'Confirm',
          ),
        ),
      ],
    );
  }
}
