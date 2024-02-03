import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider by Area
class AreaCollection extends StateNotifier<List<String>> {
  /// Default Contructor
  AreaCollection()
      : super(
          <String>[
            'Realidad Virtual (VR) y Realidad Aumentada (AR):',
            'Ciberseguridad',
            'Desarrollo Web y Móvil',
            'Inteligencia Artificial',
            'Big Data y Análisis de Datos',
            'Blockchain y Criptomonedas',
            'Robótica y Automatización',
          ],
        );
}

/// Provider by Areas
final StateNotifierProvider<AreaCollection, List<String>> areasProvider =
    StateNotifierProvider<AreaCollection, List<String>>(
        (StateNotifierProviderRef<AreaCollection, List<String>> ref) {
  return AreaCollection();
});
