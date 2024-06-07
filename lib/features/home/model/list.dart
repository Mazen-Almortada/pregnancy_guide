class ModelList {
  final String name;
  final String count;
  final String imageUrl;

  ModelList({required this.imageUrl, required this.name, required this.count});
}

List<ModelList> categoryData = [
  ModelList(imageUrl: "assets/images/logo.png", name: "TOPS", count: "6"),
  ModelList(imageUrl: "assets/images/logo.png", name: "BOTTOMS", count: "6"),
  ModelList(imageUrl: "assets/images/logo.png", name: "DRESSES", count: "6"),
  ModelList(imageUrl: "assets/images/logo.png", name: "COATS", count: "6"),
  ModelList(imageUrl: "assets/images/logo.png", name: "SUITS", count: "6"),
];
