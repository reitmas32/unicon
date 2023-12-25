import 'package:unicon/domain/models/speaker.dart';

class TalkModel {
  TalkModel({
    required this.start,
    required this.end,
    required this.title,
    required this.description,
    required this.speaker,
  });

  final String start;
  final String end;

  final String title;
  final String description;
  final SpeakerModel speaker;
}
