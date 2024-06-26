import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicon/domain/models/our.dart';

/// Container By Ours
class OurContainer extends StateNotifier<List<OurModel>> {
  /// Default constructor
  OurContainer()
      : super(
          <OurModel>[
            OurModel(
              title: 'Nuestra Visión',
              description: '''
Imaginamos una comunidad global donde se unen los entusiastas de la tecnología y los agentes de cambio. Nuestro objetivo es generar inspiración, fomentar la innovación ilimitada y fomentar los sueños en el mundo de la informática en constante evolución.''',
            ),
            OurModel(
              title: 'Nuestros Valores',
              description: '''
Nuestro congreso se nutre de la pasión por la tecnología, abrazando la colaboración y el networking. Defendemos la diversidad y la creatividad, fomentando un entorno donde cada idea impulsa el crecimiento y la innovación en la informática.''',
            ),
            OurModel(
              title: 'Nuestros Objetivos',
              description: '''
Nuestro objetivo es empoderar a las personas en el ámbito tecnológico, fomentando una comunidad colaborativa que fomente la innovación. Nos esforzamos por inspirar la creatividad, desafiar el status quo y ampliar los horizontes de lo que es posible en informática.''',
            ),
          ],
        );
}

/// Provider by ours
final StateNotifierProvider<OurContainer, List<OurModel>> oursProvider =
    StateNotifierProvider<OurContainer, List<OurModel>>(
        (StateNotifierProviderRef<OurContainer, List<OurModel>> ref) {
  return OurContainer();
});
