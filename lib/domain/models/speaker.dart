class SpeakerModel {
  SpeakerModel({
    required this.img,
    required this.name,
    required this.tags,
    required this.description,
    required this.job,
  });

  final String img;
  final String name;
  final String description;
  final List<String> tags;
  final String job;
}
