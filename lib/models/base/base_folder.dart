abstract class BaseFolder {
  String path;

  BaseFolder({required this.path});

  void createFolder(String name);
  void changeFolderName(String name);
  void deleteFolder(String name);
  void switchFolderLocation(String path);
}
