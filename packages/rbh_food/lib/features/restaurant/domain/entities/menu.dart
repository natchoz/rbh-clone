class Menu {
  const Menu({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.active,
    this.description,
  });

  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final bool active;
  final String? description;
}
