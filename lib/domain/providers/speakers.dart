import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicon/domain/models/speaker.dart';

class SpeakerContainer extends StateNotifier<List<SpeakerModel>> {
  SpeakerContainer()
      : super(
          [
            SpeakerModel(
              img: "assets/speakers/chica.png",
              name: "Angelica Guzman",
              job: "Fairplay BE JR",
              tags: [
                "Software Engineer",
                "Opensource",
              ],
              description:
                  "A passionate software developer and technology enthusiast with 2 years of experience in OpenSource projects. I'm always eager to learn new technologies and firmly believe in the power of teamwork and collaboration to achieve meaningful results in software development. My goal is to continue growing and contributing to the field of software development, with a special emphasis on Flutter.",
            ),
            SpeakerModel(
              img: "assets/speakers/chica.png",
              name: "Angelica Guzman",
              job: "Fairplay BE JR",
              tags: [
                "Software Engineer",
                "Opensource",
              ],
              description:
                  "A passionate software developer and technology enthusiast with 2 years of experience in OpenSource projects. I'm always eager to learn new technologies and firmly believe in the power of teamwork and collaboration to achieve meaningful results in software development. My goal is to continue growing and contributing to the field of software development, with a special emphasis on Flutter.",
            ),
            SpeakerModel(
              img: "assets/speakers/chica.png",
              name: "Angelica Guzman",
              job: "Fairplay BE JR",
              tags: [
                "Software Engineer",
                "Opensource",
              ],
              description:
                  "A passionate software developer and technology enthusiast with 2 years of experience in OpenSource projects. I'm always eager to learn new technologies and firmly believe in the power of teamwork and collaboration to achieve meaningful results in software development. My goal is to continue growing and contributing to the field of software development, with a special emphasis on Flutter.",
            ),
            SpeakerModel(
              img: "assets/speakers/chica.png",
              name: "Angelica Guzman",
              job: "Fairplay BE JR",
              tags: [
                "Software Engineer",
                "Opensource",
              ],
              description:
                  "A passionate software developer and technology enthusiast with 2 years of experience in OpenSource projects. I'm always eager to learn new technologies and firmly believe in the power of teamwork and collaboration to achieve meaningful results in software development. My goal is to continue growing and contributing to the field of software development, with a special emphasis on Flutter.",
            ),
            SpeakerModel(
              img: "assets/speakers/chica.png",
              name: "Angelica Guzman",
              job: "Fairplay BE JR",
              tags: [
                "Software Engineer",
                "Opensource",
              ],
              description:
                  "A passionate software developer and technology enthusiast with 2 years of experience in OpenSource projects. I'm always eager to learn new technologies and firmly believe in the power of teamwork and collaboration to achieve meaningful results in software development. My goal is to continue growing and contributing to the field of software development, with a special emphasis on Flutter.",
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
