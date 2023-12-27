import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicon/domain/models/speaker.dart';
import 'package:unicon/domain/models/talk.dart';

class TalksContainer extends StateNotifier<List<TalkModel>> {
  TalksContainer()
      : super(
          [
            TalkModel(
              start: "13:10",
              end: "13:40",
              title: "¡Mira lo que puede hacer CSS!",
              description:
                  "CSS no deja de evolucionar rápidamente. Te traigo demos y ejemplos de lo que puedes hacer con CSS ahora",
              speaker: SpeakerModel(
                img: "https://www.miduconf.com/img/speakers/rauchg.jpg",
                name: "Gullermo Rauch",
                job: "CEO @ Vercel",
              ),
            ),
            TalkModel(
              start: "13:10",
              end: "13:40",
              title: "¡Mira lo que puede hacer CSS!",
              description:
                  "CSS no deja de evolucionar rápidamente. Te traigo demos y ejemplos de lo que puedes hacer con CSS ahora",
              speaker: SpeakerModel(
                img: "https://www.miduconf.com/img/speakers/rauchg.jpg",
                name: "Gullermo Rauch",
                job: "CEO @ Vercel",
              ),
            ),
            TalkModel(
              start: "13:10",
              end: "13:40",
              title: "¡Mira lo que puede hacer CSS!",
              description:
                  "CSS no deja de evolucionar rápidamente. Te traigo demos y ejemplos de lo que puedes hacer con CSS ahora",
              speaker: SpeakerModel(
                img: "https://www.miduconf.com/img/speakers/rauchg.jpg",
                name: "Gullermo Rauch",
                job: "CEO @ Vercel",
              ),
            ),
          ],
        );

  Future<bool> getTalks(int code, double payment) async {
    return true;
  }
}

final talksProvider =
    StateNotifierProvider<TalksContainer, List<TalkModel>>((ref) {
  return TalksContainer();
});
