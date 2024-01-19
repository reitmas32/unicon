import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicon/domain/models/our.dart';

class OurContainer extends StateNotifier<List<OurModel>> {
  OurContainer()
      : super(
          [
            OurModel(
              title: "Our Vision",
              description:
                  "We envision a global community where tech enthusiasts and change-makers unite. Our goal is to spark inspiration, encourage boundless innovation, and nurture dreams in the ever-evolving world of computing.",
            ),
            OurModel(
              title: "Our Values",
              description:
                  "Our congress thrives on a passion for technology, embracing collaboration and networking. We champion diversity and creativity, fostering an environment where every idea propels growth and innovation in computing.",
            ),
            OurModel(
              title: "Our Goals",
              description:
                  "Our aim is to empower individuals in the tech realm, fostering a collaborative community that nurtures innovation. We strive to inspire creativity, challenge the status quo, and expand the horizons of what's possible in computing.",
            )
          ],
        );
}

final oursProvider = StateNotifierProvider<OurContainer, List<OurModel>>((ref) {
  return OurContainer();
});
