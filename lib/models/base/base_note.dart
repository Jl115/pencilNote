/* Abstract class for Notes */
abstract class BaseNote {
  String title;
  String content;
  DateTime dateCreated;
  DateTime dateModified;
  String folderPath;
  String notePath;

  BaseNote(
      {required this.title,
      required this.content,
      required this.dateCreated,
      required this.dateModified,
      required this.folderPath,
      required this.notePath});

  void createNote();
  void changeNoteTitle(String title);
  void changeNoteContent(String content);
  void deleteNote();
  void switchNoteLocation(String folderPath);
}
