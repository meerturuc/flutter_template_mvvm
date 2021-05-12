class ImageConstants {
  static ImageConstants? _instance;

  static ImageConstants get instance => _instance ??= ImageConstants.init();

  ImageConstants.init();

  String get logo => toPng('veli');

  String toPng(String name) => 'asset/image/$name.png';
}
