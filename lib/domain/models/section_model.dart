/// /// Represents a section model with a name, content, id and active state
class SectionModel<T> {
  /// Contructor
  SectionModel({
    required this.name,
    required this.content,
    this.active = false,
  }) {
    this.id = SectionModel._id;
    SectionModel._id += 1;
  }

  /// The name of the section
  final String name;

  /// The content of the section
  final T content;

  /// Whether this section is currently active/selected
  late bool active;

  /// A unique id for this section
  late final int id;

  /// Incrementing id for each section
  static int _id = 0;
}
