class Food{
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  final List<Addons> addons;
  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.addons
  });
}

enum FoodCategory{
  burgers,
  salads,
  sides,
  drinks,
  desserts,
}

class Addons{
  final String name;
  final double price;
  Addons({required this.name,required this.price});
}