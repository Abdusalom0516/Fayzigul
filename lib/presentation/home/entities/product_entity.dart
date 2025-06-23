class ProductEntity {
  String name, description, origin, instruction, massType;

  double price, mass;
  int id, quantity;
  List<Map<String, String>> basicKnowladge, stages;
  List<String> images, categories;

  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.origin,
    required this.basicKnowladge,
    required this.description,
    required this.instruction,
    required this.mass,
    required this.massType,
    required this.quantity,
    required this.stages,
    required this.categories,
    required this.images,
  });
}
