class Category {
  int? id; // bisa null
  String name;
  String image;
  bool isSelected;

  Category({
    this.id, // optional
    required this.name, 
    required this.image, 
    this.isSelected = false, // default false
  });
}