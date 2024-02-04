import 'package:unicon/domain/models/speaker.dart';

/// Model representing a conference talk
class TalkModel {
  /// Constructor
  TalkModel({
    required this.start,
    required this.end,
    required this.title,
    required this.description,
    required this.speaker,
  });

  /// Start time of the talk
  final String start;

  /// End time of the talk
  final String end;

  /// Title of the talk
  final String title;

  /// Description summarizing the talk
  final String description;

  /// The speaker giving this talk
  final SpeakerModel speaker;
}
