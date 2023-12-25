import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicon/domain/models/speaker.dart';

class SpeakerContainer extends StateNotifier<List<SpeakerModel>> {
  SpeakerContainer()
      : super(
          [
            SpeakerModel(
              img: "https://www.miduconf.com/img/speakers/rauchg.jpg",
              name: "Gullermo Rauch",
              job: "CEO @ Vercel",
            ),
            SpeakerModel(
              img: "https://www.miduconf.com/img/speakers/carmen.jpg",
              name: "Carmen Ansio",
              job: "UX Engineer Freelance",
            ),
            SpeakerModel(
              img: "https://www.miduconf.com/img/speakers/david.jpg",
              name: "David Bonilla",
              job: "CEO @ Manfred",
            ),
            SpeakerModel(
              img: "https://www.miduconf.com/img/speakers/debbie.jpg",
              name: "Gullermo Rauch",
              job: "CEO @ Vercel",
            ),
            SpeakerModel(
              img: "https://www.miduconf.com/img/speakers/frr149.jpg",
              name: "Carmen Ansio",
              job: "UX Engineer Freelance",
            ),
            SpeakerModel(
              img: "https://www.miduconf.com/img/speakers/nerea.jpg",
              name: "David Bonilla",
              job: "CEO @ Manfred",
            ),
            SpeakerModel(
              img: "https://www.miduconf.com/img/speakers/fernando.jpg",
              name: "Carmen Ansio",
              job: "UX Engineer Freelance",
            ),
            SpeakerModel(
              img: "https://www.miduconf.com/img/speakers/east.jpg",
              name: "David Bonilla",
              job: "CEO @ Manfred",
            ),
          ],
        );

  Future<bool> getSpeakers(int code, double payment) async {
    return true;
  }
}

final speakersProvider =
    StateNotifierProvider<SpeakerContainer, List<SpeakerModel>>((ref) {
  return SpeakerContainer();
});
