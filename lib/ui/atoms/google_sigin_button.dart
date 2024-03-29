import 'package:flutter/material.dart';

/// GoogleButton Authentication
class GoogleSignInButton extends StatelessWidget {
  /// Constructor
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black, // Color del fondo del botón
        foregroundColor: Colors.white, // Color del texto del botón
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.white), // Borde blanco
        ),
      ),
      onPressed: () {
        // Lógica para el inicio de sesión con Google
      },
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              child: GoogleLogo(
                size: 20,
              ),
            ),
            Center(child: Text('Sign in with Google')),
          ],
        ),
      ),
    );
  }
}

/// GoogleLogo
class GoogleLogo extends StatelessWidget {
  /// Contructor
  const GoogleLogo({super.key, this.size = 300});

  /// Size of logo
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child:
          CustomPaint(painter: _GoogleLogoPainter(), size: Size.square(size)),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  bool shouldRepaint(_) => true;

  @override
  void paint(Canvas canvas, Size size) {
    final double length = size.width;
    final double verticalOffset = (size.height / 2) - (length / 2);
    final Rect bounds = Offset(0, verticalOffset) & Size.square(length);
    final Offset center = bounds.center;
    final double arcThickness = size.width / 4.5;

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = arcThickness;

    void drawArc(double startAngle, double sweepAngle, Color color) {
      final Paint paint0 = paint..color = color;
      canvas.drawArc(bounds, startAngle, sweepAngle, false, paint0);
    }

    drawArc(3.5, 1.9, Colors.red);
    drawArc(2.5, 1.0, Colors.amber);
    drawArc(0.9, 1.6, Colors.green.shade600);
    drawArc(-0.18, 1.1, Colors.blue.shade600);

    canvas.drawRect(
      Rect.fromLTRB(
        center.dx,
        center.dy - (arcThickness / 2),
        bounds.centerRight.dx + (arcThickness / 2) - 4,
        bounds.centerRight.dy + (arcThickness / 2),
      ),
      paint
        ..color = Colors.blue.shade600
        ..style = PaintingStyle.fill
        ..strokeWidth = 0,
    );
  }
}
