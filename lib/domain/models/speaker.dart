/// Model representing a speaker
class SpeakerModel {
  /// Constructor
  SpeakerModel({
    required this.img,
    required this.name,
    required this.description,
    required this.tags,
    required this.job,
  });

  /// Path to the speaker's image asset
  final String img;

  /// Name of the speaker
  final String name;

  /// Brief description about the speaker
  final String description;

  /// List of topics/keywords related to the speaker
  final List<String> tags;

  /// The speaker's job title
  final String job;
}
