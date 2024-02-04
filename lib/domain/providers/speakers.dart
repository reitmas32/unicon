import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicon/domain/models/speaker.dart';

/// Contains the Speakers
class SpeakerContainer extends StateNotifier<List<SpeakerModel>> {
  /// Default constructor
  SpeakerContainer()
      : super(
          <SpeakerModel>[
            SpeakerModel(
              img: 'assets/speakers/chica.png',
              name: 'Angelica Guzman',
              job: 'Fairplay BE JR',
              tags: <String>[
                'Software Engineer',
                'Opensource',
              ],
              description: '''
A passionate software developer and technology enthusiast with 2 years of experience in OpenSource projects. I'm always eager to learn new technologies and firmly believe in the power of teamwork and collaboration to achieve meaningful results in software development. My goal is to continue growing and contributing to the field of software development, with a special emphasis on Flutter.''',
            ),
            SpeakerModel(
              img: 'assets/speakers/chica.png',
              name: 'Angelica Guzman',
              job: 'Fairplay BE JR',
              tags: <String>[
                'Software Engineer',
                'Opensource',
              ],
              description: '''
A passionate software developer and technology enthusiast with 2 years of experience in OpenSource projects. I'm always eager to learn new technologies and firmly believe in the power of teamwork and collaboration to achieve meaningful results in software development. My goal is to continue growing and contributing to the field of software development, with a special emphasis on Flutter.''',
            ),
            SpeakerModel(
              img: 'assets/speakers/chica.png',
              name: 'Angelica Guzman',
              job: 'Fairplay BE JR',
              tags: <String>[
                'Software Engineer',
                'Opensource',
              ],
              description: '''
A passionate software developer and technology enthusiast with 2 years of experience in OpenSource projects. I'm always eager to learn new technologies and firmly believe in the power of teamwork and collaboration to achieve meaningful results in software development. My goal is to continue growing and contributing to the field of software development, with a special emphasis on Flutter.''',
            ),
            SpeakerModel(
              img: 'assets/speakers/chica.png',
              name: 'Angelica Guzman',
              job: 'Fairplay BE JR',
              tags: <String>[
                'Software Engineer',
                'Opensource',
              ],
              description: '''
A passionate software developer and technology enthusiast with 2 years of experience in OpenSource projects. I'm always eager to learn new technologies and firmly believe in the power of teamwork and collaboration to achieve meaningful results in software development. My goal is to continue growing and contributing to the field of software development, with a special emphasis on Flutter.''',
            ),
            SpeakerModel(
              img: 'assets/speakers/chica.png',
              name: 'Angelica Guzman',
              job: 'Fairplay BE JR',
              tags: <String>[
                'Software Engineer',
                'Opensource',
              ],
              description: '''
A passionate software developer and technology enthusiast with 2 years of experience in OpenSource projects. I'm always eager to learn new technologies and firmly believe in the power of teamwork and collaboration to achieve meaningful results in software development. My goal is to continue growing and contributing to the field of software development, with a special emphasis on Flutter.''',
            ),
          ],
        );
}

/// Provider of Speakers
final StateNotifierProvider<SpeakerContainer, List<SpeakerModel>>
    speakersProvider =
    StateNotifierProvider<SpeakerContainer, List<SpeakerModel>>(
        (StateNotifierProviderRef<SpeakerContainer, List<SpeakerModel>> ref) {
  return SpeakerContainer();
});
