class SectionModel<T> {
  SectionModel({
    required this.name,
    required this.content,
    this.active = false,
  }) {
    this.id = SectionModel._id;
    SectionModel._id += 1;
  }

  static int _id = 0;

  String name;
  T content;
  late int id;
  bool active;
}
