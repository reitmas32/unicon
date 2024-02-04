import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicon/domain/models/speaker.dart';
import 'package:unicon/domain/models/talk.dart';

/// Contains the Talks
class TalksContainer extends StateNotifier<List<TalkModel>> {
  /// Default constructor
  TalksContainer()
      : super(
          <TalkModel>[
            TalkModel(
              start: '13:10',
              end: '13:40',
              title: '¡Mira lo que puede hacer CSS!',
              description: '''
CSS no deja de evolucionar rápidamente. Te traigo demos y ejemplos de lo que puedes hacer con CSS ahora''',
              speaker: SpeakerModel(
                img: 'https://www.miduconf.com/img/speakers/rauchg.jpg',
                name: 'Angelica Guzman',
                job: 'Fairplay BE JR',
                tags: <String>[
                  'Software Engineer',
                  'Opensource',
                ],
                description: '''
A passionate software developer and technology enthusiast with 2 years of experience in OpenSource projects. I'm always eager to learn new technologies and firmly believe in the power of teamwork and collaboration to achieve meaningful results in software development. My goal is to continue growing and contributing to the field of software development, with a special emphasis on Flutter.''',
              ),
            ),
            TalkModel(
              start: '13:10',
              end: '13:40',
              title: '¡Mira lo que puede hacer CSS!',
              description: '''
CSS no deja de evolucionar rápidamente. Te traigo demos y ejemplos de lo que puedes hacer con CSS ahora''',
              speaker: SpeakerModel(
                img: 'https://www.miduconf.com/img/speakers/rauchg.jpg',
                name: 'Angelica Guzman',
                job: 'Fairplay BE JR',
                tags: <String>[
                  'Software Engineer',
                  'Opensource',
                ],
                description: '''
A passionate software developer and technology enthusiast with 2 years of experience in OpenSource projects. I'm always eager to learn new technologies and firmly believe in the power of teamwork and collaboration to achieve meaningful results in software development. My goal is to continue growing and contributing to the field of software development, with a special emphasis on Flutter.''',
              ),
            ),
            TalkModel(
              start: '13:10',
              end: '13:40',
              title: '¡Mira lo que puede hacer CSS!',
              description: '''
CSS no deja de evolucionar rápidamente. Te traigo demos y ejemplos de lo que puedes hacer con CSS ahora''',
              speaker: SpeakerModel(
                img: 'https://www.miduconf.com/img/speakers/rauchg.jpg',
                name: 'Angelica Guzman',
                job: 'Fairplay BE JR',
                tags: <String>[
                  'Software Engineer',
                  'Opensource',
                ],
                description: '''
A passionate software developer and technology enthusiast with 2 years of experience in OpenSource projects. I'm always eager to learn new technologies and firmly believe in the power of teamwork and collaboration to achieve meaningful results in software development. My goal is to continue growing and contributing to the field of software development, with a special emphasis on Flutter.''',
              ),
            ),
          ],
        );
}

/// Provider of Talks
final StateNotifierProvider<TalksContainer, List<TalkModel>> talksProvider =
    StateNotifierProvider<TalksContainer, List<TalkModel>>(
        (StateNotifierProviderRef<TalksContainer, List<TalkModel>> ref) {
  return TalksContainer();
});
