import 'package:flutter_riverpod/flutter_riverpod.dart';

class AreaCollection extends StateNotifier<List<String>> {
  AreaCollection()
      : super(
          [
            "Realidad Virtual (VR) y Realidad Aumentada (AR):",
            "Ciberseguridad",
            "Desarrollo Web y Móvil",
            "Inteligencia Artificial",
            "Big Data y Análisis de Datos",
            "Blockchain y Criptomonedas",
            "Robótica y Automatización",
          ],
        );
}

final areasProvider =
    StateNotifierProvider<AreaCollection, List<String>>((ref) {
  return AreaCollection();
});
